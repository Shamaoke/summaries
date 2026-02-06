---
title: GDB
---

# Содержание #
{: id="Содержания" }

* [Командная строка](#Командная_строка)

* [Настройка](#Настройка)

* [Ссылки](#Ссылки)

# Командная строка #
{: id="Командная_строка" }

`gdb --args PROGRAM ARG1 ARG2 ARG3`

: Запустить отладочную сессию, передав отлаживаемой программе `PROGRAM` указанные аргументы `ARG1`, `ARG2` и `ARG3`

`gdb {-p|--pid} $(pidof NAME)`

: • Найти идентификатор процесса по имени (`pidof NAME`);

  • Запустить отладчик и подключиться к процессу с найденным идентификаторм

  Для отладки путем подключения к запущенному процессу от обычного пользователя
  создать файл `/etc/sysctl.d/10-ptrace.conf` со следующим содержимым: `kernel.yama.ptrace_scope = 0`.

# Настройка #
{: id="Настройка" }

`set print elements 0`

: Выводить всё содержимое массива. Не обрезать массив.

`set print repeats 0`

: Не опускать повторяющиеся элементы массива

`set print array on`

: Выводить массив в наглядной форме

`set print array-indexes on`

: Выводить индекс для каждого элемента в массиве

`set print pretty on`

: Выводить структуры в наглядной форме

`set listsize N`

: Выводить N-е количество строк командой `list`

`set confirm off`

: Отключить запрос на подтверждение выполнения команды для команд с
  подтверждением выполнения

`set debuginfod enabled off`

: Отключить запросы на загрузку ресурсов для отладки с серверов `debuginfod`

  * [Print Settings (Debugging with GDB)](https://sourceware.org/gdb/current/onlinedocs/gdb.html/Print-Settings.html)

  * [List (Debugging with GDB)](https://sourceware.org/gdb/current/onlinedocs/gdb.html/List.html)

  * [Messages/Warnings (Debugging with GDB)](https://www.sourceware.org/gdb/current/onlinedocs/gdb.html/Messages_002fWarnings.html)

# Сылки #
{: id="Ссылки" }

[How do I run a program with commandline arguments using GDB within a Bash script? - Stack Overflow][0]

[0]: https://stackoverflow.com/questions/6121094/how-do-i-run-a-program-with-commandline-arguments-using-gdb-within-a-bash-script

