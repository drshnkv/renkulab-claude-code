FROM jupyter/minimal-notebook:latest

USER ${NB_UID}

# Install Claude Code CLI for the notebook user
RUN curl -fsSL https://claude.ai/install.sh | bash

# Ensure Claude Code is in PATH
ENV PATH="/home/jovyan/.local/bin:${PATH}"
