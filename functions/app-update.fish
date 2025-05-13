function app-update -d 'Update apps'
    if type -q fd
        set command fd
    else if type -q fdfind
        set command fdfind
    else
        log error "Cannot find fd or fdfind."
        exit 1
    end

    set -l files ($command ".\.fish" ~/repos/server-setup/updates/)

    for file in $files
        log info "Runnning $file..."
        fish $file &
    end

    log info "Waiting for all update scripts to finish..."
    wait fish
end
