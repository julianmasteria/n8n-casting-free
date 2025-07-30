FROM n8nio/n8n:latest
USER root
RUN apt-get update && apt-get install -y python3 python3-venv python3-pip
COPY ./opt /opt
RUN python3 -m venv /opt/talent_analyzer/venv \
 && /opt/talent_analyzer/venv/bin/pip install -r /opt/talent_analyzer/requirements.txt
USER node
