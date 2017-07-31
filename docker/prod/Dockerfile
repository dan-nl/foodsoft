FROM ruby:2.3

WORKDIR /foodsoft
COPY . ./

RUN \
apt-get update; \
apt-get upgrade -y; \

apt-get install --no-install-recommends -y \
cron \
libmagic-dev \
; \

rm -rf /var/lib/apt/lists/*; \
apt-get clean; \

bundle install --without development --without test; \

whenever --update-crontab;

EXPOSE 3000
CMD ["./docker/docker-entrypoint.sh"]
