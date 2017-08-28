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

alias current-branch 'git rev-parse --abbrev-ref HEAD'
alias all-branches 'git branch | cut -c 3-'

function pull-all -d 'Pull all git branches'
	set original_branch (current-branch)
	for b in (all-branches)
		if [ $b = $original_branch ]
			continue
		end
		if git checkout $b -q
			log info 'Switch to '$b
			git pull -q
		else
			log error 'Failed to switch to '$b
		end
	end
	log info 'Switch back to '$original_branch
	git checkout $original_branch -q; and git pull -q
end

function sync-branch -d 'Sync the current branches to other branches'
	set original_branch (current-branch)
	for b in $argv
		if not git checkout $b -q
			log error 'Fail to checkout'$b
			continue
		end
		log info 'Rebase '$original_branch' to '$b
		git rebase $original_branch -q
	end
	log info 'Switch back to '$original_branch
	git checkout $original_branch -q
end

function git-delete-remote-branch -d 'Delete a remote branch'
    git push $argv[1] --delete $argv[2]
end
