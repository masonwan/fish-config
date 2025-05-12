function v -d 'View the files'
  # -M: Show name, position, and progress.
  # -R: Show raw control characters, so color could work.
  # -i: Makes searches case-insensitive
  less -MRi $argv
end
