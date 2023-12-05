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

## Prepare remote target hosts for provisioning (done by project bootstrap)

```sh
# copy SSH keys
make ssh-keys-install
make ssh-keys-install SSH_KEY_TARGETS=...
```

<br />


## Resources

* https://github.com/geerlingguy/mac-dev-playbook
* https://github.com/elliotweiser/ansible-osx-command-line-tools
* https://github.com/geerlingguy/ansible-role-dotfiles
* https://github.com/geerlingguy/ansible-collection-mac
* https://github.com/mas-cli/mas (Mac App Store CLI)
* https://github.com/mathiasbynens/dotfiles
* https://www.talkingquickly.co.uk/2021/01/macos-setup-with-ansible/