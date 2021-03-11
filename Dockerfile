FROM python:rc-alpine3.13

WORKDIR /opt/evaluacion-bp
COPY ./app .
RUN python -m pip install Flask
ENTRYPOINT ["python3", "server.py"]
