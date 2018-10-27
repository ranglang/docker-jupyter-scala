IMAGE := fikovnik/jupyter-scala-211
CONTAINER := jupyter

.PHONY: build

build:
	docker build --rm -t $(IMAGE) .
