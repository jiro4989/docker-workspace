setup:
	mkdir -p ./data/jenkins
	mkdir -p ./data/sonarqube
	sudo apt-get install -y mysql-client

up:
	docker-compose up -d

stop:
	docker-compose stop

clean: stop
	docker-compose rm -f
	docker volume prune -f

build: clean
	docker-compose build

login:
	docker exec -it workspace zsh --login

login-db:
	mysql -h 127.0.0.1 -P 3310 -u root -ppassword dev

.PHONY: setup up stop clean build login
