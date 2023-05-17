# Aliases (Abbreviations)
You can create aliases in Bash (known as abbreviations in Fish) to act as shortcut commands for longer terraform commands. For example:

ta = terraform apply

> Note: Be careful that they don't overlap with any other commands that might exist on your system currently. Test them first!

## In Bash
You can add aliases directly to the .bashrc file or to a new file named 
.bash_aliases. Your choice. I prefer using a separate .bash_aliases file. Either way, here's an example of the syntax:

```bash

alias ta='terraform apply'

```

> !! Important: Be careful when setting up an alias to `terraform apply -auto-approve` because this executes the deployment without asking for confirmation. BE SURE TO RUN `terraform plan` FIRST!!!

## In Fish
> Note: In Fish, aliases are referred to as "abbreviations".

In the terminal, use the `abbr` command. 

For example, to add an abbreviation called `ta` which will map to the `terraform apply` command, use the following syntax:

`abbr --add ta terraform apply`

To show your abbreviations, use the `abbr --show` command.

I use this and it speeds up my workflow by one million percent. Literally.

> Note: More about the `abbr` command: https://fishshell.com/docs/current/cmds/abbr.html

---
## *Shortcuts are good!*
---

