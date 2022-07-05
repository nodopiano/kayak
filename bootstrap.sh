#! /bin/bash
source $NVM_DIR/nvm.sh;

UID=$(id -u)
sed "s/YOUR_USER_ID/$UID/g" .env-example > .env
./kayak start
cd themes/princi-theme/
composer install

nvm install
yarn -v || npm install -g yarn
yarn
yarn build

cd ..
cd ..

./kayak import

