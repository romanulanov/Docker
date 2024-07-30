ARG GIT_TAG=main

FROM python:slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/MrDave/StaticJinjaPlus/archive/${GIT_TAG}.tar.gz /app/StaticJinjaPlus.tar.gz
RUN tar -xzf /app/StaticJinjaPlus.tar.gz -C /app --strip-components=1 \
    && rm /app/StaticJinjaPlus.tar.gz

RUN cd /app/StaticJinjaPlus 

WORKDIR /app/StaticJinjaPlus

RUN pip install -r requirements.txt --no-cache-dir 

ENTRYPOINT ["python", "main.py"]

CMD ["--help"]