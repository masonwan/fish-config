function disk-info -d 'Show the disk name, size, and model'
  lsblk -o NAME,SIZE,FSTYPE,MODEL,MOUNTPOINT,UUID,LABEL
end
