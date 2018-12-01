IMAGE := fikovnik/jupyter-scala
CONTAINER := jupyter

.PHONY: build

build:
	docker build --rm -t $(IMAGE) .
