PATH_TO_PRJ_ON_HOST="/var/www/furniture/furniture"
FILE_ARCHIVE="ivan.tar.gzip"
BUNDLE_NAME="SampleBundle"
CONTAINER_ID="9eba262acc36"

echo " var name wwwdir $WWWDIR"
echo "source dir $PWD"
echo "-----------------"
echo "remote dir: "
ssh root@192.168.100.234 ls -lah /var/www/html/
tar -cjf /var/lib/jenkins/workspace/buff/$FILE_ARCHIVE -C $WORKSPACE .
scp /var/lib/jenkins/workspace/buff/ivan.tar.gzip root@192.168.100.234:/var/www/html/

WWWDIR="/var/www/html/"

ssh root@192.168.100.234 "cd /var/www/html; chown -R root:root .; chmod -R 777 ."
ssh root@192.168.100.234 "cd $PATH_TO_PRJ_ON_HOST; tar -xvf /var/www/html/$FILE_ARCHIVE -C $PATH_TO_PRJ_ON_HOST"
ssh root@192.168.100.234 "docker exec $CONTAINER_ID cd /var/www/html/; ls -lah;"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'cd /var/www/html/ && ls -lah && php composer.phar install'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'cd /var/www/html/src/Eshop/$BUNDLE_NAME/Resources/uikit/ && yarn install && yarn compile'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'cd /var/www/html/ && ls -lah && php bin/console assets:install && php bin/console assetic:dump && php bin/console cache:clear'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'cd /var/www/html/app/config/; cp parameters.yml.dist parameters.yml'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'chown -R www-data:www-data /var/www/html/'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'chown -R root:www-data /var/www/html/'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'find /var/www/html/ -type f -exec chmod 644 {} \;'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'find /var/www/html/ -type d -exec chmod 755 {} \;'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'chgrp -R www-data /var/www/html/var/'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'chmod -R ug+rwx /var/www/html/var/'"
ssh root@192.168.100.234 "docker exec -i $CONTAINER_ID bash -c 'cd /var/www/html/ && ls -lah && php bin/console doctrine:schema:update --force'"