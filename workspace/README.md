# Workspace

This collection of images are used to run as a ready-to-go workspace.

## Variants

### `ghcr.io/jacoblincool/workspace-lite`

This image is the simplest.

The following things are available:

- Dev Tools: `git`, `make`, `node`, `python`, `gcc`, `g++`
- Commands: `sudo`, `htop`, `jq`, `lsof`, `less`, `curl`, `zip`, `unzip`, `tree`, `pnpm`, `regctl`, `cloudflared`, `esno`, `serve`

### `ghcr.io/jacoblincool/workspace`

This image add `docker` to `workspace-lite`.

`dockerd` will be automatically started with the entrypoint if available.

### `ghcr.io/jacoblincool/workspace-full`

This image can only be run with special runtime, like `sysbox`, or with `--privileged` flag.

This image run a `systemd` and `ssh` server should be available.
