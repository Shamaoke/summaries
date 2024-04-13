---
title: CMake
---

# Содержание #
{: id="Содержание" }

[Файлы](#Файлы)

[Переменные окружения](#Переменные_окружения)

[Переменные CMake](#Переменные_CMake)

[Свойства CMake](#Свойства_CMake)

[Перечень команд CMakeLists.txt](#Перечень_команд_CMakeLists.txt)

[Перечень команд командной строки](#Перечень_команд_командной_строки)

[Ссылки](#Ссылки)

В процессе разработки программного обеспечения наступает момент, когда
приходиться переводить исходный код во что-то, что может быть использовано
конечным пользователем.

Этот процесс называется _сборкой программного обеспечения_.

Сборка программного обеспечения — это комплексный процесс.

Для управления комплексностью при сборки программного обеспечения требуется подходящий инструмент.

Таким иструментом является CMake.

**CMake** — инструмент _управления_ сборкой программного обеспечения.

Цель CMake — обеспечить управляемостью комплексный процесс сборки программного обеспечения.

CMake представляет из себя набор инструментов для решения возложенных на него
задач.

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

# Переменные CMake #
{: id="Переменные_CMake" }

[`BUILD_SHARED_LIBS`](https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html)

: Установить тип библиотек, собираемых по умолчанию

[`CMAKE_COLOR_DIAGNOSTICS`](https://cmake.org/cmake/help/latest/variable/CMAKE_COLOR_DIAGNOSTICS.html)

: Включить цвета в диагностическом выводе

[`CMAKE_LIBRARY_OUTPUT_DIRECTORY`](https://cmake.org/cmake/help/latest/variable/CMAKE_LIBRARY_OUTPUT_DIRECTORY.html)

: Установить каталог для для размещения файлов библиотек

[`CMAKE_RUNTIME_OUTPUT_DIRECTORY`](https://cmake.org/cmake/help/latest/variable/CMAKE_RUNTIME_OUTPUT_DIRECTORY.html)

: Установить каталог для размещения исполняемых файлов

# Свойства CMake #
{: id="Свойства_CMake" }

[`RUNTIME_OUTPUT_NAME`](https://cmake.org/cmake/help/latest/prop_tgt/RUNTIME_OUTPUT_NAME.html#prop_tgt:RUNTIME_OUTPUT_NAME)

: Имя для целей, являющихся исполняемыми файлами

# Перечень команд CMakeLists.txt#
{: id="Перечень_команд_CMakeLists.txt" }

[`add_executable`](https://cmake.org/cmake/help/latest/command/add_executable.html)

: Определить исполняемый файл целью сборки

`add_executable(main first.cpp second.cpp)`

: Определить исполняемый файл целью сборки и установить исходники для неё

`add_executable(two EXCLUDE_FROM_ALL two.cpp)`

* Определить исполняемый файл целью сборки

* Исключить данную цель из цели, выполняемой по умолчанию (`all`)

  Указанный исполняемый файл будет собран только в том случае, если он будет
  являться зависимостью для другой цели или в случае явного указания цели в
  командной строке (`cmake --build build --target two`).

[`add_library(targetName [STATIC | SHARED | MODULE] [EXCLUDE_FROM_ALL] source1 [source2 ...])`](https://cmake.org/cmake/help/latest/command/add_library.html)

: Определить библиотеку целью сборки

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

[`include(<file|module> [OPTIONAL] [RESULT_VARIABLE <var>] [NO_POLICY_SCOPE])`](https://cmake.org/cmake/help/latest/command/include.html#command:include)

: Загрузить и выполнить код CMake из указанного файла

[`message("ok!")`](https://cmake.org/cmake/help/latest/command/message.html)

: Вывести указанное сообщение

[`project(sample LANGUAGES CXX)`](https://cmake.org/cmake/help/latest/command/project.html)

* Установить имя проекта (`sample`)

* Установить используемые языки программирования (`CXX` — С++)

  В случае отсутствия компилятора для указанных языков, возникнет исключительная
  ситуация, которая приведет к останову процесса генерирования файлов сборки.

  Следует выполнять данную команду сразу же после команды `cmake_minimum_required`.

  Устанавливает переменную [`PROJECT_NAME`](https://cmake.org/cmake/help/latest/variable/PROJECT_NAME.html).

[`set(<variable> [<value>...] [PARENT_SCOPE])`](https://cmake.org/cmake/help/latest/command/set.html)

* Присвоить значение переменной, переменной кэша или переменной окружения в
  случае, если параметр `<value>` передан

* Очистить значение переменной, переменной кэша или переменной окружения в
  случае, если параметр `<value>` не передан

* Присвоить список значений переменной, переменной кэша или переменной окружения
  в случае, если передано несколько параметров `<value>`

[`set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)`](https://cmake.org/cmake/help/latest/command/set.html)

: Установить значение указанной переменной CMake

[`set_property`](https://cmake.org/cmake/help/latest/command/set_property.html)

: Установить указанное свойство в заданных областях

`set_property(TARGET one two PROPERTY EXCLUDE_FROM_ALL true)`

: Установить значение (`true`) для указанного свойства (`EXCLUDE_FROM_ALL`) для
  заданных целей (`one`, `two`)

[`target_link_libraries(targetName <PRIVATE | PUBLIC | INTERFACE> item1 [item2 ...] [<PRIVATE | PUBLIC | INTERFACE> item1 [item2 ...]])`](https://cmake.org/cmake/help/latest/command/target_link_libraries.html)

: Установить библиотеки, используемые в качестве зависимостей для указанной цели

[`unset(<variable> [CACHE | PARENT_SCOPE])`](https://cmake.org/cmake/help/latest/command/unset.html)

: Очистить значение переменной, переменной кэша или переменной окружения

# Перечень команд командной строки #
{: id="Перечень_команд_командной_строки" }

`cmake -G Ninja ..`

: Сгенерировать файлы сборки системы Ninja (`-G Ninja`) в текущем каталоге

: Файл сборки `CMakeLists.txt` должен находиться в родительском каталоге.

: Сгенерированные файлы будут находиться в текущем каталоге.

`cmake --build .`

: Осуществить сборку проекта

: Сборка будет осуществлена из файлов, сгенерированных командой `cmake` в текущем каталоге.

`cmake --build build --target one two`

: Осуществить сборку указанных целей

`cmake -DBUILD_SHARED_LIBS=YES source`

: Установить значение указанной переменной CMake

`cmake -D myVar:type=someValue ...`

: Установить значение указанной переменной кэша

# Ссылки #
{: id="Ссылки" }

* [FAQ · Wiki · CMake / Community · GitLab](https://gitlab.kitware.com/cmake/community/-/wikis/FAQ)

* [CMake Reference Documentation — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest)

* [Using Dependencies Guide — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest/guide/using-dependencies/index.html)

* [CMake Discourse](https://discourse.cmake.org)

* [cmake-commands(7) — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html)

* [cmake-env-variables(7) — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest/manual/cmake-env-variables.7.html#manual:cmake-env-variables(7))

* [cmake-variables(7) — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest/manual/cmake-variables.7.html)

* [cmake-properties(7) — CMake 3.29.0 Documentation](https://cmake.org/cmake/help/latest/manual/cmake-properties.7.html)

<!-- vim: set textwidth=80 colorcolumn=80: -->
