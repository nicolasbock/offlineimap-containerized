.PHONY: image

image:
	docker pull ubuntu:xenial
	docker pull ubuntu:bionic
	docker build --tag offlineimap-python2 --file Dockerfile-python2 --no-cache .
	docker build --tag offlineimap-python3 --file Dockerfile-python3 --no-cache .
