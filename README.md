# dir-jump

A simple solution how to forget about your folder paths!

## Description

This simple bash script allows you to quickly save/delete your current folder path as a field variable.  
It uses a standard bash command `export` to register a variable in the bash session.  
Previously saved variables are stored in a hidden file `.dirJump` in your home folder and they are automatically loaded at the beginning of the new session.  
Saved locations can be easily accessed via `GG <name>` command or simply used by another bash script as `cd $name`.

## Installation

To install this small script you can simply `source` it in your home `.bashrc` file.

```bash
source ~/your/path/to/dirJump.sh
```

## Commands

| command   | description                           |
|-----------|---------------------------------------|
| LL        | Lists all registered paths            |
| SS <name> | Save current directory path as <name> |
| DD <name> | Delete path <name>                    |
| GG <name> | Go to path <name>                     |

Example of the usage:  
```bash
~$ cd ~/my/precious
~/my/precious$ SS precious
~/my/precious$ cd ~
~$ LL
#!/bin/bash
export precious=/Users/user/my/precious
~$ GG precious
~/my/precious$ 
```
