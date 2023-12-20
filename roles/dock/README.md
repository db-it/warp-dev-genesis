# Ansible Role: macOS Dock Automation

This role automates the use of `dockutil` to manage the items in your macOS Dock. You can add, remove, and arrange Dock items.

## Requirements

  - **Homebrew**: Requires `homebrew` already installed (you can use `geerlingguy.mac.homebrew` to install it on your Mac).

## Role Variables

Available variables are listed below, along with example values (see `defaults/main.yml`):


```yaml
dockitems_clear_all: true
```

Clear all Dock items first.

```yaml
dockitems_remove:
  - Launchpad
  - TV
  - Podcasts
```

Dock items to remove. Dock elements are only removed if `dockitems_clear_all` is false.

```yaml
dockitems_persist:
  - name: System Settings
    path: "/Applications/System Settings.app/"
  - name: Firefox
    path: "/Applications/Sublime Text.app/"
    pos: 5
```

Dock items to add. `pos` parameter is optional and will place the Dock item in a particular position in the Dock.


```yaml
dockitems_spacer:
  - System Settings
```

Add spacer-tiles after these Dock items.

---

<br />

```yaml
dockutil_homebrew_cask: hpedrorodrigues/tools/dockutil
```

Which Homebrew cask to install for dockutil. See [this issue](https://github.com/kcrawford/dockutil/issues/127) to read more about why this cask is the default.

```yaml
dockutil_install: true
```

Whether to install dockutil or not. If set to false you'll need to have installed dockutil prior to the execution of this role. See [this issue](https://github.com/geerlingguy/ansible-collection-mac/issues/42) for alternate installation methods, which may be necessary depending on your version of macOS.

```yaml
dockutil_bin: dockutil
```

Path to the dockutil bin file. The default is what is found in the PATH.
But an absolute path can be set, if dockutil is not found in the PATH.

## Dependencies

  - (Soft dependency) `geerlingguy.homebrew`

## Example Playbook

```yaml
    - hosts: localhost

      vars:
        dockitems_clear_all: true

        dockitems_persist:
          - name: Messages
            path: "/Applications/Messages.app/"
          - name: Safari
            path: "/Applications/Safari.app/"
            pos: 2
          - name: Sublime Text
            path: "/Applications/Sublime Text.app/"
            pos: 3

      roles:
        - geerlingguy.mac.homebrew
        - geerlingguy.mac.dock
```

## License

MIT / BSD

## Author Information

The contents of this role were originally created by [Jeff Geerling](https://www.jeffgeerling.com/) as part of the [Mac Collection for Ansible](https://github.com/geerlingguy/ansible-collection-mac).
