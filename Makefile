NAME= inception

all:
	@mkdir -p /home/aleferra/data/mariadb
	@mkdir -p /home/aleferra/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build -d

up:
	@mkdir -p /home/aleferra/data/mariadb
	@mkdir -p /home/aleferra/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker stop nginx
	@docker stop mariadb
	@docker stop wordpress
	@docker rm nginx
	@docker rm mariadb
	@docker rm wordpress
	@docker rmi nginx
	@docker rmi mariadb
	@docker rmi wordpress
	@docker volume rm srcs_mariadb_vol
	@docker volume rm srcs_wordpress_vol
	@docker network rm srcs_inception
	@docker system prune -f
	@sudo rm -rf /home/aleferra/data/wordpress
	@sudo rm -rf /home/aleferra/data/mariadb

info:
	@echo "=============================== IMAGES ==============================="
	@docker images
	@echo
	@echo "============================= CONTAINERS ============================="
	@docker ps -a
	@echo
	@echo "=============== NETWORKS ==============="
	@docker network ls
	@echo
	@echo "====== VOLUMES ======"
	@docker volume ls

.PHONY:	all up down clean info
