FROM ruby:3.1

RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /manegement
WORKDIR /manegement
COPY Gemfile /manegement/Gemfile
COPY Gemfile.lock /manegement/Gemfile.lock
RUN bundle install
COPY . /manegement

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]