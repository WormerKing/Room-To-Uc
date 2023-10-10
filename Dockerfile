FROM ruby:3.0.1

RUN apt update -y && apt upgrade -y && apt install -y nodejs postgresql-client build-essential npm && npm install --global yarn

WORKDIR /app

COPY . /app

COPY Gemfile* ./app

RUN bundle install && bundle update
