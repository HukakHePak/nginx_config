FROM certbot/certbot

# Установим cron
RUN apt-get update \
 && apt-get install -y cron \
 && rm -rf /var/lib/apt/lists/*

# Копируем скрипт обновления и делаем его исполняемым
COPY renew-cron.sh /renew-cron.sh
RUN chmod +x /renew-cron.sh

# Создаём cron-запись: ежедневная проверка в 03:00 и лог
RUN echo "0 3 * * * root /renew-cron.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/certbot-renew \
 && chmod 0644 /etc/cron.d/certbot-renew \
 && crontab /etc/cron.d/certbot-renew

# Создаём директорию для логов
RUN touch /var/log/cron.log

# Запускаем cron в foreground
CMD ["/usr/sbin/cron", "-f"]
