FROM ruby:2.7.2-alpine
LABEL maintainer="bcrivelaro"

RUN apk --update add build-base nodejs yarn postgresql-client postgresql-dev \
  tzdata bash less && rm -rf /var/cache/apk/

ENV APP_HOME /tracker
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock $APP_HOME/

RUN bundle install

COPY . $APP_HOME

CMD ["rails", "server", "-b", "0.0.0.0"]