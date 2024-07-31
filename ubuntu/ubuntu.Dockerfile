FROM ubuntu:20.04

ARG GIT_TAG=main
ARG CHECKSUM=3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444

WORKDIR /app

RUN apt-get update \
    && apt-get install -y python3 \
    python3-pip \
    git \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

ADD --checksum=sha256:$CHECKSUM https://github.com/MrDave/StaticJinjaPlus/archive/${GIT_TAG}.tar.gz /app/StaticJinjaPlus.tar.gz

RUN tar -xzf /app/StaticJinjaPlus.tar.gz -C /app --strip-components=1 \
    && rm /app/StaticJinjaPlus.tar.gz \
    && cd /app/StaticJinjaPlus 
    
WORKDIR /app/StaticJinjaPlus

RUN python3 -m venv venv \
    && . venv/bin/activate && \
    && pip install -r requirements.txt --no-cache-dir \
    && python3 main.py

ENTRYPOINT ["python", "main.py"]

CMD ["--help"]