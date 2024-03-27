alias gs 'git status -s'
alias gp 'git pull'
alias gb 'git branch --color --all -vv'
alias gr 'git remote -vv'
alias gc 'git checkout'
alias gd 'git diff'
alias gdd 'git diff --cached'
alias gf 'git fetch'
alias gclean 'git clean -df; and git checkout -- .'

function git-list-unstaged-files
  git ls-files --others --exclude-standard
end

function gl -d 'Git show log'
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
end

function gll -d 'Git show more log'
  git log --reverse --pretty='# %s%n%b'
end

alias current-branch 'git rev-parse --abbrev-ref HEAD'
alias all-branches 'git branch | cut -c 3-'

function git-delete-remote-branch -d 'Delete a remote branch'
  git push $argv[1] --delete $argv[2]
end
