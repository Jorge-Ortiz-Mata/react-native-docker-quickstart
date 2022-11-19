FROM node:16 as base

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  sudo

WORKDIR /app-01-goals

ARG USERNAME=jorge
ARG USER_UID=1001
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && usermod -aG sudo $USERNAME \
    && sudo chown -R $USERNAME:$USERNAME .

USER root

FROM base as development

COPY package.json .

RUN npm install
RUN npm install -g expo-cli @expo/ngrok@^4.1.0

COPY . .

USER $USERNAME
