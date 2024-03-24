---
title: CMake
---

# Содержание #
{: id="Содержание" }

[Файлы](#Файлы)

[Переменные окружения](#Переменные_окружения)

[Перечень команд CMakeLists.txt](#Перечень_команд_CMakeLists.txt)

[Перечень команд командной строки](#Перечень_команд_командной_строки)

[Ссылки](#Ссылки)

В процессе разработки программного обеспечения наступает момент, когда
приходится переводить исходный код во что-то, что может быть использовано
конечным пользователем.

Этот процесс называется _сборкой программного обеспечения_.

Сборка программного обеспечения — это комплексный процесс.

Для управления комплексностью при сборки программного обеспечения требуется подходящий инструмент.

Таким иструментом является CMake.

**CMake** — инструмент управления сборкой программного обеспечения.

Цель CMake — обеспечить управляемостью комплексный процесс сборки программного обеспечения.

CMake — это набор инструментов для осуществления сборки программного обеспечения.

Сборка программного обеспечения в системе CMake происходит поэтапно.

Упрощенно, процесс работы CMake можно разделить на пять этапов.

* Составление _файла описания проекта_ (_файла управления сборкой_)

* Генерирование _файла сборки_ из файла управления сборкой

  * Конфигурация

  * Собственно генерирование

* Сборка

* Тестирование

* Упаковка

Основным артефактом системы CMake является файл `CMakeLists.txt`. Он определяет
что должно быть собрано и как, какие тесты должны быть запущены и какие пакеты
созданы.

Данный файл является _файлом описания проекта_. Он служит для управления
комплексным процессом сборки программного обеспечения.

Фундаментальным понятием системы CMake является понятие _проекта_. Сборка
проекта — это то, что находится под управлением системы CMake.

Структура проекта состоит из двух частей: _исходные файлы_ и _двоичные файлы_.

В рамках системы CMake установлен следующий порядок размещения указанных файлов
по каталогам: исходные файлы размещаются в _каталоге с исходным кодом_, двоичные
файлы размещаются в _каталоге с двоичными файлами_ (или в _каталоге сборки_).

Каталог с исходным кодом находится под управлением разработчика.

Каталог сборки находится под управлением системы CMake. В процессе работы
системы в этом каталоге создаются различные артефакты системы сборки, а также файлы,
являющиеся результатом сборки.

В отношении того, где будет размещен каталог сборки существует два варианта.
Каталог сборки размещен в каталоге с исходным кодом (_in-source_). Каталог
сборки размещен вне каталога с исходным кодом (_out-source_).

В процессе работы система CMake создает файлы сборки выбранной системы сборки.
Для конкретной системы сборки должен быть использован соответствующий генератор.

Базовая форма работы с системой CMake.

    cd build
    cmake -G Ninja ../source
    cmake --build .

Второй вариант базовой формы работы с системой CMake.

    cmake -G Ninja -S source -B build
    cmake --build build

# Файлы #
{: id="Файлы" }

    /usr/bin/ccmake
    /usr/bin/cmake
    /usr/bin/cmake-gui
    /usr/bin/cpack
    /usr/bin/ctest
    
    /usr/share/man/man1/ccmake.1.gz
    /usr/share/man/man1/cmake-gui.1.gz
    /usr/share/man/man1/cmake.1.gz
    /usr/share/man/man1/cpack.1.gz
    /usr/share/man/man1/ctest.1.gz
    
    /usr/share/man/man7/cmake-buildsystem.7.gz
    /usr/share/man/man7/cmake-commands.7.gz
    /usr/share/man/man7/cmake-compile-features.7.gz
    /usr/share/man/man7/cmake-configure-log.7.gz
    /usr/share/man/man7/cmake-cxxmodules.7.gz
    /usr/share/man/man7/cmake-developer.7.gz
    /usr/share/man/man7/cmake-env-variables.7.gz
    /usr/share/man/man7/cmake-file-api.7.gz
    /usr/share/man/man7/cmake-generator-expressions.7.gz
    /usr/share/man/man7/cmake-generators.7.gz
    /usr/share/man/man7/cmake-language.7.gz
    /usr/share/man/man7/cmake-modules.7.gz
    /usr/share/man/man7/cmake-packages.7.gz
    /usr/share/man/man7/cmake-policies.7.gz
    /usr/share/man/man7/cmake-presets.7.gz
    /usr/share/man/man7/cmake-properties.7.gz
    /usr/share/man/man7/cmake-qt.7.gz
    /usr/share/man/man7/cmake-server.7.gz
    /usr/share/man/man7/cmake-toolchains.7.gz
    /usr/share/man/man7/cmake-variables.7.gz
    /usr/share/man/man7/cpack-generators.7.gz

# Переменные окружения #
{: id="Переменные_окружения" }

[`CMAKE_GENERATOR`](https://cmake.org/cmake/help/latest/envvar/CMAKE_GENERATOR.html)

: Установить генератор, используемый системой по умолчанию

# Перечень команд CMakeLists.txt#
{: id="Перечень_команд_CMakeLists.txt" }

[`add_executable(main first.cpp second.cpp)`](https://cmake.org/cmake/help/latest/command/add_executable.html)

: Создать исполняемый файл (`main`) из набора указанных исходных файлов (`first.cpp`, `second.cpp`)

[`cmake_minimum_required(VERSION 3.29)`](https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html)

* Установить минимально допустимую версию системы CMake, используемую для
  управления сборкой текущего проекта

* Установить поведение текущей версии CMake в соответствие с поведением
  указанной версии системы

  В случае попытки сборки проекта системой CMake более ранней версии, возникнет
  исключительная ситуация, которая приведет к останову процесса генерирования
  файлов сборки.

  В случае, если текущая используемая версия системы CMake выше указанной,
  функциональность текущей версии будет урезана до той, которая существует в
  указанной.

  Следует выполнять данную команду в самом верху файла `CMakeLists.txt`.

  Устанавливает переменную [`CMAKE_MINIMUM_REQUIRED_VERSION`](https://cmake.org/cmake/help/latest/variable/CMAKE_MINIMUM_REQUIRED_VERSION.html).

[`message("ok!")`](https://cmake.org/cmake/help/latest/command/message.html)

: Вывести указанное сообщение

[`project(sample LANGUAGES CXX)`](https://cmake.org/cmake/help/latest/command/project.html)

* Установить имя проекта (`sample`)

* Установить используемые языки программирования (`CXX` — С++)

  В случае отсутствия компилятора для указанных языков, возникнет исключительная
  ситуация, которая приведет к останову процесса генерирования файлов сборки.

  Следует выполнять данную команду сразу же после команды `cmake_minimum_required`.

  Устанавливает переменную [`PROJECT_NAME`](https://cmake.org/cmake/help/latest/variable/PROJECT_NAME.html).

# Перечень команд командной строки #
{: id="Перечень_команд_командной_строки" }

`cmake -G Ninja ..`

: Сгенерировать файлы сборки системы Ninja (`-G Ninja`) в текущем каталоге

: Файл сборки `CMakeLists.txt` должен находиться в родительском каталоге.

: Сгенерированные файлы будут находиться в текущем каталоге.

`cmake --build .`

: Осуществить сборку проекта

: Сборка будет осуществлена из файлов, сгенерированных командой `cmake` в текущем каталоге.

# Ссылки #
{: id="Ссылки" }

* [FAQ · Wiki · CMake / Community · GitLab](https://gitlab.kitware.com/cmake/community/-/wikis/FAQ)

* [CMake Reference Documentation — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest)

* [CMake Discourse](https://discourse.cmake.org)

* [cmake-commands(7) — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html)

<!-- vim: set textwidth=80 colorcolumn=80: -->
