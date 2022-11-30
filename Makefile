# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfilloux <lfilloux@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/22 11:25:58 by lfilloux          #+#    #+#              #
#    Updated: 2022/11/30 10:38:49 by lfilloux         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= inception

all:
	@mkdir -p /home/lfilloux/data/mariadb
	@mkdir -p /home/lfilloux/data/wordpress
	@sudo mkdir -p /var/www/html
	@docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@docker rmi $$(docker images -q);
	@docker system prune -f

re: clean all

.PHONY: all re clean down