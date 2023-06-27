# Logging with Terraform
Logging allows us to actively monitor/troubleshoot potential and current issues.

- Log immediately in the terminal: 

`TF_LOG=TRACE terraform apply`

The five Terraform logging levels are:

TRACE, DEBUG, INFO, WARN, and ERROR

This is a common naming convention for software. Note that TRACE has the highest level of verbosity (it is the most detailed) and ERROR has the lowest.

- Log to file: 

`export TF_LOG_PATH=logs.txt`

> Note: Turn on logging for entire terminal session: 

`export TF_LOG=TRACE`

See the video for more information and examples. 

> Note: Are you interested in learning more about troubleshooting? Take a look at my A+ videos and books on O'Reilly. Here are a couple of links for you:

**Video:**
https://learning.oreilly.com/videos/comptia-a-core/9780137903740/9780137903740-CAP1_05_25_01/

**Book**: 

https://learning.oreilly.com/library/view/comptia-a-core/9780137637775/ch23.xhtml#ch23lev1sec1

Enjoy!
