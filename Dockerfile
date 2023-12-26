# FROM ruby:2.6.2
# WORKDIR /app
# ADD . /app

# RUN gem install bundler
# RUN bundle install

# RUN ["irb"]

FROM node:14

# Install Ruby 2.6.2 dependencies
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev

# Download and install Ruby 2.6.2
RUN wget https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.2.tar.gz && \
    tar -xzvf ruby-2.6.2.tar.gz && \
    cd ruby-2.6.2 && \
    ./configure && \
    make && \
    make install

# Clean up downloaded files
RUN rm -rf ruby-2.6.2 ruby-2.6.2.tar.gz

WORKDIR /app
ADD . /app

RUN gem install bundler -v 2.4.22
RUN bundle install

RUN ["irb"]
