FROM ruby:2.7.4

RUN apt-get update -qq && apt-get install -y npm vim postgresql-client
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:1.17.2 -n /usr/local/bin
RUN bundle install
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000CMD ["rails", "server", "-b", "0.0.0.0"]