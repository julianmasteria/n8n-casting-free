FROM n8nio/n8n:latest

USER root
# ➜ Alpine usa apk, no apt-get
RUN apk add --no-cache python3 py3-pip python3-venv python3-dev build-base

# Copiamos el script
COPY ./opt /opt

# Creamos venv e instalamos deps (requirements.txt puede estar vacío por ahora)
RUN python3 -m venv /opt/talent_analyzer/venv \
 && /opt/talent_analyzer/venv/bin/pip install --upgrade pip \
 && if [ -s /opt/talent_analyzer/requirements.txt ]; then \
        /opt/talent_analyzer/venv/bin/pip install -r /opt/talent_analyzer/requirements.txt ; \
    fi

USER node
