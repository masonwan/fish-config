function list-port -d 'List all TCP ports'
  set os (uname)
  if test $os = 'Darwin'
    lsof -i -P -n | grep -i 'listen'
  else if test $os = 'Linux'
    netstat -lptn
  else
    log error 'Do not know to how get open ports on '$os
  end
end

function list-port-sudo -d 'List all TCP ports with the binary path'
  set os (uname)
  if test $os = 'Darwin'
    lsof -i -P -n | grep -i 'listen'
  else if test $os = 'Linux'
    sudo netstat -lptn
  else
    log error 'Do not know to how get open ports on '$os
  end
end
