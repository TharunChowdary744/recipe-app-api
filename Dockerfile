FROM python:3.9-alpine3.13
#the above point specify that we are using 3.9 version and alpine version(it is a light weight version of linux)

LABEL maintainer="londonappdeveloper.com"
#the above point specify that who is maintaining the project

ENV PYTHONUNBUFFERED 1
# it tells the python to don't wanna buffer while run the project in the container

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000
# Copy the requirements file from requirements.txt

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
    --disabled-password \
    --no-create-home \
    django-user

ENV PATH="/py/bin:$PATH"

USER django-user