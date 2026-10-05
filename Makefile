VERSION := 0.52.0

IMAGE := sunaoka/terravision

PLATFORM := linux/arm64,linux/amd64

BUILDER := docker-terravision-builder

BUILDER_ARGS := --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) -t $(IMAGE):latest

all: build

setup:
	(docker buildx ls | grep $(BUILDER)) || docker buildx create --name $(BUILDER)

build: setup
	docker buildx use $(BUILDER)
	docker buildx build --rm --no-cache --platform $(PLATFORM) $(BUILDER_ARGS) --push .
	docker buildx rm $(BUILDER)

release:
	git checkout main
	git add .
	git commit -m "Update v$(VERSION)"
	git tag -a v$(VERSION) -m "Release v$(VERSION)"
	git push origin main --tags

.PHONY: all setup build release
