FROM python:3.11-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app
COPY . /app
COPY alembic alembic
COPY requirements.txt .
COPY .env_docker .env

RUN pip install -r requirements.txt

CMD ["alembic", "upgrade", "head"]