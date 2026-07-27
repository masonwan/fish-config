function d --description 'Delete files using trashy, trash-cli, or fallback to rm'
    if test (count $argv) -eq 0
        log warn "No files specified for deletion."
        return 1
    end

    if type -q trash
        log warn "Trashing via trashy: $argv"
        trash put $argv
    else if type -q trash-put
        log warn "Trashing via trash-cli: $argv"
        trash-put $argv
    else
        log error "No trash program available. Files will be permanently deleted with confirmation."
        rm -ri $argv
    end
end

