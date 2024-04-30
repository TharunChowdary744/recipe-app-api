FROM python:3.9-alpine3.13
LABEL maintainer="Tharunchowdary"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requiements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000