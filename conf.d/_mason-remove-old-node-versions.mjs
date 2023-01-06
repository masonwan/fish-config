import child_process from 'child_process'
import { promisify } from 'util'

const exec = promisify(child_process.exec)

const options = {
  shell: process.env.SHELL,
}
exec('nvm list', options)
  .then(({ stdout }) => {
    const removingVersions = []
    stdout.split('\n').forEach((line) => {
      line = line.trim()
      const results = line.match(/\W*(?<version>v[\d.]+)\s*(?<tag>\S*)/)
      if (results == null) {
        return
      }
      const { version, tag } = results.groups
      if (tag === 'latest') return
      removingVersions.push(version)
    })

    const promises = removingVersions
      .map((version) => {
        console.log(`Removing ${version}...`)
        const removingCommand = `nvm uninstall ${version}`
        return exec(removingCommand, options)
          .catch((err) => {
            console.error(`Failed to remove ${version}: `, err)
          })
      })
    return Promise.all(promises)
  })
  .catch((err) => {
    console.error(`Failed to run '${command}': `, err)
  })
