FROM n8nio/n8n:latest

USER root
# Instalar Python 3.11 y herramientas de compilación en Alpine
RUN apk add --no-cache python3 py3-pip py3-virtualenv python3-dev build-base

# Copiamos el script
COPY ./opt /opt

# Creamos venv e instalamos deps
RUN python3 -m venv /opt/talent_analyzer/venv \
 && /opt/talent_analyzer/venv/bin/pip install --upgrade pip \
 && if [ -s /opt/talent_analyzer/requirements.txt ]; then \
        /opt/talent_analyzer/venv/bin/pip install -r /opt/talent_analyzer/requirements.txt ; \
    fi

USER node

COPY ./init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]
