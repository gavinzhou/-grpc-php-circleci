FROM circleci/php:7.2

ENV PROTOBUF_VERSION=3.5.1

RUN mkdir ~/temp && cd ~/temp \
  && wget "https://github.com/google/protobuf/releases/download/v$PROTOBUF_VERSION/protoc-$PROTOBUF_VERSION-linux-x86_64.zip" \
  && unzip protoc-$PROTOBUF_VERSION-linux-x86_64.zip \
  && mv include/* /usr/local/include/ \
  && mv bin/* /usr/local/bin/ \
  && cd ~/ && rm -rf ~/temp

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
  && apt-get install -y nodejs \
  && npm install bower -g
