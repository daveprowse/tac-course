# Version Control Workspace Example

In this lab we will trigger Terraform runs via version control using GitHub. 

**Overview**

- Copy the entire lesson-11 Terraform working directory
- Create a GitHub repository at GitHub
- Make a .gitignore file locally
- Configure the local git repository and push it to GitHub
- Create a VCS-based workflow at the Terraform Cloud
- Make environment variables for your AWS credentials
- Trigger a run in the UI
- Trigger a run with a GitHub push
- Destroy the infrastructure

## Copy the entire Terraform working directory
- Make a copy of lesson-11. Call it "test-lesson-11". That will be our working directory for this lab. This way, you can do additional testing in the original lesson-11 if you wish to.
- Change over to the new directory in the VScode Explorer.
- Change over to the new directory in the terminal:

  `cd ../test-lesson-11`

## Create a GitHub repository at GitHub
> Note: You will need to have an account on GitHub. 

- Sign in to your GitHub account.
- Create a new public repository. Call it "tf-test". 

> Note: You will see instructions for how to commit to the new repository in the terminal. Leave that page open for later, especially if you are new to GitHub.

## Make a .gitignore file locally
- Create a file named ".gitignore"
- Open the .gitignore file with an editor and add in the .terraform directory and all of its contents:

  .terraform/*

  The purpose of this is to make sure that git ignores the directory when committing to the repo. 
  The provider plugin is stored in the .terraform directory and is too big for standard github accounts.
- Save the file.

## Configure the local git repository and push it to GitHub
> Note: at some point during this process, you will need to log in to GitHub from VScode.

- Initialize the local git repo:

  `git init`

- Add the content in the directory:

  `git add .`

  > Note: Remember, this should not include the provider plugin because we added that to the .gitignore file.

- Commit the content in the directory:

  `git commit -m "commit 1"`

- Change the branch name:

  `git branch -M main`

- Connect to the remote repo:
  
  `git remote add origin https://github.com/<yourname>/<repo-name>.git`

- Push the content to Github:
  
  `git push -u origin main`

## Create a VCS-based workflow at the Terraform Cloud
- Login to your Terraform Cloud account
- Go to Projects & Workspaces
- Create a new Workspace, name it "tf-test" and select "Version Control Workflow".
- Select GitHub (or your favorite provider) and login to that service.
- Select the test repository that you created earlier.

## Make environment variables for your AWS credentials
Create the access key and secret key environment variables the same way we did in a previous lab. The naming conventions can be found here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs?ajs_aid=a5de6884-5b3e-4490-b4e2-9f4af848580b&product_intent=terraform#environment-variables

> Note: If necessary, build a terraform variable for the AWS region.

## Trigger a run in the UI
In the Workspace > Overview section go to "Actions" and select "Start new run". 

Follow the steps to apply the infrastructure.

When finished, check if the infrastructure is created at the AWS console.

## Trigger a run with a GitHub push
- Add a resource to your main.tf. A simple IAM user will suffice. For example:

  ```hcl
  resource "aws_iam_user" "test_user_99" {
    name = "test-user-99"  
  }
  ```

- Save the main.tf file
- Go to the terminal
- Update the repository. (This will trigger a new run at the Terraform Cloud.)

  - `git add .`
  - `git commit -m "Commit 2"`
  - `git push -u origin main`
- Go to the Terraform Cloud. View the new triggered run. You should see that it was triggered by the GitHub user account, and not by the Terraform Cloud user account.
- Confirm the run. This should create a new user at AWS.
- Confirm that the user was created at the AWS console.

> Note: There are several ways to automate the process so that you do not have to confirm the run. The simplest way is to enable Auto Apply. There is a link for this at the right of the workspace's overview page, or you could go to: Workspace Settings > Version Control > Apply Method, and select "Auto Apply". 

> Note: You might also be interested in GitHub Actions: https://docs.github.com/en/actions

## Destroy the infrastructure
This can be done in several ways. One way is to change our code. Let's do that.
- Go to your main.tf file
- Comment out all of the lines for both of the AWS resources.
- Save the file
- Update the repository in the same manner that you did in the previous section. (Call it "Commit 3")

> Note: If you did not turn on auto-apply, then confirm the run at the Terraform Cloud.

- View the run in the Terraform Cloud workspace > Overview, or Runs. Analyze the state file.

- Verify that the EC2 instance and the IAM user were destroyed at the AWS console. 

 > Note: There were a lot of moving parts in this lab, and therefore a lot of things that can go wrong. Be patient, and ask questions if you get stuck (https://prowse.tech). To become proficient in these technologies you need to get in your repetitions. Remember to practice!

---
## *GREAT WORK!*
---