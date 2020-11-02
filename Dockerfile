FROM ruby:2.7-alpine

EXPOSE 3000

RUN apk --no-cache add alpine-sdk postgresql-dev tzdata
RUN mkdir /api

WORKDIR /api

COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock
RUN bundle install

COPY . /api

CMD [ "rails", "s", "-b", "0.0.0.0" ]
