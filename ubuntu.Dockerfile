ARG GIT_TAG=main

FROM ubuntu

WORKDIR /app

RUN apt-get update \
    && apt-get install -y python3 \
    python3-pip \
    git \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/MrDave/StaticJinjaPlus/archive/${GIT_TAG}.tar.gz /app/StaticJinjaPlus.tar.gz

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