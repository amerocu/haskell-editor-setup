FROM tweag/stack-docker-nix

ADD shell.nix /
# Clean up non-essential downloaded archives after provisioning a shell.
RUN nix-shell /shell.nix --indirect --add-root /nix-shell-gc-root \
    && nix-collect-garbage
RUN IN_NIX_SHELL=1 nix-instantiate \
    --add-root /shell.drv --indirect /shell.nix \
    && nix-collect-garbage

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/
