## Docker Container

The Docker container contains a number of tools that I find essential for software development.

### To build the Docker image

`docker build --rm -t dev .`

### To build the Docker image (without using the cache)

`docker build --no-cache --rm -t dev .`

### To run and enter the Docker container

`docker run -i -t --rm dev`

### To run and enter the Docker container and map your local AWS credentials and SSH keys

`docker run -i -t --rm -v ~/.aws/:/root/.aws/ -v ~/.ssh/:/root/.ssh/ dev`

## AWS Infrastructure

In the `infrastructure.json` file you'll find a CloudFormation template to setup a remote development environment.
It will deploy an EC2 instance, associated security group (only allowing SSH), IAM role providing the EC2 instance with AWS admin permissions and an Elastic IP that is attached to the EC2 instance. It will also create a CloudWatch Alarm that will automatically stop the EC2 instance if it notices low network traffic.
When the instance is launched the Docker image is automatically generated (as part of the user data script). You can then use [remote SSH in vscode](https://code.visualstudio.com/docs/remote/ssh) to connect to the EC2 instance and then run and enter the Docker container.

Note that if you destroy and re-deploy the CloudFormation stack it will generate a new Elastic IP

### To deploy the CloudFormation template

`aws cloudformation deploy --stack-name remote-dev-machine --template-file infrastructure.json --capabilities CAPABILITY_NAMED_IAM --tags Project=Development-Machine`

### To destroy the CloudFormation template

## Helpful Hints

[This is a great cheatsheet of colours](https://jonasjacek.github.io/colors/)

[Emoji Symbols](https://getemoji.com/)
