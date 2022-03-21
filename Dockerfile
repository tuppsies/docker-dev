FROM ubuntu:18.04

# Install some essential tools
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y zsh
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y python # Required for the git plugin
RUN apt-get install -y mysql-server
RUN apt-get install -y zip

# Install Terraform
RUN apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get install -y terraform

# Install the AWS CLI
RUN apt-get install -y unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/awscliv2.zip"
RUN unzip /awscliv2.zip
RUN ./aws/install

# Install node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Configure git
RUN git config --global user.email "tupperwarec@hotmail.com"
RUN git config --global user.name "Joshua Cahill"

# Install Oh My ZSH
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set the default shell to ZSH
RUN chsh -s $(which zsh)

# Gives 256 colour options (as opposed to the 8 where TERM=term)
ENV TERM=xterm-256color

COPY joshua.zsh-theme /root/.oh-my-zsh/themes/joshua.zsh-theme
COPY default.zshrc /root/.zshrc

CMD zsh
