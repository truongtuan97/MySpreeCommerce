FROM ruby:3.3.0

ARG WORKING_DIR=/home/deployer/apps/MySpreeCommerce

WORKDIR $WORKING_DIR

COPY Gemfile $WORKING_DIR
COPY Gemfile.lock $WORKING_DIR
# RUN bundle install

ENV RAILS_ENV="test" \
  BUNDLER_VERSION=2.4.16 \
  NVM_DIR=/root/.nvm

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libvips-dev \
  libpq-dev \
  curl \
  && gem install bundler -v "$BUNDLER_VERSION" \
  && bundle config set --local path '/home/deployer/apps/MySpreeCommerce'
  
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y nodejs

# ENTRYPOINT ["./bin/docker-entrypoint"]

CMD ["bash", "-c", "test -f tmp/pids/server.pid && rm tmp/pids/server.pid; bundle install && bin/rails db:migrate && bin/rails assets:clean assets:precompile && bin/rails server -b 0.0.0.0"]
