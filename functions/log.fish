function log -d 'Print message with colors from http://clrs.cc/'
  set argv_count (count $argv)
  if test $argv_count -lt 1
    log warn 'No message is found'
    return
  end

  if test $argv_count -eq 1
    set_color --bold white
    echo $argv
    set_color normal
    return
  end

  if test "$argv[1]" = 'error'
    set_color --bold FF4136
    printf '%s\n' "$argv[2..-1]"
    set_color normal
  else if test "$argv[1]" = 'warn'
    set_color --bold FFDC00
    printf '%s\n' "$argv[2..-1]"
    set_color normal
  else if test "$argv[1]" = 'info'
    set_color --bold 2ECC40
    printf '%s\n' "$argv[2..-1]"
    set_color normal
  else
    set_color --bold white
    printf '%s\n' "$argv"
    set_color normal
  end
end
