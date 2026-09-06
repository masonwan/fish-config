abbr -a gs 'git status -s'
abbr -a gp 'git pull'
abbr -a gb 'git branch --color --all -vv'
abbr -a gr 'git remote -vv'
abbr -a gc 'git checkout'
abbr -a gd 'git diff'
abbr -a gdd 'git diff --cached'
abbr -a gf 'git fetch'
abbr -a gclean 'git clean -df; and git checkout -- .'

function git-list-unstaged-files
  git ls-files --others --exclude-standard
end

function gl -d 'Git show log'
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit -10
end

function gll -d 'Git show more log'
  git log --reverse --pretty='# %s%n%b'
end

abbr -a current-branch 'git rev-parse --abbrev-ref HEAD'
abbr -a all-branches 'git branch | cut -c 3-'

function git-delete-remote-branch -d 'Delete a remote branch'
  git push $argv[1] --delete $argv[2]
end
