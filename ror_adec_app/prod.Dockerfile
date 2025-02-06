# /path/to/app/Dockerfile
FROM ruby:2.2-alpine

# Установка часового пояса
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    echo "Europe/Moscow" > /etc/timezone

# Установка в контейнер runtime-зависимостей приложения
# RUN apk add --update --virtual runtime-deps postgresql-client nodejs libffi-dev readline sqlite
RUN apk add --update nodejs git imagemagick sqlite-libs

# Копирование кода приложения в контейнер
ENV APP_HOME=/app
COPY . $APP_HOME
WORKDIR $APP_HOME

# RUN apk add --virtual build-deps build-base openssl-dev postgresql-dev libc-dev linux-headers libxml2-dev libxslt-dev readline-dev && \
#     bundle install --jobs=2 && \
#     apk del build-deps
RUN apk add --update --virtual build-deps build-base sqlite-dev
RUN git config --global url.https://github.com/.insteadOf git://github.com/
RUN gem install bundler -v ">= 1.3.0, < 2.0"
RUN bundle install
RUN apk del build-deps

# Настройка переменных окружения для production
ENV RAILS_ENV=production
ENV RACK_ENV=production

# Проброс порта 3000 
EXPOSE 3000

# CMD ["bundle", "exec", "rails", "s"]
CMD ["rails", "server", "-b", "0.0.0.0"]

# Запуск по умолчанию сервера puma
# CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
