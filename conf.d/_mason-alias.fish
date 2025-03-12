alias f 'find -L . -name'
alias p 'ps -ef'
alias pf 'ps -ef | grep'
alias disk-space 'df -h'
alias ipinfo 'curl ipinfo.io'

function find-string -d 'Find string in all files under current directory. http://explainshell.com/explain?cmd=grep+-rnw+.+-H+-e+%24argv '
  grep -rni * -e $argv
end

function does-exist
  return (type -q $argv > /dev/null)
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
  set -l editors \
    hx \
    nvim \
    vim \
    vi \
    nano
  
  for editor in $editors
    if command -q $editor
      break
    end
  end

  $editor $argv

  # if [ -f $argv ] # Is a file?
  #   if [ -w $argv ] # Is writable?
  #     $editor $argv
  #   else
  #     sudo $editor $argv
  #   end
  # else
  #   log error 'The target is not a file'
  # end
end

function v -d 'View the files'
  less -Ri $argv
end
