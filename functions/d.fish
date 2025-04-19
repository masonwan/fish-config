function d -d 'Delete files. Use `trash-put` if available. Otherwise it will prompt to use `rm`.'
  if type -q trash-put
    log warn "Trashing file '$argv'"
    trash-put $argv
  else
    log error 'No trash program is available. The deleted file will not recoverable.'
    rm -ri $argv
  end
end
