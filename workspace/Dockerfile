FROM ubuntu:focal as workspace-pure

ENV DEBIAN_FRONTEND=noninteractive

RUN rm -f /bin/sh && \
    ln -s /bin/bash /bin/sh && \
    apt update && \
    apt upgrade -y && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:git-core/ppa && \
    apt update && \
    apt install -y git sudo bash-completion vim htop jq lsof less curl zip unzip tree make python3 build-essential valgrind && \
    apt autoremove -y && \
    rm -f /usr/bin/python && \
    ln -s /usr/bin/python3 /usr/bin/python
COPY entry.sh /bin/entry.sh
RUN chmod +x /bin/entry.sh

ENTRYPOINT [ "entry.sh" ]
CMD [ "sleep", "infinity" ]

FROM workspace-pure as workspace-lite

ARG USERNAME=jacob
ENV HOME="/home/$USERNAME"
ENV PNPM_HOME="$HOME/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

RUN useradd -l -u 1481 -G sudo -m -s /bin/bash $USERNAME && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
WORKDIR $HOME
RUN echo "PS1='\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" (%s)\") $ '" >> .bashrc
USER $USERNAME
RUN curl -fsSL https://get.pnpm.io/install.sh | sh - && \
    pnpm env use -g 18 && \
    sudo rm -rf /tmp/*
RUN pnpm i -g regctl cloudflared esno serve && \
    cloudflared -v && \
    regctl version

CMD ["bash"]

FROM workspace-lite as workspace

ARG USERNAME=jacob

RUN curl -fsSL https://get.docker.com | sudo sh - && \
    sudo usermod -aG docker $USERNAME

FROM workspace as workspace-full

ARG USERNAME=jacob
ARG SSH_PORT=2222
ENV HOME="/home/$USERNAME"
ENV WORKSPACE_VARIANT=full

USER root
RUN apt update && \
    apt install -y --no-install-recommends iproute2 kmod locales udev openssh-server && \
    apt autoremove -y && \
    echo "ReadKMsg=no" >> /etc/systemd/journald.conf && \
    mkdir "$HOME/.ssh" && \
    chown $USERNAME:$USERNAME "$HOME/.ssh" && \
    sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
COPY authorized_keys "$HOME/.ssh/authorized_keys"

# Use stopsignal (instead of sigterm) to stop the container.
STOPSIGNAL SIGRTMIN+3

ENTRYPOINT [ "/sbin/init", "--log-level=err" ]
