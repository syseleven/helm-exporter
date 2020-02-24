REGISTRY=syseleven
VERSION=$(shell if test -n "$$TRAVIS_TAG"; then echo "$$TRAVIS_TAG"; else echo "$$TRAVIS_COMMIT"; fi)

default: compile

build-image:
	docker build -t "$(REGISTRY)/helm-exporter:$(VERSION)" .

push-image:
	echo "$$DOCKER_PASSWORD" | docker login -u "$$DOCKER_USERNAME" --password-stdin
	docker push "$(REGISTRY)/helm-exporter:$(VERSION)"
