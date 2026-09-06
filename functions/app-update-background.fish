function app-update-background -d 'Update apps in the background'
  set -l session_name server
  if not tmux has-session -t "$session_name" 2>/dev/null
    tmux new -d -s "$session_name"
  end
  tmux send -t "$session_name" app-update ENTER && tma "$session_name"
end
