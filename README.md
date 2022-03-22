## Docker Container

The Docker container contains a number of tools that I find useful for software development.

### To build the Docker image

`docker build --rm -t dev .`

### To build the Docker image (without using the cache)

`docker build --no-cache --rm -t dev .`

### To run and enter the Docker container

`docker run -it --rm dev`

### To run and enter the Docker container and map your local AWS credentials and SSH keys

`docker run -it --rm -v ~/.aws/:/root/.aws/ -v ~/.ssh/:/root/.ssh/ dev`

## AWS Infrastructure

In the `infrastructure.json` file you'll find a CloudFormation template to setup a remote development environment.
It will deploy the following:

- An EC2 instance
- A Security Group (only allowing SSH with a key)
- An IAM Role providing the EC2 instance with AWS admin permissions
- An Elastic IP attached to the EC2 instance.

When the instance is launched the Docker image is automatically built as part of the user data script. You can then use [remote SSH in vscode](https://code.visualstudio.com/docs/remote/ssh) to connect to the EC2 instance and then run and enter the Docker container.

Note that if you destroy and re-deploy the CloudFormation stack it will generate a new Elastic IP and so you will have to update your VS Code settings.

### To deploy the CloudFormation template

`aws cloudformation deploy --stack-name remote-dev-machine --template-file infrastructure.json --capabilities CAPABILITY_NAMED_IAM --tags Project=Development-Machine`

### To destroy the CloudFormation template

`aws cloudformation delete-stack --stack-name remote-dev-machine`

### Actions to take following the termination and creation of an EC2 instance

#### Remove the old SSH connection
You need to remove the entry in the `.ssh/known_hosts` files on both WSL and on Windows in `C:/Users/[User]/.ssh`

This can be done in a text editor or by following a command similar to below

`ssh-keygen -f "/home/joshua/.ssh/known_hosts" -R "ec2-54-79-66-52.ap-southeast-2.compute.amazonaws.com"`

#### Updating SSH Key in GitHub

The user script for the EC2 instance generates SSH keys for the instance. They just need to be added to your GitHub account.

More detail on GitHub SSH keys can be found [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

#### Setting global git settings on the EC2 Instance

`git config --global user.email "tupperwarec@hotmail.com"`

`git config --global user.name "Joshua Cahill"`

## Helpful Hints

[This is a great cheatsheet of colours](https://jonasjacek.github.io/colors/)

[Emoji Symbols](https://getemoji.com/)

[Command Line Prompt Expansion Reference](https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html)

[Oh My ZSH git-prompt Plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-prompt)
