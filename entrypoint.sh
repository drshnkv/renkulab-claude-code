#!/bin/bash
# Entrypoint for RenkuLab-compatible JupyterLab sessions
# Handles RENKU_BASE_URL_PATH to avoid redirect loops behind RenkuLab's proxy

# Run post-init script if it exists
if [ -f /post-init.sh ]; then
    bash /post-init.sh
fi

# If RenkuLab sets RENKU_BASE_URL_PATH, start jupyter with the correct base URL
if [ -n "$RENKU_BASE_URL_PATH" ]; then
    exec jupyter server \
        --ServerApp.port=8888 \
        --ServerApp.ip=0.0.0.0 \
        --ServerApp.base_url="$RENKU_BASE_URL_PATH" \
        --ServerApp.token="" \
        --ServerApp.password="" \
        --ServerApp.allow_remote_access=true \
        --ServerApp.allow_origin="*" \
        --ContentsManager.allow_hidden=true
else
    exec "$@"
fi
