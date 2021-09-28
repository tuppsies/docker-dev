FROM ubuntu:18.04

RUN apt-get update
RUN apt install -y vim
RUN apt install -y zsh
RUN apt install -y curl
RUN apt install -y git

RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN chsh -s $(which zsh)

RUN echo "PROMPT='🐳  %B%F{cyan}%m%f %F{blue}%C%f %F{cyan}%#%f %b'" >> ~/.zshrc

CMD zsh