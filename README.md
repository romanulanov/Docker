# StaticJinjaPlus

StaticJinjaPlus is a tool to build static sites using [Jinja](https://jinja.palletsprojects.com/).

## Сборка докер образа

Можно построить образ на основе ubuntu и slim-python. Доступны три версии: 0.1.0, 0.1.1 и latest. Например, чтобы построить образ на основе slim-python версии 0.1.0 перейдите в папку с докерфайлом и запустите команду для сборки:
```commandline
cd slim
docker build -f slim.Dockerfile -t static-jinja-plus:0.1.0-slim .
```
После построения образа в терминале появится сообщение 
```commandline
Successfully tagged static-jinja-plus:0.1.0-slim
```
Чтобы запустить образ:
```commandline
docker run -it static-jinja-plus:0.1.0-slim  bash 
```
По умолчанию путь к сгенерированным шаблонам указан как `/app/staticjinjaplus/build`. Также вы можете скачать с [репозитория](https://hub.docker.com/repository/docker/turnsourcream823/static-jinja-plus/) на Docker Hub.

Чтобы выложить образ на Docker Hub сначала залогиньтесь:
```commandline
docker login
```
При сборке образа укажите ваш логин в названии образа. Например, если мой логин turnsourcream823, то при сборке я воспользуюсь командой:
```commandline
docker build -f slim.Dockerfile -t turnsourcream823/static-jinja-plus:0.1.0-slim .
```
Теперь, чтобы выложить образ я воспользуюсь командой:
```commandline
docker pull turnsourcream823/static-jinja-plus
```