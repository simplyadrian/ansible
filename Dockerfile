FROM alpine:latest
LABEL maintainer "Adrian Herrera <simplyadrian@gmail.com>"

RUN builddeps=' \
		python-dev \
		py2-pip \
		musl-dev \
		openssl-dev \
		libffi-dev \
		gcc \
		' \
	&& apk --no-cache add \
	ca-certificates \
	python \
	py-paramiko \
	py-yaml \
	py-jinja2 \
	py-httplib2 \
	$builddeps \
	&& pip install --upgrade pip \
	&& pip install \
		ansible \
		six \
	&& apk del --purge $builddeps
