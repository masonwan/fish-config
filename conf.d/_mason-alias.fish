abbr f 'find -L . -name'
abbr p 'ps -ef'
abbr pf 'ps -ef | rg'

abbr ipinfo 'curl -s ipinfo.io | jq'
abbr ipinfo2 'curl api.ip2location.io | jq'

# Run network speed test against mwan.dev
abbr ssh-speed-test "dd if=/dev/zero bs=1G count=1 | pv -s 1G | ssh mwan.dev 'cat > /dev/null'"

# Universal fd binary alias (fd on macOS/BSD/Arch, fdfind on Debian/Ubuntu)
if not type -q fd; and type -q fdfind
  alias fd fdfind
end

abbr find-trashes "fd --hidden -E .Trash-1000 -E Trash '^\._'"
abbr trash-trashes "fd --hidden -E .Trash-1000 -E Trash '^\._' -x fish -c 'd {}'"

function find-string -d 'Find string in all files under current directory using ripgrep'
  rg -i $argv
end

function last-of -d "Find the latest matching file"
  ls -tr | rg $argv | tail -1
end

function check-last -d "Run less on the latest matching file"
  set -l file (last-of $argv)
  log info "Checking file: $file"
  less $file
end

function color-test -d 'Print 24-bit colors on the screen'
  curl -s https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash
end
