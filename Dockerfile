FROM ruby:2.6.3-alpine

ENV APP_HOME /web/app
WORKDIR $APP_HOME

RUN apk update \
  && apk upgrade \
  && apk add \
    curl \
    wget \
    bash \
    build-base \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    pg \
    sqlite-dev \
    yarn

EXPOSE 3000

COPY . $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN gem install bundler && gem install rake && bundle install