IMAGE := fikovnik/jupyter-scala
CONTAINER := jupyter

.PHONY: build run enter stop kill rm

build:
	docker build --rm -t $(IMAGE) .

run:
	@if docker ps | grep $(CONTAINER) 2>&1 > /dev/null; then \
		echo "$(CONTAINER): already running"; \
	elif docker ps -a | grep $(CONTAINER) 2>&1 > /dev/null; then \
		docker start $(CONTAINER); \
	else \
		docker run \
			--name $(CONTAINER) \
			-d \
			-p 8787:8787 \
			-p 3838:3838 \
			-v $$(pwd):/home/jovyan/work \
			$(IMAGE); \
	fi;

stop:
	@docker stop $(CONTAINER)

kill:
	@docker kill $(CONTAINER)

rm:
	@docker rm $(CONTAINER)

enter:
	@docker exec -ti $(CONTAINER) bash
