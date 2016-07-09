function d -d 'Trash'
  if type trash-put > /dev/null
    set_color $yellow
    printf 'Trashing file \"%s\"\n' $argv
    set_color normal
    trash-put $argv
  else if type trash > /dev/null
    set_color $yellow
    printf 'Trashing file \"%s\"\n' $argv
    set_color normal
    trash -av $argv
  else
    log warn 'No trash program is available'
    rm -ri $argv
  end
end
