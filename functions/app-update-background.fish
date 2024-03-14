function app-update-background -d 'Update apps in the background'
  set -l session_name server
  tmux has-session -t $session_name 2>/dev/null
  if [ $status -eq 1 ]
    tmux new -d -s $session_name
  end
  tmux send -t server app-update ENTER && tma server
end
