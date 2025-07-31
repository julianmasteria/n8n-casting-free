FROM n8nio/n8n:latest
COPY init.sh /init.sh
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]
