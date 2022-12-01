# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfilloux <lfilloux@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/22 11:25:58 by lfilloux          #+#    #+#              #
#    Updated: 2022/12/01 10:54:44 by lfilloux         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= inception

all:
	@mkdir -p /home/lfilloux/data/mariadb
	@mkdir -p /home/lfilloux/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build -d

up:
	@mkdir -p /home/lfilloux/data/mariadb
	@mkdir -p /home/lfilloux/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@docker system prune -f
	@docker rmi nginx
	@docker rmi mariadb
	@docker rmi wordpress
	@docker volume rm srcs_mdb_vol
	@docker volume rm srcs_wp_vol
	@docker system prune -f
	@sudo rm -rf /home/bcaffere/

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