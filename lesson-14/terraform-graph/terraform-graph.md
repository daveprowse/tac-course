# Graph it!
Use the terraform graph command to create a digraph of this lesson's lab and visualize it in a browser. 

- First, go to the lab's instances directory and run the following command:

`terraform graph >> graph1`

That should create the digraph file. Take a look at it.

- Next, view the digraph info as a visual graph in a browser. There are several options for this. For example:
  - Copy and paste the data to http://webgraphviz.com
  - Run it manually by installing graphviz, utilizing the dot command, and opening it in your favorite browser:
    
    `sudo apt install graphviz`  (most likely already installed)
    
    `dot -Tsvg graph1 > output.svg`
    
    `firefox output.svg`

That should display dependency graph of your resources in Terraform. Fun!