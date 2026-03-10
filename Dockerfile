FROM jupyter/minimal-notebook:latest

USER ${NB_UID}

# Install Claude Code CLI for the notebook user
RUN curl -fsSL https://claude.ai/install.sh | bash

# Ensure Claude Code is in PATH
ENV PATH="/home/jovyan/.local/bin:${PATH}"

# Install jupyter-server-proxy (used by RenkuLab for routing)
RUN pip install --no-cache-dir jupyter-server-proxy

# Copy custom entrypoint that handles RenkuLab's RENKU_BASE_URL_PATH
COPY --chown=${NB_UID}:${NB_GID} entrypoint.sh /entrypoint.sh

ENTRYPOINT ["tini", "--", "/entrypoint.sh"]
CMD ["jupyter", "server", "--ip", "0.0.0.0"]
