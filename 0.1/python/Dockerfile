ARG GIT_TAG=main

FROM python:3.12-slim as base

WORKDIR /StaticJinjaPlus/
RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

FROM base AS tag-0_1_0
ARG CHECKSUM=3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444
ADD --checksum=sha256:$CHECKSUM https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz staticjinjaplus.tar.gz 


FROM base AS tag-0_1_1
ARG CHECKSUM=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b
ADD --checksum=sha256:$CHECKSUM https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz staticjinjaplus.tar.gz 

FROM tag-${GIT_TAG} 

RUN tar -xzf staticjinjaplus.tar.gz  -C /StaticJinjaPlus/ --strip-components=1 \
    && rm staticjinjaplus.tar.gz 

RUN python3 -m venv venv
ENV PATH="/StaticJinjaPlus/venv/bin:$PATH"
RUN pip install -r requirements.txt --no-cache-dir 

ARG TEMPLATE_FOLDER=templates
ENV TEMPLATE_FOLDER=${TEMPLATE_FOLDER}
CMD sh -c "python3 main.py -w --srcpath ${TEMPLATE_FOLDER}"