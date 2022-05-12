# Go
function g -d 'Change directory and look up'
  set is_okay true
  if test -z $argv # if no argument
    cd -
  else
    if test -e $argv # if the file exists
      cd $argv
    else
      set is_okay false
      set_color $red
      echo 'Cannot find "'$argv'"'
      set_color normal
    end
  end

  if eval $is_okay
    ls -AF .
  end
end
alias gh 'g $HOME'
alias gconfig 'g $HOME/.config/fish/'
alias grepo 'g $HOME/repos/'
alias .. 'g ..'
alias ... 'g ../..'
alias .... 'g ../../..'
alias ..... 'g ../../../..'

# See

## Let ls (exa) to use the ISO date and time format. See https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
set -gx TIME_STYLE long-iso

function s -d 'List files in details'
  if type -q exa;
    exa -lag $argv
  else;
    ls -AFlh $argv
  end
end
function st -d 'List files ordered from oldest to newest'
  s -tr
end
function sf -d 'List files with filter'
  s | grep $argv
end
