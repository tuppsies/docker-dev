# To create the Docker image using the cache
docker build --rm -t dev .

# To create the Docker image fresh without using the cache
docker build --no-cache --rm -t dev .

# To run and enter the Docker container
docker run -i -t --rm dev


# This is a great cheatsheet of colours
https://jonasjacek.github.io/colors/
Emoji Symbols
https://getemoji.com/