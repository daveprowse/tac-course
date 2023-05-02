# Install Terraform Autocomplete
While the Bash shell can perform auto-completion of commands, such as the `terraform` command, it will not be able to auto complete terraform subcommands such as `terraform version`. 

Terraform autocomplete takes care of that second part for you. 

- First, if you are using the Bash shell, make sure that you have an existing .bashrc file.
  
  If not, create a blank one, for example: 
    
    `touch ~/.bashrc`

- Install autocomplete: 

  `terraform -install-autocomplete`

- Restart the shell

- Test this with by typing only the first three letters of a terraform subcommand. ("ver" instead of "version"). Make sure it works!
  For example, type:

`terraform ver` 

and then press the tab key. It should complete the word "version" for you. There it is, tab completion is great.

**USE AUTO-COMPLETION!** Over time it can save you millions of keystrokes - literally. 

> Note: This is very helpful for Bash, but not quite as necessary for other shells such as Fish or ZSH. 