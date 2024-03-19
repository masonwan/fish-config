function app-update -d 'Update apps'

  if type -q fisher >/dev/null
    log info 'List of Fisher plugins:'
    fisher ls
    log info 'Updating Fish shell plugins...'
    fisher update > /dev/null
  end

  # `/usr/bin/apt` is "annotation processing tool" on MacOS. So here it checks the platform first.
  if test (uname) = 'Linux'
    if type -q apt
      log info 'Updating Advanced Package Tool (APT) packages...'
      sudo apt update
      sudo apt dist-upgrade -y
      sudo apt upgrade -y
      sudo apt autoremove -y
    end
  end

  if type -q brew
    log info 'Updating Homebrew modules...'
    brew update
    brew upgrade
    brew autoremove
  end

  if type -q nvm
    log info 'Upgrading Node.js...'
    nvm list-remote latest > /dev/null
    nvm install latest
    
    log info 'Removing the older Node.js versions...'
    node ~/.config/fish/conf.d/_mason-remove-old-node-versions.mjs
  end

  if type -q npm
    log info 'Updating NPM modules...'
    npm -g install npm > /dev/null
    npm -g update > /dev/null
  end
end
