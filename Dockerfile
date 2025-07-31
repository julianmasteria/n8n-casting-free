# Dockerfile  (raíz del repo)
FROM n8nio/n8n:latest

# 1) Copiamos el script de arranque; el punto es la raíz del repo
COPY init.sh /init.sh

# 2) (opcional) Garantizamos permisos de ejecución,
#    pero **SOLO si el archivo existe** en la imagen.
RUN [ -f /init.sh ] && chmod 755 /init.sh

# 3) Entramos con el script; Render ya no intenta `start`
ENTRYPOINT ["/init.sh"]
