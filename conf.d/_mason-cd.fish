# Go
function g -d 'Change directory and look up'
  if test -z $argv # if no argument
    cd -
  else if not test -e $argv # If the file does not exist
    set_color $red
    echo ''
    cd $argv
    echo ''
    set_color normal
  else
    cd $argv
  end

  ls -AF .
end
abbr --add gh 'g $HOME'

# See

## Let ls (eza) to use the ISO date and time format. See https://www.gnu.org/software/coreutils/manual/html_node/Formatting-file-timestamps.html
set -gx TIME_STYLE long-iso

function s -d 'List files in details'
  if type -q eza
    eza --classify --links --long --all --color=always $argv
  else
    ls -AFlh $argv
  end
end
function st -d 'List files a tree style'
  s --tree --level 3 $argv
end
function sf -d 'List files with filter'
  s | rg -i $argv
end
