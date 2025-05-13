function app-update -d 'Update apps'
    if type -q fd
        set command fd
    else if type -q fdfind
        set command fdfind
    else
        log error "Cannot find `fd` or `fdfind`."
        return 1
    end

    set -l files ($command ".\.fish" ~/repos/server-setup/updates/)

    for file in $files
        log info "Running "(string replace ~/repos/server-setup/updates/ '' $file)"..."
        fish $file &
    end

    wait fish
end
