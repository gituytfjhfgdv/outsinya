FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /outsinya
WORKDIR /outsinya
COPY Gemfile /outsinya/Gemfile
COPY Gemfile.lock /outsinya/Gemfile.lock
RUN bundle install
# credentialを編集するためvimをいれる
RUN apt-get install -y vim
COPY . /outsinya

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
