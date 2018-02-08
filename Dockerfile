FROM postgres:latest

RUN apt-get update && apt-get -y install cron

ADD crontab /etc/cron.d/pg-backup-cron

RUN chmod 0644 /etc/cron.d/pg-backup-cron

RUN touch /var/log/cron.log

WORKDIR /opt/app-root/src

ADD ./bin

CMD ./bin/start.sh
