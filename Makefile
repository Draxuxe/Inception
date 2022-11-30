# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfilloux <lfilloux@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/22 11:25:58 by lfilloux          #+#    #+#              #
#    Updated: 2022/11/30 13:47:06 by lfilloux         ###   ########.fr        #
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

clean:
	@docker-compose -f srcs/docker-compose.yml down
	@docker rm $(docker ps -qa)
	@docker rmi -f $(docker images -qa)
	@docker volume rm $(docker volume ls -q)
	@docker network rm $(docker network ls -q)
	@docker system prune -a --volume
	@docker system prune -a --force
	@rm -rf /home/lfilloux/

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