NAME = inception

GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
RESET = \033[0m

all:
	@echo "$(GREEN)Build$(RESET)"
	docker compose -f srcs/docker-compose.yml up --build

up:
	@echo "$(GREEN)Start$(RESET)"
	docker compose -f srcs/docker-compose.yml up

down:
	@echo "$(RED)Stop$(RESET)"
	docker compose -f srcs/docker-compose.yml down

clean:
	@echo "$(RED)Clean$(RESET)"
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	@echo "$(RED)Prune$(RESET)"
	sudo rm -rf /home/trischma/data/mariadb/*
	sudo rm -rf /home/trischma/data/wordpress/*
	docker system prune -af

re: fclean all

.PHONY: all up down clean fclean re