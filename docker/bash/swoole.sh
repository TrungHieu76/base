cd /tmp &&\
git clone https://github.com/openswoole/ext-openswoole.git && \
cd ext-openswoole && \
git checkout v22.1.1 && \
phpize && \
./configure --enable-openssl --enable-sockets && \
make && make install