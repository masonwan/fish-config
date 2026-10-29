abbr ai 'agy --model claude-opus-5-5-medium --prompt'
abbr aic 'agy --model claude-opus-5-5-medium --continue'

# Prevent agy from self-updating mid-session (which kills remote-control). Must be "true"; "1" is ignored.
set -gx AGY_CLI_DISABLE_AUTO_UPDATE true
