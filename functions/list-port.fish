function list-port -d 'List all listening TCP ports'
  set os (uname)
  if test $os = 'Darwin'
    lsof -i -P -n | grep -i 'listen'
  else if test $os = 'Linux'
    sudo ss -tlpn
  else
    log error 'Do not know to how get open ports on '$os
  end
end
