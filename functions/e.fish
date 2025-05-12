function e -d 'Start the vim with proper permission'
  set -l editors
  set -a editors /usr/bin/editor # Use update-alternatives, Debian's CLI version management.
  set -a editors hx # Helix
  set -a editors nvim
  set -a editors vim
  set -a editors vi
  set -a editors nano

  for editor in $editors
    if command -q $editor
      break
    end
  end

  if stat -c '%U' $argv | grep -q '^root$' # If the file is owned by root
    log warn 'This file is owned by root, opening with sudo'
    sleep 1
    sudo -e $argv
  else
    $editor $argv
  end
end
