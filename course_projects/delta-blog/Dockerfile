FROM quay.io/evl.ms/fullstaq-ruby:3.0.3-jemalloc-bullseye-slim

WORKDIR /usr/src/app

RUN apt update
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN  apt install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN npm install --global yarn

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle config --global frozen 1
RUN bundle config set --local without 'development test'
RUN bundle install

COPY . /usr/src/app
RUN SECRET_KEY_BASE=dumb bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]