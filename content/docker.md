---
title: Docker
---

# Содержание #
{: id="Содержание"}

[Терминология](#Терминология)

[Свойства контейнеров](#Свойства-контейнеров)

[Перечень пакетов](#Перечень-пакетов)

[Перечень файлов](#Перечень-файлов)

[Перечень команд](#Перечень-команд)

[Dockerfile](#Dockerfile)

[Ссылка на образ](#Ссылка-на-образ)

[Примеры](#Примеры)

[Ссылки](#Ссылки)

# Терминология #
{: id="Терминология"}

**Docker**

: Система управления контейнерами

: Программная платформа для запуска приложений в контейнерах

**контейнер** (_container_)

: Изолированное окружение для запуска приложений из образов

**образ** (_image_)

: Пакет с программой и всеми необходимыми зависимостями

: Операционное окружение плюс программное приложение

**реестр** (_registry_)

: Хранилище репозиториев образов

**репозиторий** (_repository_)

: Хранилище образов приложения в реестре

**ссылка** (_image reference_)

: Уникальный идентификатор образа

# Свойства контейнеров #
{: id="Свойства-контейнеров"}

**Модуляризация**

: Разбиение функциональных компонетов комплексного приложения на независимые модули со своим собственным технологическим стеком, комадной разработчиков, циклом разработки и развертывания, точкой (местом) развертывания.

**Унификация**

: Единый инструмент как для окружения разработки, так и для производственного окружения.

**Портируемость**

: Единая основа для запуска в различных окружениях.

**Изолированность**

: Возможность иметь изолированные друг от друга окружения.

**Легковесность**

: Потребление минимального количества ресурсов.

# Перечень пакетов #
{: id="Перечень-пакетов"}

**docker**

: Pack, ship and run any application as a lightweight container

  https://www.docker.com

**docker-compose**

: Fast, isolated development environments using Docker

  https://www.docker.com

# Перечень файлов #
{: id="Перечень-файлов"}

`~/.docker/config.json`

: Файл с настройками Docker'а

`/usr/lib/systemd/system/docker.service`

: Юнит-файл SystemD

# Перечень команд #
{: id="Перечень-команд"}

`docker version`

: Вывести сводку по Docker'у

`docker-compose version`

: Вывести сводку по Docker Compose

## Образы ##
{: id="Образы"}

`docker image ls`
`docker images`

: Вывести список всех локальных образов

`docker image ls -a|--all`

: Вывести список всех локальных образов, включая промежуточные (intermediate)

`docker image ls -q|--quiet`

: Вывести список идентификаторов локальных образов

`docker image ls --filter repository='rabbit' --filter repository='*/rabbit'`

: Вывести список локальных образов, отфильтровав его по указанным критериям

`docker image rm IMAGE_ID...`

: Удалить один или несколько локальных образов

`docker image rm $(docker image ls -aq)`

: Удалить все локальные образы

`docker image save -o|--output image.tar.gz IMAGE`

: Сохранить образ в архив

`docker image load -i|--input image.tar.gz`

: Внести образ из архива в локальный реестр

`docker image build -t|--tag IMAGE_NAME:TAG DOCKERFILE_LOCATION`

* Собрать образ Docker'а

* Задать произвольное имя для нового образа и опционально тэг

* Указать каталог с файлом Dockerfile, на основе которого будет собран данный образ

`docker image history --no-trunc IMAGE`

* Отобразить сборочный профиль для указанного образа в табличном формате

* Не обрезать длинные строки (`--no-trunc`)

`docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]`

: Создать ссылку на образ

## Контейнеры ##
{: id="Контейнеры"}

`docker container run IMAGE COMMAND`

* Скачать образ из удаленного репозитория (`hub.docker.com` по умолчанию), если он отсутствует в локальном репозитории

* Создать контейнер с заданными настройками из образа в локальном репозитории

* Запустить контейнер

* Выполнить заданную команду

`docker container run -i|--interactive -t|--tty 387f84126dbc 'sh'`

* Запустить контейнер с указанным образом (`387f84126dbc`)

* Не закрывать поток стандартного ввода (STDIN) по выходу из программы, запущенной в контейнере (`--interactive`)

* Выделить отдельный псевдотерминал (pseudo-TTY) для контейнера (`--tty`)

* Выполнить указанную команду в контейнере (`sh`)

`docker container run --rm IMAGE`

: Удалить контейнер по завершению его работы

`docker container run --rm alpine watch -tn 1 'ping google.com'`

: Цикличиски выполнять команду `ping` в созданном контейнере

`docker container run -d|--detach -p|--publish 8088:80 3a29d4fe4767`

* Запустить контейнер с указанным образом (`3a29d4fe4767`)

* Использовать фоновый режим запуска (`--detach`)

* Связать порт хоста с портом контейнера (`--publish 8088:80`)

  Трафик, идущий на порт 8088 на локальной машине, будет передан порту 80 контейнера.

`docker container create IMAGE_ID`

: Создать контейнер

`docker container create -p|--publish 8088:80 3a29d4fe4767`

* Создать контейнер

* Связать порт хоста с портом контейнера

  Трафик, идущий на порт 8088 на локальной машине, будет передан порту 80 контейнера.

`docker container create -e|--env 'METHOD=HEAD' -e|--env 'HOST=linux.org.ru' 7a6ec9807bdd`

* Создать контейнер

* Установить произвольные переменные окружения

  Программа, запущенная в контейнере будет иметь досту к заданным переменным.

`docker container create --network rabbit 7a6ec9807bdd`

* Создать контейнер

* Подключиться к указанной сети Docker'а

`docker container ls`

: Вывести список запущенных контейнеров

`docker container ls -a|--all`

: Вывести список всех локальных контейнеров как запущенных, так и незапущенных

`docker container ls -q|--quiet`

: Вывести список идентификаторов запущенных контейнеров

`docker container rm CONTAINER_ID...`

: Удалить один или несколько локальных контейнеров

`docker container rm $(docker container ls -aq)`

: Удалить все локальные контейнеры

`docker container rm -f|--force $(docker container ls -aq)`

: Удалить все локальные контейнеры, включая запущенные

`docker container start CONTAINER_ID...`

: Запустить один или несколько контейнеров

`docker container stop CONTAINER_ID...`

: Остановить один или несколько контейнеров

## Сети ##
{: id="Сети"}

`docker network ls`

: Вывести перечень сетей

`docker network create NETWORK`

: Создать сеть

`docker network rm NETWORK...`

: Удалить одну или несколько сетей

`docker network inspect NETWORK...`

: Отобразить детализированную информацию (в формате JSON) по одной или нескольким сетям

## Журналирование ##
{: id="Журналирование"}

`docker container logs CONTAINER_ID`

: Вывести журнал контейнера

`docker container logs -f|--follow CONTAINER_ID`

: Вывести журнал контейнера и остаться в режиме отслеживания

  Нажать `<Ctrl>+C` для выхода из режима отслеживания.

`docker container stats CONTAINER_ID`

: Вывести живую информацию о ресурсах, потребляемых контейнером

`docker container inspect CONTAINER_ID...`

: Отобразить детализированную информацию (в формате JSON) по одному или нескольким контейнерам

## Взаимодействие с контейнером ##
{: id="Взаимодействие-с-контейнером"}

`docker container exec CONTAINER_ID COMMAND`

: Выполнить команду в запущенном контейнере

  [docker exec \| Docker Documentation](https://docs.docker.com/engine/reference/commandline/exec/)

`docker container exec -i|--interactive -t|--tty 2d83314c9a66 sh`

: Создать интерактивную (-i) сессию командной оболочки (sh) в выделенном терминале (-t) в заданном контейнере (2d83314c9a66)

`docker container cp SOURCE DESTINATION`

: Скопировать файл из `SOURCE` в `DESTINATION`

`docker container cp src/index.html 2d83314c9a66:/usr/local/apache2/htdocs`

: Скопировать файл из локальной файловой системы в файловую систему контейнера

`docker container cp 2d83314c9a66:/usr/local/apache2/htdocs/index.html src`

: Скопировать файл из файловой системы контейнера в локальную файловую систему

  [docker container cp \| Docker Documentation](https://docs.docker.com/engine/reference/commandline/container_cp/)

`docker container commit CONTAINER [NAME:TAG]`

: Создать образ из контейнера

## Реестры ##

`docker login -u|--username -p|password [REGISTRY]`

: Внести регистрационные данные для указанного реестра (по умолчанию — _docker.io_)

`docker logout [REGISTRY]`

: Удалить регистрационные данные для указанного реестра (по умолчанию — _docker.io_)

`docker image pull IMAGE`

: Скачать образ из удаленного репозитория и сохранить в локальном

`docker image push IMAGE`

: Загрузить образ в удаленный репозиторий

## Системные команды ##
{: id="Системные-команды"}

`docker system df`

: Вывести информацию по использованию Docker'ом ресурсов файловой системы

# Dockerfile #
{: id="Dockerfile"}

`FROM`

* Инициализировать новый сборочный этап

  Для каждого сборочного этапа будет создан свой собственный кэш образов.

* Установить базовый образ для текущего сборочного этапа

  В качестве базового будет использован либо локальный образ, либо, при его отсутствии, образ из реестра по умолчанию (Docker Hub).

`ENTRYPOINT`

: Установить команду, выполняемую при запуске контейнера

  К установленной команде будут добавлены аргументы `-a -b -c` при запуске `docker container run NAME -a -b -c`.

  К установленной команде будут добавлены аргументы `-a -b -c` если в файле Dockerfile для сборки текущего образа будет дополнительно присутствовать запись `CMD ["-a", "-b", "-c"].

  К установленной команде будут добавлены аргумены `-d -e` при запуске `docker container run NAME -d -e`, несмотря на наличие в файле Dockerfile записи `CMD ["-a", "-b", "-c"]. То есть аргументы, указанные в данной записи будут перезаписаны.

  К установленной команде будут добавлены аргументы `-a -b -c` если в файле Dockerfile для сборки образа _основанного_ на текущем образе будет присутствовать запись `CMD ["-a", "-b", "-c"].

`CMD`

: Установить команду, выполняемую при запуске контейнера

  Установленная команда будет полностью перезаписана как `command -a -b -c` при запуске `docker container run NAME command -a -b -c`.

# Ссылка на образ #
{: id="Ссылка-на-образ"}

`docker.io¹/shamaoke²/murasaki³:latest⁴`

1. Домен реестра образов (по умолчанию — _docker.io_)

2. Имя учетной записи владельца образа (человек, либо организация)

3. Название репозитория для хранения образов приложения

4. Тэг, маркирующий версию образа приложения (по умолчанию ­ _latest_)

# Примеры #
{: id="Примеры"}

Продолжение и разветвление сборки образа, начатой на раннем этапе, на более
поздних этапах посредством использования ссылки на этап в инструкции `FROM`.

    # base stage
    FROM alpine AS builder
    
    RUN apk --update-cache add openjdk11-jdk
    RUN apk --update-cache add maven
    
    WORKDIR /build
    COPY pom.xml .
    
    # first reference to the base stage
    FROM builder AS build1
    COPY . /build
    RUN mvn package service1
    
    # second reference to the base stage
    FROM builder AS build2
    COPY . /build
    RUN mvn package service2
    
    # final stage
    FROM alpine
    
    RUN apk --update-cache add openjdk11-jre
    
    WORKDIR /app
    
    ENTRYPOINT ["/usr/bin/java", "-jar", "..."]
    
    # using the artifact from the first build stage
    COPY --from=build1 /build/service1.jar .
    
    # using the artifact from the second build stage
    COPY --from=build2 /build/service2.jar .

Использование индекса для ссылки на неименованный этап в инструкции `COPY`.

    FROM alpine
    ...
    
    FROM alpine
    COPY --from=0 ...

Прерывание процесса сборки на определенном этапе посредством опции `--target`
команды `build`.

    # :::base:::
    FROM alpine AS base
    
    RUN apk --update-cache add zsh
    
    WORKDIR /app
    ENTRYPOINT ["/app/greeting"]
    
    # :::rabbit:::
    FROM base AS rabbit
    COPY rabbit/rabbit greeting
    RUN chmod 744 greeting
    
    # :::fox:::
    FROM base AS fox
    COPY fox/fox greeting
    RUN chmod 744 greeting
    
    # :::wolf:::
    FROM base AS wolf
    COPY wolf/wolf greeting
    RUN chmod 744 greeting

    docker image build --target fox .

* Процесс сборки завершиться на этапе `fox`

* Этап `wolf` выполнен не будет

* Все этапы до этапа `fox` будут выполнены

# Сылки #
{: id="Ссылки"}

* [Manning \| Learn Docker in a Month of Lunches](https://www.manning.com/books/learn-docker-in-a-month-of-lunches)

* [Elton's Blog](https://blog.sixeyed.com)

* [sixeyed/diamol: Code samples for the book "Learn Docker in a Month of Lunches"](https://github.com/sixeyed/diamol)

* [linux - Exploring Docker container's file system - Stack Overflow](https://stackoverflow.com/questions/20813486/exploring-docker-containers-file-system)

## Документация ##
{: id="Документация"}

* [Docker Documentation \| Docker Documentation](https://docs.docker.com)

* [Dockerfile reference \| Docker Documentation](https://docs.docker.com/engine/reference/builder)

* [Use multi-stage builds \| Docker Documentation](https://docs.docker.com/develop/develop-images/multistage-build)

<!-- vim: set textwidth=80 colorcolumn=80: -->
