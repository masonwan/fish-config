function e -d 'Start the vim with proper permission'
    set -l editors
    set -a editors /usr/bin/editor # Use update-alternatives, Debian's CLI version management.
    set -a editors hx # Helix
    set -a editors nvim vim vi
    set -a editors nano

    for editor in $editors
        if command -q $editor
            break
        end
    end

    set -l owner ''
    set -l os (uname)
    if [ $os = Darwin ]
        set owner (stat -f '%Su' $argv)
    else
        set owner (stat -c '%U' $argv)
    end
    if [ $owner = root ]
        log warn 'This file is owned by root, opening with sudo'
        sleep 1
        sudo -e $argv
    else
        $editor $argv
    end
end
