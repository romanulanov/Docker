# StaticJinjaPlusPort

Порт для генератора статических файлов [StaticJinjaPlus](https://github.com/MrDave/StaticJinjaPlus).


## Сборка докер образа

1. Установите [Docker](https://www.docker.com/), если он ещё не установлен.:
 
2. Загрузите образ из Docker Hub: 
    ```bash
   docker pull turnsourcream823/static-jinja-plus:tagname
   ```  
3. Запустите контейнер:
    ```bash
   docker run --rm -v "$(pwd)/templates:/WORKDIR/templates" -v "$(pwd)/output:/WORKDIR/build" turnsourcream823/static-jinja-plus:tagname
   ```
   - `WORKDIR` для pyhon-slim `/StaticJinjaPlus/`, для образов ubuntu `/app/StaticJinjaPlus/`
   - `--rm` для удаления контейнера после завершения работы.
   - `-v "$(pwd)/templates:/StaticJinjaPlus/templates"`: смонтируйте папку templates с вашего локального компьютера в контейнер, чтобы docker мог получить доступ к вашим шаблонам.
   - `-v "$(pwd)/build:/StaticJinjaPlus/build"`: смонтируйте папку `build` с вашего локального компьютера в контейнер, чтобы получить результаты работы StaticJinjaPlus.
   - `tagname` замените на один из [тэгов](https://hub.docker.com/repository/docker/turnsourcream823/static-jinja-plus/tags) из Docker Hub.

Ссылка на [DockerHub](https://hub.docker.com/repository/docker/turnsourcream823/static-jinja-plus/).

## Аргументы для создания образа

В докерфайлах проекта аргументы заданы по умолчанию как:
```bash
ARG GIT_TAG=latest
ARG TEMPLATE_FOLDER=templates
```
`GIT_TAG` нужен чтобы задать тег, а `TEMPLATE_FOLDER` чтобы  задать папку в образе для хранения шаблонов.

## Структура директорий порта
```
└── 0.1
    ├── python
    ├── ubuntu
└── develop
    ├── python
    ├── ubuntu
```
В каждой из подпапок лежит докерфайл. В подпапках 0.1 лежат докерфайлы версий 0.1.0 и 0.1.1.

## Примеры создания образа

Образ `latest`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus develop/ubuntu/Dockerfile . 
docker run -v "$(pwd)/build:/app/StaticJinjaPlus/build" -v "$(pwd)/templates:/app/StaticJinjaPlus/templates" -it turnsourcream823/static-jinja-plus
```
Образ `develop-slim`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus:develop-slim develop/python/Dockerfile . 
docker run -v "$(pwd)/build:/app/StaticJinjaPlus/build" -v "$(pwd)/templates:/StaticJinjaPlus/templates" -it turnsourcream823/static-jinja-plus:develop-slim
```
Образ `develop`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus:develop develop/ubuntu/Dockerfile . 
docker run -v "$(pwd)/build:/app/StaticJinjaPlus/build" -v "$(pwd)/templates:/app/StaticJinjaPlus/templates" -it turnsourcream823/static-jinja-plus:develop
```
Образ `0.1.0-slim`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus:0.1.0-slim 0.1/python/Dockerfile . --build-arg GIT_TAG=0_1_0 --build-arg TEMPLATE_FOLDER=new_templates
docker run -v "$(pwd)/build:/StaticJinjaPlus/build" -v "$(pwd)/new_templates:/StaticJinjaPlus/new_templates" -it turnsourcream823/static-jinja-plus:0.1.0-slim
```
Образ `0.1.1-slim`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus:0.1.1-ubuntu 0.1/ubuntu/Dockerfile . --build-arg GIT_TAG=0_1_1 --build-arg TEMPLATE_FOLDER=new_templates
docker run -v "$(pwd)/build:/StaticJinjaPlus/build" -v "$(pwd)/new_templates:/StaticJinjaPlus/new_templates" -it turnsourcream823/static-jinja-plus:0.1.1-ubuntu
```
Образ `0.1.0-ubuntu`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus:0.1.0-ubuntu 0.1/python/Dockerfile . --build-arg GIT_TAG=0_1_0 --build-arg TEMPLATE_FOLDER=new_templates
docker run -v "$(pwd)/build:/StaticJinjaPlus/build" -v "$(pwd)/new_templates:/app/StaticJinjaPlus/new_templates" -it turnsourcream823/static-jinja-plus:0.1.0-ubuntu
```
Образ `0.1.1-ubuntu`:
```bash
docker build -t -f turnsourcream823/static-jinja-plus:0.1.1-ubuntu 0.1/python/Dockerfile . --build-arg GIT_TAG=0_1_1 --build-arg TEMPLATE_FOLDER=new_templates
docker run -v "$(pwd)/build:/StaticJinjaPlus/build" -v "$(pwd)/new_templates:/app/StaticJinjaPlus/new_templates" -it turnsourcream823/static-jinja-plus:0.1.1-ubuntu
```

##Публикация образа на Docker Hub

Заведите аккаунт на Docker Hub и выполните для логина команду:
```bash
sudo docker login
```
Для публикации образа на Docker Hub важно чтобы название образа начиналось с вашего логина, поэтому при сборке название вашего образа должно выглядеть `<имя вашего пользователя>/static-jinja-plus:<тег>-<версия>`. Учитывайте это при сборке, например, чтобы запушить образ с тегом `0.1.1` и версией `ubuntu` пользователя с именем `vasyapupkin` я сначала соберу образ и затем опубликую его на Docker Hub:
```bash
docker build -t -f vasyapupkin/static-jinja-plus:0.1.1-ubuntu 0.1/python/Dockerfile . --build-arg GIT_TAG=0_1_1 --build-arg TEMPLATE_FOLDER=new_templates
docker push vasyapupkin/static-jinja-plus:0.1.1-ubuntu 
```