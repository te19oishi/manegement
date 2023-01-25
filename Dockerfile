FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN mkdir /manegement
WORKDIR /manegement
COPY Gemfile /manegement/Gemfile
COPY Gemfile.lock /manegement/Gemfile.lock
RUN gem update --system 3.3.20 && bundle install
COPY . /manegement

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]