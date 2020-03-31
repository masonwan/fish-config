function my-ip -d 'Show private and public IP addresses'
  set os (uname)

  if test $os = 'Linux'
    log info 'Private IP: '(hostname -I)
  else if test $os = 'Darwin'
    log info 'Private IP: '(ipconfig getifaddr en0)
  end
end
