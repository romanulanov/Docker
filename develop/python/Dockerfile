FROM python:3.12-slim

WORKDIR /StaticJinjaPlus/

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/main.tar.gz staticjinjaplus.tar.gz 

RUN tar -xzf staticjinjaplus.tar.gz  -C /StaticJinjaPlus/ --strip-components=1 \
    && rm staticjinjaplus.tar.gz 

RUN python3 -m venv venv
ENV PATH="/StaticJinjaPlus/venv/bin:$PATH"
RUN pip install -r requirements.txt --no-cache-dir 

ARG TEMPLATE_FOLDER=templates
ENV TEMPLATE_FOLDER=${TEMPLATE_FOLDER}
CMD sh -c "python3 main.py -w --srcpath ${TEMPLATE_FOLDER}"