function app-update --description 'Update with Homebrew and Nodejs'
  set os (uname)

  if test $os = 'Linux'
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

  if type -q yarn >/dev/null
    log info 'Updating yarn modules...'
    yarn global upgrade --latest --caret --slient --no-progress >/dev/null
  end

  if type -q npm >/dev/null
    log info 'Updating NPM modules...'
    npm -g install npm
    npm -g update
  end

  if type -q fisher >/dev/null
    log info 'Updating fisherman modules...'
    fisher self-update
    fisher
  end
end