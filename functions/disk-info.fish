function disk-info -d 'Show the disk name, size, and model'
  lsblk -o NAME,SIZE,MODEL,MOUNTPOINTS
end
