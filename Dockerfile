FROM python:3.10-slim

USER root
WORKDIR /root

RUN apt-get update && \
    apt-get -y install gcc libmariadb-dev

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY src .

ENTRYPOINT ["python", "manage.py", "runserver", "0:8000"]
