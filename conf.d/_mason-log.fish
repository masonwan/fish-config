# Define colors from <http://clrs.cc/>
set -gx navy '001F3F'
set -gx blue '0074D9'
set -gx aqua '7FDBFF'
set -gx teal '39CCCC'
set -gx olive '3D9970'
set -gx green '2ECC40'
set -gx lime '01FF70'
set -gx yellow 'FFDC00'
set -gx orange 'FF851B'
set -gx red 'FF4136'
set -gx maroon '85144B'
set -gx fuchsia 'F012BE'
set -gx purple 'B10DC9'
set -gx black '111111'
set -gx gray 'AAAAAA'

# Logging
function log -d 'Print message with color'
  set argv_count (count $argv)
  if test $argv_count -lt 1
    log warn 'No message is found'
    return
  end

  if test $argv_count -eq 1
    echo $argv
    return
  end

  if [ $argv[1] = 'error' ]
    set_color $red
    printf $argv[2..-1]'\n'
    set_color normal
  else if [ $argv[1] = 'warn' ]
    set_color $yellow
    printf $argv[2..-1]'\n'
    set_color normal
  else if [ $argv[1] = 'info' ]
      set_color $green
      printf $argv[2..-1]'\n'
      set_color normal
  else
    printf $argv'\n'
  end
end
