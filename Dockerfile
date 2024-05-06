# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/engine/reference/builder/

FROM python:3.10
# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y make


# Copy the source code into the container.
COPY  requirements.txt /app/

COPY entrypoints.sh /app/

RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app

RUN chmod +x entrypoints.sh

CMD [ "python","manage.py", "runserver", "0.0.0.0:8000" ]

