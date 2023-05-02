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
In the terminal type `fish_config`. That will open your web browser to the Fish configuration tabs. 

Go to the "abbreviations" tab and add as many abbreviations as you like!

I use this and it speeds up my workflow by one million percent. Literally.

---
## *Shortcuts are good!*
---

