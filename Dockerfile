FROM ruby:4.0.0

COPY Gemfile Gemfile.lock ./

# install deps, build gems
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends postgresql-client libpq-dev \
    build-essential less git \
    # bundler
    && gem install bundler:~\>2 \
    && bundle config set jobs 4 \
    && bundle install \
    # clean up
    && apt-get remove -qq --purge build-essential \
    && apt-get autoremove -qq \
    && rm -rf /var/lib/apt/lists/* /usr/local/bundle/cache/* /usr/local/n/versions/* /tmp/*

COPY . /app
