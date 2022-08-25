FROM gitpod/workspace-full as homework-space

RUN sudo apt update && \
    sudo DEBIAN_FRONTEND=noninteractive apt install -y libgtk* && \
    sudo rm -rf /var/lib/apt/lists/*
