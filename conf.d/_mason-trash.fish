function d -d 'Trash'
  if type -q trash-put > /dev/null
    set_color $yellow
    printf 'Trashing file \"%s\"\n' $argv
    set_color normal
    trash-put $argv
  else if type -q trash > /dev/null
    trash -v $argv
  else
    log warn 'No trash program is available'
    rm -ri $argv
  end
end

function ddd -d 'Remove directory without prompt'
  rm -rf $argv
end
