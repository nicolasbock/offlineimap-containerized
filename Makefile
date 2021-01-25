.PHONY: image

image:
	docker pull ubuntu:xenial
	docker pull ubuntu:bionic
	docker build --tag offlineimap --no-cache .
