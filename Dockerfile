FROM n8nio/n8n:latest          # < 282 MB, Alpine
USER node                      # ya viene por defecto
CMD ["n8n", "start"]           # el binario existe siempre
