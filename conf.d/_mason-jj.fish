# Jujutsu (jj) configuration and abbreviations

# Ensure common binary paths for jj are available
for p in /opt/homebrew/bin /home/linuxbrew/.linuxbrew/bin $HOME/.cargo/bin $HOME/.local/bin
    if test -d $p
        fish_add_path -g -p $p
    end
end

if type -q jj
    abbr -a js 'jj status'
    abbr -a jd 'jj diff'
    abbr -a jds 'jj diff --stat'
    abbr -a jl 'jj log'
    abbr -a jla 'jj log -r "all()"'
    abbr -a jn 'jj new'
    abbr -a je 'jj edit'
    abbr -a jsh 'jj show'
    abbr -a jdesc 'jj describe'
    abbr -a jsq 'jj squash'
    abbr -a jb 'jj bookmark'
    abbr -a jbl 'jj bookmark list'
    abbr -a jbc 'jj bookmark create'
    abbr -a jbs 'jj bookmark set'
    abbr -a jundo 'jj undo'
    abbr -a jrebase 'jj rebase'
    abbr -a jgit 'jj git'
    abbr -a jgp 'jj git push'
    abbr -a jgf 'jj git fetch'
end
