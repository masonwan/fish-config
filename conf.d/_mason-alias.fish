alias f 'find -L . -name'
alias p 'ps -ef'
alias pf 'ps -ef | grep'
alias disk-space 'df -h'
alias ipinfo 'curl ipinfo.io'

function find-string -d 'Find string in all files under current directory'
  grep -rnw . -H -e $argv
end

function does-exist
  return (type $argv > /dev/null)
end

function last-of -d "Find the latest matching file"
  ls -tr | grep $argv | tail -1
end

function check-last -d "Run less on the latest matching file"
  set file (last-of $argv)
  log info 'Checking file:'$file
  less $file
end

function e -d 'Start the vim with proper permission'
  if test -f $argv
    if test -w $argv
      vim $argv
    else
      sudo vim $argv
    end
  else
    vim $argv
  end
end

function v -d 'View the files'
  less -R $argv
end
