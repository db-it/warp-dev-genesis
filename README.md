# Workstation provisioning

<br />

## Project bootstrap

```sh
# creates venv and installs ansible
make init
make init ANSIBLE_VERSION=...
# activate venv with Ansible for shell session
source venv/bin/activate.fish
```

<br />

## Prepare local host for provisioning

### Ensure make is installed

Open Terminal app and run `make`. This prompts for installing Xcode.

<br />


## Prepare remote host for provisioning

### Enable SSH

You can use this playbook to manage other Macs as well; you just need to make sure you can connect to it with SSH:

  1. (On the Mac you want to connect to:) Go to System Preferences > Sharing.
  2. Enable 'Remote Login'.

You can also enable remote login on the command line:

```sh
sudo systemsetup -setremotelogin on
```

### Edit Ansible inventory

Edit the `inventory` file in this repository and change the line that starts with `127.0.0.1` to:

```
[ip address or hostname of mac]  ansible_user=[mac ssh username]
```

If you need to supply an SSH password (if you don't use SSH keys), make sure to pass the `--ask-pass` parameter to the `ansible-playbook` command.


<br />


## Resources

* https://github.com/geerlingguy/mac-dev-playbook
* https://github.com/elliotweiser/ansible-osx-command-line-tools
* https://github.com/geerlingguy/ansible-role-dotfiles
* https://github.com/geerlingguy/ansible-collection-mac
* https://github.com/mas-cli/mas (Mac App Store CLI)
* https://github.com/mathiasbynens/dotfiles
* https://www.talkingquickly.co.uk/2021/01/macos-setup-with-ansible/