# intra id
INTRA = gyeon
# Images
## repository name must be lowercase
IMG_NGINX = inception_nginx
IMG_WORDPRESS = inception_wordpress
IMG_MARIADB = inception_mariadb
# Containers
CON_NGINX = con_$(IMG_NGINX)
CON_WORDPRESS = con_$(IMG_WORDPRESS)
CON_MARIADB = con_$(IMG_MARIADB)
# DB
DB_USER_PASS = 1q2w3e
DB_ROOT_PASS = 1q2w3e4r
# VOLUME
VOLUME_DIR = /home/$(INTRA)/data

#
COMPOSE_YML_DIR = ./srcs
ENV_DIR = ./srcs
NGINX_CONF_DIR = ./srcs/requirements/nginx/conf

ALL : up

up : VOLUME_SET ENV_INIT NGINX_CONF_INIT
	sudo docker compose -f $(COMPOSE_YML_DIR)/docker-compose.yml up --build --force-recreate -d
	@sudo bash ./cnt.sh

VOLUME_SET : CLEAN_DIR MAKE_VOL

CLEAN_DIR :
	sudo rm -rf $(VOLUME_DIR)

MAKE_VOL :
	sudo mkdir -p $(VOLUME_DIR)/mariadb
	sudo mkdir -p $(VOLUME_DIR)/wordpress

RM_VOL :
	sudo rm -rf $(VOLUME_DIR)

ENV_INIT :
	@cp $(ENV_DIR)/.env.Template $(ENV_DIR)/.env
	@chmod +rwx $(ENV_DIR)/.env
	@sed -i "s#!VOLUMES_DIR#$(VOLUME_DIR)#g" $(ENV_DIR)/.env
	@sed -i "s#!INTRA#$(INTRA)#g" $(ENV_DIR)/.env
	@sed -i "s#!MARIADB_USER#$(INTRA)#g" $(ENV_DIR)/.env
	@sed -i "s#!MARIADB_PWD#$(DB_USER_PASS)#g" $(ENV_DIR)/.env
	@sed -i "s#!MARIADB_ROOT_PWD#$(DB_ROOT_PASS)#g" $(ENV_DIR)/.env
	@sed -i "s#!IMG_NGINX_NAME#$(IMG_NGINX)#g" $(ENV_DIR)/.env
	@sed -i "s#!CON_NGINX_NAME#$(CON_NGINX)#g" $(ENV_DIR)/.env
	@sed -i "s#!IMG_WORDPRESS_NAME#$(IMG_WORDPRESS)#g" $(ENV_DIR)/.env
	@sed -i "s#!CON_WORDPRESS_NAME#$(CON_WORDPRESS)#g" $(ENV_DIR)/.env
	@sed -i "s#!IMG_MARIADB_NAME#$(IMG_MARIADB)#g" $(ENV_DIR)/.env
	@sed -i "s#!CON_MARIADB_NAME#$(CON_MARIADB)#g" $(ENV_DIR)/.env

ENV_RM :
	sudo rm -f $(ENV_DIR)/.env
#sudo echo "127.0.0.1 $(INTRA).42.fr" >> /etc/hosts

NGINX_CONF_INIT :
	cp $(NGINX_CONF_DIR)/default.conf.Template $(NGINX_CONF_DIR)/default.conf
	chmod +rwx $(NGINX_CONF_DIR)/default.conf
	@sed -i "s#!INTRA#$(INTRA)#g" $(NGINX_CONF_DIR)/default.conf

NGINX_CONF_RM :
	sudo rm -f $(NGINX_CONF_DIR)/default.conf

BACKUP :
	sudo 

rm : down RM_VOL ENV_RM NGINX_CONF_RM
	-sudo docker image rm $(IMG_NGINX)
	-sudo docker image rm $(IMG_WORDPRESS)
	-sudo docker image rm $(IMG_MARIADB)
	
down : ENV_INIT
	sudo docker compose -f $(COMPOSE_YML_DIR)/docker-compose.yml down -v

re : down up

.PHONY : up rm down re
