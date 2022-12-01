# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lfilloux <lfilloux@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/22 11:25:58 by lfilloux          #+#    #+#              #
#    Updated: 2022/12/01 12:28:09 by lfilloux         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

all: prune reload

linux:
	@ echo "127.0.0.1 raccoman.42.fr" >> /etc/hosts
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf ~/Desktop/inception

prune: clean
	@ docker system prune -f

reload: 
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: linux stop clean prune reload all