ARG GIT_TAG=main

FROM python:slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git 

RUN git clone --branch ${GIT_TAG} https://github.com/MrDave/StaticJinjaPlus.git

WORKDIR /app/StaticJinjaPlus

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "main.py"]

CMD ["--help"]