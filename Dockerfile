FROM ubuntu:18.04

RUN apt-get update
RUN apt install -y vim
RUN apt install -y zsh
RUN apt install -y curl
RUN apt install -y git
RUN apt install -y python # Required for the git plugin


# Install Terraform
RUN apt install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt install -y terraform

# Install the AWS CLI
RUN apt install -y unzip
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
