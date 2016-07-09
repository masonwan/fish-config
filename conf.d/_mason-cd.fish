# Go
function g -d 'Change directory and look up'
  set is_okay true
  if test -z $argv
    cd -
  else
    if test -e $argv
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
function s -d 'List files in details'
  ls -AFlh $argv
end
function st -d 'List files ordered from oldest to newest'
  s -tr
end
function sf -d 'List files with filter'
  s | grep $argv
end