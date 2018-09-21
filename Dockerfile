FROM php:7.2

ENV PROTOBUF_VERSION=3.5.1

RUN apt-get update -qq && \  
  apt-get install -y -qq curl file gcc g++ git make openssh-client \
  autoconf automake libtool libcurl4-openssl-dev libssl-dev \
  libelf-dev libdw-dev binutils-dev zlib1g-dev libiberty-dev wget \
  xz-utils pkg-config python libsqlite3-dev sqlite3 unzip

RUN mkdir ~/temp && cd ~/temp \
  && wget "https://github.com/google/protobuf/releases/download/v$PROTOBUF_VERSION/protoc-$PROTOBUF_VERSION-linux-x86_64.zip" \
  && unzip protoc-$PROTOBUF_VERSION-linux-x86_64.zip \
  && mv include/* /usr/local/include/ \
  && mv bin/* /usr/local/bin/ \
  && cd ~/ && rm -rf ~/temp

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install -y nodejs \
  && npm install bower -g
