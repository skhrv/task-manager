FROM ruby:2.5

RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install nodejs -yq

RUN mkdir -p /task_manager

WORKDIR /task_manager

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 3
COPY . /task_manager

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
