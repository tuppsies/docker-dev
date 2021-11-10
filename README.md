### To create the Docker image using the cache
`docker build --rm -t dev .`

### To create the Docker image fresh without using the cache
`docker build --no-cache --rm -t dev .`

### To run and enter the Docker container
`docker run -i -t --rm dev`

### To run, map AWS credentials and enter the Docker container
`docker run -i -t --rm -v ~/.aws/:/root/.aws/ dev`

### To run and include AWS and SSH keys
`docker run -i -t --rm -v ~/.aws/:/root/.aws/ -v ~/repos/presidential-debates/:/presidential-debates/ -v ~/.ssh/:/root/.ssh/ dev`

### Helpful Hints
[This is a great cheatsheet of colours](https://jonasjacek.github.io/colors/)

[Emoji Symbols](https://getemoji.com/)
