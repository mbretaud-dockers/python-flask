# VERSION 1.0
# AUTHOR: Mathieu Bretaud
# DESCRIPTION: API Python Flask
# BUILD: docker build --tag docker-python-flask:1.0.0 .
# SOURCE: 

FROM jfloff/alpine-python:latest

# Update packages
RUN apk update && apk add --no-cache py3-setuptools

# Install the packages Python
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

MAINTAINER Mathieu Bretaud

ARG http_port=5000
ARG host=0.0.0.0

ENV HOST ${host:-0.0.0.0}
ENV HTTP_PORT ${http_port:-5000}
ENV WORK_HOME /opt

# Volume
VOLUME ${WORK_HOME}

# Work directory
WORKDIR ${WORK_HOME}

# Copy local files
COPY ./app ${WORK_HOME}/

# The entry point to the Docker
ENTRYPOINT [ "python" ]

# Expose ports.
EXPOSE ${HTTP_PORT}

# Define default command.
CMD [ "app.py" ]