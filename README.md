# warp-dev-genesis

> *A tool for the beginning (Genesis) of a developers environment at warp speed.*

With *warp-dev-genesis*, you can quickly and easily set up your work device automatically the way you need it.
It is built with Ansible.

<br />

## Project requirements

* `make` is required to bootstrap this project.
  * **On MacOS**: Open Terminal app and run `make`. This prompts for installing Xcode, that brings `make` with it.
* `Python3` is required, because it's a dependency of Ansible.


<br />

## Project bootstrap

Clone this repository and `cd` into it.

```sh
# creates venv and installs ansible
make init
make init ANSIBLE_VERSION=...
# activate virtual env with Ansible for shell session
source venv/bin/activate.fish
```

The virtual env must be activated in every new shell session.

<br />

## Full warp guide

For my own reference, I have written instructions on how to perform a [full warp 4mac](full-warp4mac.md) (It will probably be slightly different for everyone).


<br />

## Resources

* https://github.com/geerlingguy/mac-dev-playbook
* https://github.com/elliotweiser/ansible-osx-command-line-tools
* https://github.com/geerlingguy/ansible-role-dotfiles
* https://github.com/geerlingguy/ansible-collection-mac
* https://github.com/mas-cli/mas (Mac App Store CLI)
* https://github.com/mathiasbynens/dotfiles
* https://www.talkingquickly.co.uk/2021/01/macos-setup-with-ansible/
* https://github.com/wayofdev/ansible-role-dock


## Troubleshooting

### Homebrew Cask installs that require a password fail (Play is stuck at installing cask)

* Ansible Github #29403: [Cask installs that require a password fail](https://github.com/ansible/ansible/issues/29403)
* Possible solution: [geerlingguy/ansible-role-homebrew#73](https://github.com/geerlingguy/ansible-role-homebrew/issues/73#issuecomment-392296635)