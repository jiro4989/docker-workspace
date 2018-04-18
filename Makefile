up:
	docker-compose up -d

stop:
	docker-compose stop

clean: stop
	docker-compose rm -f

build: clean
	docker-compose build

login:
	docker exec -it workspace zsh --login
