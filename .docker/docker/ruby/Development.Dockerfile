FROM ruby:3.3.0

ARG WORKING_DIR=/home/deployer/my_spree_commerce/current

WORKDIR $WORKING_DIR

ENV RAILS_ENV="development" \
  BUNDLER_VERSION=2.4.16 \
  NVM_DIR=/root/.nvm

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libvips-dev \
  libpq-dev \
  curl \
  && gem install bundler -v "$BUNDLER_VERSION" \
  && bundle config set --local path '/home/deployer/my_spree_commerce/current'

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y nodejs

ENTRYPOINT ["./bin/docker-entrypoint"]

CMD ["bash", "-c", "test -f tmp/pids/server.pid && rm tmp/pids/server.pid; bundle install && bin/rails db:migrate && bin/rails assets:clean assets:precompile && bin/rails server -b 0.0.0.0"]
