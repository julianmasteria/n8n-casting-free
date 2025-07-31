#!/bin/sh
# Ejemplo mínimo; exporta lo que necesites y arranca n8n
export DB_SQLITE_PATH=/data/database.sqlite
export N8N_BASIC_AUTH_ACTIVE=true
export N8N_BASIC_AUTH_USER=admin
export N8N_BASIC_AUTH_PASSWORD=changeme
n8n
