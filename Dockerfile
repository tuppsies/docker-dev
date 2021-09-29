FROM ubuntu:18.04

RUN apt-get update
RUN apt install -y vim
RUN apt install -y zsh
RUN apt install -y curl
RUN apt install -y git
#RUN apt install -y fonts-powerline
#RUN apt install -y python3
#RUN apt install -y python3-pip
#RUN pip3 install powerline-status

# Install Oh My ZSH
RUN yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set the default shell to ZSH
RUN chsh -s $(which zsh)

# Gives 256 colour options (as opposed to the 8 where TERM=term)
ENV TERM=xterm-256color

# Set aliases
RUN echo "alias ls='ls -l'" >> ~/.zshrc

RUN echo "PROMPT='🔥  %B%F{208}%m%f %F{red}%C%f %F{red}%#%f %b'" >> ~/.zshrc

CMD zsh