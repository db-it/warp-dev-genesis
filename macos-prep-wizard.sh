#!/usr/bin/env bash

# Remote Login (SSH)
_enable_ssh_access_choice=
while [[ ! "${_enable_ssh_access_choice}" =~ ^[YyNn]$ ]]; do
    read -p "Enable remote login? This should be enabled, if you want to setup and configure this Mac via warp-dev-genesis. [Y/N]: " -n 1 -r _enable_ssh_access_choice
    echo ""
done

if [[ "${_enable_ssh_access_choice}" =~ ^[Yy]$ ]]; then
    sudo systemsetup -setremotelogin on
    sudo systemsetup -getremotelogin
    echo ""
    echo ""
fi


# Write Ansible inventory file
wifi_ip=$(ipconfig getifaddr en0)
lan_ip=$(ipconfig getifaddr en1)
if [[ -n "${wifi_ip}" ]]; then
    ip="${wifi_ip}"
elif [[ -n "${lan_ip}" ]]; then
    ip="${lan_ip}"
else
    ip=
fi

if [[ -n "${ip}" ]]; then
    echo "Inventory file: remote.ini"
    _inventory_file_content="[macs]\n${ip} ansible_user=$USER become-password-file=sudo_pass.txt"
    echo ""
    echo -e "${_inventory_file_content}"
    echo ""

    _write_inventory_file_choice=
    while [[ ! "${_write_inventory_file_choice}" =~ ^[YyNn]$ ]]; do
        read -p "Write inventory file to disk and open in Finder to share it via AirDrop with your old Mac?. [Y/N]: " -n 1 -r _write_inventory_file_choice
        echo ""
    done

    _infenvory_file="/tmp/remote.ini"
    if [[ "${_write_inventory_file_choice}" =~ ^[Yy]$ ]]; then
        echo -e "${_inventory_file_content}" >${_infenvory_file}
        open -R ${_infenvory_file}
    fi
    echo ""
    echo ""
else
    echo "Can't create Ansible inventory file, because there is currently no network connection."
    echo "Establish a connection and start this wizard again or create the inventory file manually. Check the docs for more details."
    echo ""
fi


# Install Xcode developer tools
echo "Install requirement Xcode developer tools. Click 'Install' on the MacOS xcode installation popup."
xcode-select --install

echo ""
echo ""

echo "__          __     _____  _____        _____  ________      __      _____ ______ _   _ ______  _____ _____  _____ "
echo "\ \        / /\   |  __ \|  __ \      |  __ \|  ____\ \    / /     / ____|  ____| \ | |  ____|/ ____|_   _|/ ____|"
echo " \ \  /\  / /  \  | |__) | |__) |_____| |  | | |__   \ \  / /_____| |  __| |__  |  \| | |__  | (___   | | | (___  "
echo "  \ \/  \/ / /\ \ |  _  /|  ___/______| |  | |  __|   \ \/ /______| | |_ |  __| | . \` |  __|  \___ \  | |  \___ \ "
echo "   \  /\  / ____ \| | \ \| |          | |__| | |____   \  /       | |__| | |____| |\  | |____ ____) |_| |_ ____) |"
echo "    \/  \/_/    \_\_|  \_\_|          |_____/|______|   \/         \_____|______|_| \_|______|_____/|_____|_____/ "
echo ""
echo ""

echo "This Mac is prepared for the Genesis of your development environment at warp speed."
echo ""
echo ""
