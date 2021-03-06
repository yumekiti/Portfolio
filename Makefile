
dc := docker-compose -f ./docker/docker-compose.development.yml

.PHONY: up
up:
	$(dc) up -d --build

.PHONY: down
down:
	$(dc) down

.PHONY: restart
restart:
	$(dc) restart
	
.PHONY: reup
reup:
	@make down
	@make up

.PHONY: rm
rm:
	$(dc) down --rmi all

.PHONY: logs
logs:
	$(dc) logs -f

.PHONY: vue
vue:
	$(dc) exec vue /bin/sh

.PHONY: nginx
nginx:
	$(dc) exec nginx /bin/sh

.PHONY: ip
ip:
	bash awk '{print $$1}' ./docker/nginx/log/access.log | sort | uniq -c | sort -nr
