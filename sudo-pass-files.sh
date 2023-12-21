#!/usr/bin/env sh

set -o errexit
set -o pipefail

create_password_files() {
    if [ ! -f "$PWD/secrets.yml" ] || [ ! -f "$PWD/sudo_pass.txt" ]; then

        while [ -z "${password}" ]; do
            read -s -p "Type in your sudo / user password: " password
            echo ""
        done

        echo "ansible_become_password: ${password}" > secrets.yml
        echo "${password}" > sudo_pass.txt

    else
        echo "Sudo passwords are in place. You are ready for a warp dev!"
    fi
}

remove_password_files() {
    rm $PWD/secrets.yml $PWD/sudo_pass.txt
    echo "Removed all sudo password files!"
}

if [ -z "$1" ]; then
    echo "ERROR Usage: $0 [ create | remove ]"
    exit 1
elif [ "$1" == "create" ]; then
    create_password_files
elif [ "$1" == "remove" ]; then
    remove_password_files
fi



