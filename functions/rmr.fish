function rmr -d 'Remove files and all nested contents.'
  # -r: Recursive
  # -I: interactive for each directory
  rm -rI $argv
end
