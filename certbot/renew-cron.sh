#!/bin/sh
set -e

# Выполняет renew и перезагружает nginx при обновлении
certbot renew --webroot -w /var/www/certbot --deploy-hook 'nginx -s reload' || true
