alias tm tmux
alias tmnew 'tmux new -s'

function tmux-new-or-attach -d 'Create a session with given name or attach to the session'
  set -l session_name $argv[1]
  if test -z "$session_name"
    log error 'The session name is required.'
    return 1
  end

  if tmux has-session -t "$session_name" 2>/dev/null
    log info "Attaching session '$session_name'..."
    tmux attach -t "$session_name"
  else
    log info "Creating session '$session_name'..."
    tmux new -s "$session_name"
  end
end
alias tma tmux-new-or-attach
