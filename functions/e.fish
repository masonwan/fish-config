function e -d 'Edit a file with proper permission'
  if not set -q EDITOR
    log warn '$EDITOR is not set'
    return 1
  end

  set -l file $argv[1]

  if not test -e "$file"
    log warn "File does not exist, creating: $file"
    sleep 1
    touch "$file"
  end

  # Check if the file is owned by root.
  set -l owner
  if test (uname) = Darwin
    set owner (stat -f '%Su' "$file")
  else
    set owner (stat -c '%U' "$file")
  end

  if test "$owner" = root
    log warn 'This file is owned by root, opening with sudo'
    sleep 1
    sudo -e "$file"
  else
    $EDITOR "$file"
  end
end
