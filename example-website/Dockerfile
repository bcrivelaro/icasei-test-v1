FROM ruby:2.7.2-alpine
LABEL maintainer="bcrivelaro"

RUN apk --update add build-base nodejs yarn postgresql-client postgresql-dev \
  tzdata bash less && rm -rf /var/cache/apk/

ENV APP_HOME /example_website
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/

RUN bundle install

COPY . $APP_HOME

CMD ["rails", "server", "-b", "0.0.0.0"]