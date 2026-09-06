for brew_path in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew /usr/local/bin/brew
    if test -x $brew_path
        eval ($brew_path shellenv | string collect)
        break
    end
end
