setup:
	mkdir -p ./data/jenkins
	mkdir -p ./data/sonarqube

up:
	docker-compose up -d

stop:
	docker-compose stop

clean: stop
	docker-compose rm -f

build: clean setup
	docker-compose build

login: up
	docker exec -it workspace zsh --login

.PHONY: setup up stop clean build login
