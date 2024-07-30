ARG GIT_TAG=main

FROM python:slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/MrDave/StaticJinjaPlus.git /app/StaticJinjaPlus \
    && cd /app/StaticJinjaPlus \
    && git checkout $GIT_TAG

WORKDIR /app/StaticJinjaPlus

RUN pip install -r requirements.txt --no-cache-dir 

ENTRYPOINT ["python", "main.py"]

CMD ["--help"]