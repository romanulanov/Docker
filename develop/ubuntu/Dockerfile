FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app/StaticJinjaPlus/

ADD https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/main.tar.gz staticjinjaplus.tar.gz 

RUN tar -xzf staticjinjaplus.tar.gz -C /app/StaticJinjaPlus/ --strip-components=1 \
    && rm staticjinjaplus.tar.gz 

RUN python3 -m venv venv 
ENV PATH="/app/StaticJinjaPlus/venv/bin:$PATH"
RUN pip install -r requirements.txt --no-cache-dir 

ARG TEMPLATE_FOLDER=templates
ENV TEMPLATE_FOLDER=${TEMPLATE_FOLDER}
CMD sh -c "python3 main.py -w --srcpath ${TEMPLATE_FOLDER}"