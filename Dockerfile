FROM alpine:latest

# Instalar git para permitir actualizaciones, si lo deseas
RUN apk add --no-cache git

# Crear usuario 'odoo' con mismo UID/GID que en contenedor oficial
RUN addgroup -g 101 odoo && \
    adduser -u 101 -G odoo -h /mnt/extra-addons -D odoo

WORKDIR /mnt/extra-addons

# Copia todo el repositorio (tu módulo incluido)
COPY . /mnt/extra-addons/

# Ajusta permisos para que odoo pueda leerlo
RUN chown -R odoo:odoo /mnt/extra-addons

# Mantiene el contenedor vivo
CMD ["tail", "-f", "/dev/null"]
