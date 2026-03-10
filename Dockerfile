FROM jupyter/minimal-notebook:latest

USER ${NB_UID}

# Install Claude Code CLI for the notebook user
RUN curl -fsSL https://claude.ai/install.sh | bash

# Ensure Claude Code is in PATH
ENV PATH="/home/jovyan/.local/bin:${PATH}"

# Disable JupyterLab token authentication (RenkuLab handles auth via its proxy)
RUN mkdir -p /home/jovyan/.jupyter && \
    echo "c.ServerApp.token = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.password = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.disable_check_xsrf = True" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_remote_access = True" >> /home/jovyan/.jupyter/jupyter_server_config.py
