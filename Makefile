# Define variables
COMPOSE_FILE := "./srcs/docker-compose.yml"
WORDPRESS_DATA_DIR := /home/yochakib/data/wordpress
MARIA_DB_DATA_DIR := /home/yochakib/data/mariadb

# Define targets
.PHONY: up down logs clean build

up: build
	docker-compose -f $(COMPOSE_FILE) up -d 

down:
	docker-compose -f $(COMPOSE_FILE) down

logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

clean:
	docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	rm -rf $(WORDPRESS_DATA_DIR)/*
	rm -rf $(MARIA_DB_DATA_DIR)/*

build: create_dirs
	docker-compose -f $(COMPOSE_FILE) build

create_dirs:
	mkdir -p $(WORDPRESS_DATA_DIR)
	mkdir -p $(MARIA_DB_DATA_DIR)