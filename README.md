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

### Generating a new SSH Key on the EC2 Instance

`ssh-keygen -t ed25519 -C "tupperwarec@hotmail.com"`

[GitHub instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Helpful Hints

[This is a great cheatsheet of colours](https://jonasjacek.github.io/colors/)

[Emoji Symbols](https://getemoji.com/)

[Command Line Prompt Expansion Reference](https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html)

[Oh My ZSH git-prompt Plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-prompt)
