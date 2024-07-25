ARG GIT_TAG=main

FROM ubuntu

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip git python3-venv



RUN git clone https://github.com/MrDave/StaticJinjaPlus.git /app/StaticJinjaPlus \
&& cd /app/StaticJinjaPlus && git checkout $GIT_TAG

WORKDIR /app/StaticJinjaPlus

RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install -r requirements.txt && \
    python3 main.py

ENTRYPOINT ["python", "main.py"]

CMD ["--help"]