alias f 'find -L . -name'
alias p 'ps -ef'
alias pf 'ps -ef | rg'

alias ipinfo 'curl ipinfo.io | jq'
alias ipinfo2 'curl api.ip2location.io | jq'

function find-string -d 'Find string in all files under current directory. http://explainshell.com/explain?cmd=grep+-rnw+.+-H+-e+%24argv '
  grep -rni * -e $argv
end

function last-of -d "Find the latest matching file"
  ls -tr | grep $argv | tail -1
end

function check-last -d "Run less on the latest matching file"
  set file (last-of $argv)
  log info 'Checking file:'$file
  less $file
end

function color-test -d 'Print 24-bit colors on the screen'
  curl -s https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash
end

function e -d 'Start the vim with proper permission'
  set -l editors
  set -a editors /usr/bin/editor # Use update-alternatives, Debian's CLI version management.
  set -a editors hx # Helix
  set -a editors nvim
  set -a editors vim
  set -a editors vi
  set -a editors nano

  for editor in $editors
    if command -q $editor
      break
    end
  end

  if stat -c '%U' $argv | grep -q '^root$' # If the file is owned by root
    log warn 'This file is owned by root, opening with sudo'
    sleep 1
    sudo -e $argv
  else
    $editor $argv
  end
end

function v -d 'View the files'
  # -M: Show name, position, and progress.
  # -R: Show raw control characters, so color could work.
  # -i: Makes searches case-insensitive
  less -MRi $argv
end
