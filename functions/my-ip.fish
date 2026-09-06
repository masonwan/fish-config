function my-ip -d 'Show private and public IP addresses'
  set os (uname)

  if test $os = 'Linux'
    set -l private_ip (hostname -I 2>/dev/null | string trim)
    test -n "$private_ip"; and log info "Private IP: $private_ip"
  else if test $os = 'Darwin'
    set -l private_ip (ipconfig getifaddr en0 2>/dev/null)
    test -n "$private_ip"; and log info "Private IP: $private_ip"
  end

  set -l public_ip (curl -fsSL --connect-timeout 2 https://icanhazip.com 2>/dev/null; or curl -fsSL --connect-timeout 2 https://ifconfig.me 2>/dev/null)
  if test -n "$public_ip"
    log info "Public IP:  "(string trim "$public_ip")
  end
end
