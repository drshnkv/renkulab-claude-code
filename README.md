# RenkuLab + Claude Code

Custom JupyterLab Docker image with Claude Code CLI pre-installed for use in RenkuLab sessions.

## Usage in RenkuLab

1. Create a new project on renkulab.io
2. Add session launcher → External environment
3. Container image: `ghcr.io/drshnkv/renkulab-claude-code:latest`
4. Start session (large, 7 GB RAM recommended)
5. Open terminal and run `claude login`

## What's included

- JupyterLab (from `jupyter/minimal-notebook`)
- Claude Code CLI (pre-installed in PATH)

## Note

`claude login` must be done manually each session (requires OAuth browser flow).
