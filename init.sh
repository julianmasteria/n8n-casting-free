FROM n8nio/n8n:latest

COPY init.sh /init.sh

# ✅ Debug: vemos si el archivo existe en esta capa
RUN ls -l /init.sh && head -n 5 /init.sh

RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]
