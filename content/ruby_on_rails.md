---
title: Ruby on rails
---

# Содержание #
{: id="Содержание" }

[Авторизация](#Авторизация)

[Миграции](#Миграции)

[Примеры](#Примеры)

# Авторизация #
{: id="Авторизация" }

авторизация

: предоставление права на доступ к ресурсу

аутентификация

: подтверждение/проверка права на доступ к ресурсу

верификация

: проверка подлинности идентификатора

идентификатор

: имя учетной записи

идентификация

: опознавание

пароль

: секретное слово для доступа к учетной записи

учётная запись

: запись в постоянном хранилище данных, содержащая сведения о пользователе

# Миграции #
{: id="Миграции" }

`rails db:migrate`

Осуществить миграцию

`rails generate migration CreateJoinTableGenresMovies genre movie`

  Сгенерировать файл миграции для реализации отношения многие со многими (has
  and belongs to many)

# Примеры #
{: id="Примеры" }

## Создание нового приложения ##

**1\.** Сгенерировать каркас нового приложения

~~~~
rails new demo \
  --skip-bundle \
  --skip-test \
  --skip-docker \
  --skip-git \
  --css tailwind
~~~~

• Создать новое приложение Rails

• Не запускать `bundle install` (`--skip-bundle`)

• Не создавать файлы тестов (`--skip-test`)

• Не создавать файлы системы Docker (`--skip-docker`)

• Не создавать файлы системы Git и не запускать `git init` (`--skip-git`)

• Использовать инструмент CSS Tailwind (`--css tailwind`)

**2\.** Произвести настройку инструмента Bundler

`bundle config path 'vendor/bundle`

**3\.** Добавить сторонние инструменты

`bundle add -g|--group=test cucumber-rails`

`bundle add -g|--group=test database_cleaner`

`bundle add -g|--group=development,test rspec-rails`

`bundle add haml-rails`

`bundle add dartsass-sprockets`

или

~~~~
# Gemfile

gem 'cucmber-rails'
gem 'database_cleaner'
gem 'rspec-rails'
gem 'haml-rails'
gem 'dartsass-sprockets'
~~~~

`bundle install`

**4\.** Осуществить установку инструментария BDD

`bundle exec rails generate cucumber:install`

`bundle exec rails generate rspec:install`

**4a\.** Осуществить установку инструмента Tailwind

`bundle exec rails tailwindcss:install`

**5\.** Осуществить проверку работоспособности инструментов BDD

`bundle exec cucumber`

`bundle exec rspec`

**6\.** Настроить подсистему интернализации

~~~~
# config/initializer/locales.rb


I18n.available_locales = [:en, :ru]
I18n.default_locale = :ru
~~~~

~~~~
# config/locales/ru.yml

ru:
  products: "Продукты"
  new_product: "Новый продукт"
~~~~

**7\.** Установить систему Foreman

`bundle add -g|--group development foreman`

**7a\.** Создать файл `Procfile.dev`

~~~~
# ./Procfile.dev

web: bundle exec rails server --port 4444
css: bundle exec rails tailwindcss:watch
~~~~

**7b\.** Проверить действительность файла `Procfile.dev`

`foreman check -f|--procfile Procfile.dev`

**7c\.** Запустить систему Foreman

`foreman start -f|--procfile Procfile.dev`

**8\.** Установить пакет `geckodriver`

`pacman -S geckodriver`

После установки указанного пакета будет доступен запуск интеграционных тестов
командой `rails test:system`

**9\.** Установить компонент CanCanCan

`bundle add cancancan`

**9a\.** Сгенерировать модель `Ability` компонента CanCanCan

`rails generate cancan:ability`

**10\.** Установить компонент Bcrypt

`bundle add bcrypt`

