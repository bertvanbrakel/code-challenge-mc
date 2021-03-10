# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.154.0/containers/javascript-node/.devcontainer/base.Dockerfile

# [Choice] Node.js version: 14, 12, 10
ARG VARIANT="14-buster"
#ARG BIND_HOST="surveyowl.local"
ARG DEBIAN_FRONTEND=noninteractive
ARG PROJECT_NAME="dev"

FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-${VARIANT}
#FROM node:${VARIANT}
RUN apt-get update
RUN apt-get -y install \
    tree \
    telnet \
    tmux \
    build-essential \
    curl

# install rust

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

# allow running docker from docker
COPY library-scripts/docker-debian.sh /tmp/library-scripts/
#RUN apt-get update && bash /tmp/library-scripts/docker-debian.sh
RUN bash /tmp/library-scripts/docker-debian.sh

ENTRYPOINT ["/usr/local/share/docker-init.sh"]
CMD ["sleep", "infinity"]
RUN adduser node docker

ENV NVM_DIR /usr/local/nvm
ENV NPM_VERSION 15.5

ARG USERNAME=node

# keep command history between container rebuiilds
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory \
    && echo $SNIPPET >> "/home/$USERNAME/.bashrc"

# set the user to use when running things in this container. vscode will ensure the UID/GID is set to the hosts user
USER node
ENV NVM_DIR /usr/local/share/nvm
ENV NODE_VERSION 15.6.0
ENV NPM_VERSION 7.5.3
SHELL ["/bin/bash", "-c"]

# install node and npm
RUN . $NVM_DIR/nvm.sh \    
    && nvm install $NODE_VERSION \
    #&& nvm install -g npm@$NPM_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default    

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN echo 'node version' $(node -v) && echo 'npm version' $(npm -v) && npm install -g meta verdaccio
WORKDIR /workspace

# install deno
#RUN curl -fsSL https://deno.land/x/install/install.sh | sh
#RUN echo 'export DENO_INSTALL="/home/node/.deno"' >> /home/node/.bashrc
#RUN echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> /home/node/.bashrc

#COPY --chown=node:node files/verdaccio.config.yml /home/node/.verdaccio.config.yml