function e -d 'Edit a file with proper permission'
  if not set -q EDITOR
    log warn '$EDITOR is not set'
    return 1
  end

  if test (count $argv) -eq 0
    $EDITOR
    return
  end

  set -l file $argv[1]
  set -l target $file
  if not test -e "$target"
    set target (dirname "$target")
  end

  # Check if the target file or parent directory is owned by root.
  set -l owner
  if test (uname) = Darwin
    set owner (stat -f '%Su' "$target" 2>/dev/null)
  else
    set owner (stat -c '%U' "$target" 2>/dev/null)
  end

  if test "$owner" = root
    log warn 'This file requires root permissions, opening with sudo'
    sudo -e "$file"
  else
    $EDITOR "$file"
  end
end
