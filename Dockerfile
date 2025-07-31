FROM n8nio/n8n:latest

# Copiamos el script (asegúrate de que init.sh está en la raíz del repo)
COPY init.sh /init.sh

# Otorgamos permisos – usa la sintaxis shell (normal) o la JSON, pero no ambas
RUN test -f /init.sh && chmod 755 /init.sh
#  (ó, si prefieres JSON)  RUN ["chmod","755","/init.sh"]

ENTRYPOINT ["/init.sh"]
