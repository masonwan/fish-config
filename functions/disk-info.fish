function disk-info -d 'Show the disk name, size, and model'
  lsblk -ndo NAME,SIZE,MODEL
end
