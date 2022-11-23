# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfilloux <lfilloux@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/22 11:25:58 by lfilloux          #+#    #+#              #
#    Updated: 2022/11/23 10:36:26 by lfilloux         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= inception

all:
	@sudo chown lfilloux /var/run/docker.sock
	@mkdir -p /home/lfilloux/data/mariadb
	@mkdir -p /home/lfilloux/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down 
	@docker system prune -f

re: clean all

.PHONY: all re clean down