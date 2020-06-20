.PHONY: image

image:
	docker pull ubuntu:xenial
	docker build --tag offlineimap --no-cache .
