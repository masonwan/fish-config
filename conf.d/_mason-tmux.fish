alias tm tmux
alias tmnew 'tmux new -s'

function tmux-new-or-attach -d 'Create a session with given name or attach to the session'
  set session_name $argv[1]
  if [ -z $session_name ]
    log error 'The session name is required.'
    return 1
  end
  tmux has-session -t $session_name 2>/dev/null
  if [ $status -eq 0  ]
    log info "Attaching session '$session_name'..."
    tmux attach -t $session_name
  else if [ $status -eq 1  ]
    log info "Creating session '$session_name'..."
    tmux new -s $session_name
  else
    log error "Unexpected status $status"
  end
end
alias tma tmux-new-or-attach
