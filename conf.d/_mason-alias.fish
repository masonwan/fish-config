alias f 'find -L . -name'
alias p 'ps -ef'
alias pf 'ps -ef | rg'

alias ipinfo 'curl -s ipinfo.io | jq'
alias ipinfo2 'curl api.ip2location.io | jq'
alias ssh-speed-test 'dd if=/dev/zero bs=1G count=1 | ssh home.masonwan.com 'cat > /dev/null''

function find-string -d 'Find string in all files under current directory. http://explainshell.com/explain?cmd=grep+-rnw+.+-H+-e+%24argv '
  grep -rni * -e $argv
end

function last-of -d "Find the latest matching file"
  ls -tr | grep $argv | tail -1
end

function check-last -d "Run less on the latest matching file"
  set file (last-of $argv)
  log info 'Checking file:'$file
  less $file
end

function color-test -d 'Print 24-bit colors on the screen'
  curl -s https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash
end

