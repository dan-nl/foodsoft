#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

if [ -f .new-install ]; then
  bundle exec rake db:setup
  rm .new-install
fi

bundle exec rails s -p 3000 -b '0.0.0.0'

exec "$@"
