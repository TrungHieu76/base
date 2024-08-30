FROM amazonlinux:2023

ENV PHP_VERSION 8.2
ENV NODEJS_VERSION 22.7.0
ENV OCTANE_SERVER swoole

RUN yum install -y git

# PHP
RUN yum install -y php${PHP_VERSION} \
        php${PHP_VERSION}-{fpm,bcmath,cli,devel,gd,intl,mbstring,mysqlnd,soap,zip,xml}

# Install xdebug
RUN git clone https://github.com/xdebug/xdebug.git && \
    cd ./xdebug && ./rebuild.sh && cd ../ && rm -rf xdebug

COPY ./bash/ /bash/

# Install composer
RUN /bash/composer.sh

# Install nodejs 22
RUN /bash/nodejs.sh


# Install ext swoole
RUN /bash/swoole.sh

RUN mkdir -p /run/php-fpm/

CMD php-fpm -d variables_order="EGPCS" &&\
    npm i &&\
    npm run build &&\
    php artisan octane:start --host=0.0.0.0 --watch