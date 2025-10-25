function disk-info -d 'Show the drive, partition, and mount info'
  lsblk -o MODEL,SERIAL,NAME,SIZE,FSTYPE,MOUNTPOINT,LABEL
end
