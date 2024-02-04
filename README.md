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

### To create a CloudFormation change set

`aws cloudformation create-change-set --template-body file://infrastructure.json --stack-name remote-dev-machine --capabilities CAPABILITY_NAMED_IAM --change-set-name [name]`

### To destroy the CloudFormation template

`aws cloudformation delete-stack --stack-name remote-dev-machine`

### Actions to take following the termination and creation of an EC2 instance

#### Remove the old SSH connection

You need to remove the entry in WSL `~/.ssh/known_hosts` and the host Windows in `C:/Users/[User]/.ssh`

On WSL this can be done by running the following command: `ssh-keygen -f "/home/joshua/.ssh/known_hosts" -R "3.24.248.190"`
Make sure to swap the IP out address (although you shouldn't need to do it often since it's an elastic IP)

`ssh-keygen -f "/home/joshua/.ssh/known_hosts" -R "ec2-[something].ap-southeast-2.compute.amazonaws.com"`

#### Updating SSH Key in GitHub

The user data script for the EC2 instance generates SSH keys for the instance on the instance.
You can retrieve them by SSH'ing into the instance using `ssh ec2-user@[elastic_ip] -i [key-file]`

You need to add them to your key chain and then to your GitHub account.

To add them to your key chain, log in to your EC2 instance (as ec2-user) and run the following:

`eval $(ssh-agent) ssh-add /home/ec2-user/.ssh/id_ed25519`

More detail on GitHub SSH keys can be found [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

#### Setting global git settings on the EC2 Instance

`git config --global user.email "tupperwarec@hotmail.com"`

`git config --global user.name "Joshua Cahill"`

## Helpful Hints

[This is a great cheatsheet of colours](https://jonasjacek.github.io/colors/)

[Emoji Symbols](https://getemoji.com/)

[Command Line Prompt Expansion Reference](https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html)

[Oh My ZSH git-prompt Plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git-prompt)

## To Do

- Pull down SSH keys from AWS Parameter Store or AWS Secrets, so that we don't have to continually update GitHub

- Include the adding of the keys to the keychain as part of the user data script. The following command does this but doesn't work when in the user data

`runuser --command \"eval $(ssh-agent) ssh-add /home/ec2-user/.ssh/id_ed25519\" - ec2-user`

- Install the Vestij repo

- Run `npm install` on the Vestij `frontend/` directory (as this seems to take quite a while)
