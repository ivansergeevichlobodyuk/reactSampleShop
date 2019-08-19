eshop 
=====

1. install docker engine

2. in console run: "docker login" and following instructions
crefentials for dockerhub is 
user: ivanlobodyuk
pass: efd301cb

run the following comands:

3. docker pull ivanlobodyuk/php7.1.24-1mysql5.7.24phpmyadmin

4. "docker images" - and see that image is really downloaded
 
 
5. clone this project for example to /var/www/eshop/ with command
git clone git@github.com:ivansergeevichlobodyuk/eshoplead.git

6. create container and map ports and volumes 

docker run -d -p 8088:80 -v /var/www/eshop/:/var/www/html/ ivanlobodyuk/php7.1.24-1mysql5.7.24phpmyadmin

7. docker ps -a for see active running container

8. docker exec -it "put_here_container_id_from_previous_point_7" bash

9. /etc/init.d/mysql start 

10. go to browser http://localhost:8088/phpmyadmin credentials is root/root 

11. under docker container (point 8 console) cd /var/www/html/eshoplead 
run command "php composer.phar install" and following instructions

12. cd Resources/uikit/ run command yarn install for installing dependencies
 
13. under Resources/uikit/ run yarn compile for compile your theme. Plz 
check that under Resources/uikit/dist/css/ was created %yornametheme%.min.css and 
other *.min.css and js files
 
14. under docker container run cd /var/www/eshop/eshoplead and than 
php bin/console assetic:dump 

15. http://localhost:8088/eshoplead/web/app_dev.php/catalog 


p.s. all previous pathes is just example.