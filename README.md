## Docker Container

### To build the Docker image (using the cache)

`docker build --rm -t dev .`

### To build the Docker image fresh without using the cache

`docker build --no-cache --rm -t dev .`

### To run and enter the Docker container

`docker run -i -t --rm dev`

### To run and map your local AWS and SSH keys

`docker run -i -t --rm -v ~/.aws/:/root/.aws/ -v -v ~/.ssh/:/root/.ssh/ dev`

## AWS Infrastructure

In the `infrastructure.json` file you'll find a CloudFormation template to setup a remote development environment.
It will deploy an EC2 instance and build the development Docker image.
You can then use Remote SSH in VS Code to connect to this instance and run the docker container.

Features:

- Elastic IP
- Security Group that only allows port 22 (SSH)
- Requires an AWS Key Pair

### To deploy the CloudFormation template

`aws cloudformation deploy --stack-name dev --template-file instance.json`

### To destroy the CloudFormation template

## Helpful Hints

[This is a great cheatsheet of colours](https://jonasjacek.github.io/colors/)

[Emoji Symbols](https://getemoji.com/)
