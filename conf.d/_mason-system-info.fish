function system-info -d 'Print the system information'
  free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%)\n", $3,$2,$3*100/$2 }'
  df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
  top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
end

function open-file-info -d 'Print the number of the open file descripters for each process'
  lsof -n | awk '{print $1 " " $2}' | uniq -c | sort -n
end

function show-proc -d 'Print the detail of a process'
  # https://explainshell.com/explain?cmd=ps+auxww+123
  ps auxww $argv
end

function list-block-devices -d 'List all block devices'
  lsblk
end
