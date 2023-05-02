# Examine the help system
First, analyze the main help command:

`terraform -help`

You could also type the following options: 

`terraform --help`, `terraform -h`, or `terraform --h`

Take note of the main commands including: init, plan, validate, apply, and destroy.

Now, learn more about a subcommand. 

  For example: 
  
  `terraform -h init`

  You could also type: `terraform init -h` if you wish.

# Help system best practice
My preference is to use the following syntax:

`terraform -h <subcommand>`

This is for two reasons:
1. As you are learning, you will undoubtedly use the up arrow to bring up commands from history. So if you were to learn more about the init subcommand by typing `terraform -h init`, then later you could easily press the up arrow, and simply backspace "init" and replace it with another subcommand you want to learn about, such as "apply". 
2. By placing the `-h` before the subcommand you avoid running commands inadvertently. If the `-h` is after the subcommand, you might accidentally trigger an "init" or "apply" if you make a mistake. 

Spend some time looking through the various help options. This is one of the best ways to learn Terraform. 

---
**Another lab done! Great work!**