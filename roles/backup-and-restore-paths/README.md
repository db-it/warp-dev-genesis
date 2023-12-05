# Ansible role: backup-and-restore-paths

## Requirements

None

## Role variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```
backup_and_restore_paths_items: []
```

The paths that should be backed up.

```
backup_and_restore_paths_backup_path: ''
```

The path where the path items should be copied to.

```
backup_and_restore_paths_do_backup: no
backup_and_restore_paths_do_restore: no
```

Switches to enable backup or restore tasks.


## Glob patterns

This role supports handling glob patterns.
The backup behaviour differs depending on whether the path is specified absolutely or with a tilde (~).
If the path is absolute, it is copied completely into the backup directory.
With the latter, the path is created relative to the home directory in the backup directory.

Example with the following directory tree:
```
/Users/max
├── mypath
│   ├── foo
│   ├── foobar
│   └── bar
└── otherpath
    ├── baz
    ├── bazword
    └── foo
```

Ansible role config:
```
backup_and_restore_paths_backup_path: '/Users/max/Backup'
backup_and_restore_paths_items:
  - ~/mypath/foo*
  - /Users/max/otherpath/baz*
```

This is the resulting backup tree:
```
/Users/max/Backup
├── mypath
│   ├── foo
│   └── foobar
└── Users
    └── max
        └── otherpath
            ├── baz
            └── bazword
```

## Dependencies

None

## Example Playbook

Backup:
```
- hosts: localhost

  vars:
    backup_and_restore_paths_do_backup: yes
    backup_paths_backup_path: ~/Backup
    backup_and_restore_paths_items:
      - ~/foo

  roles:
    - role: backup-and-restore-paths
```

Restore:
```
- hosts: localhost

  vars:
    backup_and_restore_paths_do_restore: yes
    backup_paths_backup_path: ~/Backup
    backup_and_restore_paths_items:
      - ~/foo

  roles:
    - role: backup-and-restore-paths
```