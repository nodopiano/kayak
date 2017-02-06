#!/bin/sh
themename="$1"

export UID=$(id -u $USER)
docker-compose up -d &&
docker-compose exec np-wp perms &&
echo "attendo la creazione del db e installo wordpress con i dati inclusi nel docker-compose file..."
sleep 15
docker-compose exec np-wp install_wp
if [ $themename ] 
then 
    git clone https://github.com/olefredrik/FoundationPress.git wp_html/wp-content/themes/$themename
    cd wp_html/wp-content/themes/$themename/
    yarn
    bower install
    # qui possiamo cambiare il gulpfile
    sed -i -- "s/FoundationPress/$themename/g" style.css 
    sed -i -- "s/Ole Fredrik Lie/Nodopiano/g" style.css 
    sed -i -- "s/olefredrik.com/www.nodopiano.it/g" style.css 
    cd -
fi
rm -R wp_html/wp-content/themes/twentyfifteen/
rm -R wp_html/wp-content/themes/twentysixteen/

