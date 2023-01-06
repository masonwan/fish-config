function app-update -d 'Update apps'

  if type -q fisher >/dev/null
    log info 'Updating fisherman modules...'
    fisher update
  end

  if test (uname) = 'Linux' # `apt` is available in MacOS
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
    brew cleanup
  end

  if type -q nvm >/dev/null
    log info 'Upgrading Node.js...'
    nvm list-remote latest
    nvm install latest
    
    log info 'Removing the older Node.js versions...'
    node ~/.config/fish/conf.d/_mason-remove-old-node-versions.mjs
  end

  if type -q npm >/dev/null
    log info 'Updating NPM modules...'
    npm -g install npm
    npm -g update
  end
end
