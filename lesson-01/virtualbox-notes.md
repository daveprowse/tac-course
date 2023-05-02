# VirtualBox Notes
For those of you using VirtualBox you will note that the installation of Debian is quite automated. If for some reason it is not in your virtualization system, I have a step-by-step tutorial at my website:

  https://prowse.tech/debian-11-linux-install

## Login Details

In fact, VirtualBox might complete the *entire* installation for you and place you at a login prompt.

If you get to a login prompt, it might show *vboxuser* as the username. The default password for this is *changeme*. Be sure to change the password after you login!

## NAT Network  
By default, VirtualBox sets up the virtual machine as NAT. In VirtualBox that means that the VM can connect to the Internet. Also, the host computer can communicate with the VM. However, additional VMs will not be able to communicate with each other unless you change the network setting to "NAT Network". 
So if you plan to have multiple VMs and you would like them to communicate with each other, set them all to NAT Network.




