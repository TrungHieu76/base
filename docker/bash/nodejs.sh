#!/bin/sh
# installs nvm (Node Version Manager)
touch ~/.bashrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.nvm/nvm.sh
# download and install Node.js (you may need to restart the terminal)
nvm install ${NODEJS_VERSION}
ln -s /root/.nvm/versions/node/v${NODEJS_VERSION}/bin/node /usr/bin/node
ln -s /root/.nvm/versions/node/v${NODEJS_VERSION}/bin/npm /usr/bin/npm
# verifies the right Node.js version is in the environment
node -v # should print `v22.7.0`
# verifies the right npm version is in the environment
npm -v # should print `10.8.2`
