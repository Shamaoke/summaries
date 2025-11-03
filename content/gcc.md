---
title: GCC | The GNU Compiler Collection
---

# Содержание #
{: id="Содержание" }

* [Опции командной строки](#Опции командной строки)

* [Ссылки](#Ссылки)

# Опции командной строки #
{: id="Опции командной строки" }

[`-O`](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-O) `-O1`

: Осуществить оптимизацию скомпилированного кода и времени его исполнения первого уровня

[`-Wpedantic`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-W)

: Выводить предупреждения в случае, если компилируемый код не соотвествует заданному стандарту языка

  Стандарт языка задается опцией `-std`.

`-Werror=pedantic`

: Выводить ошибки в случае, если компилируемый код не соотвествует заданному стандарту языка

  Стандарт языка задается опцией `-std`.

[`-pedantic-errors`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-pedantic-errors-1)

: Выводить ошибки в случае, если компилируемый код не соотвествует заданному стандарту языка и _в некоторых других случаях_

  Стандарт языка задается опцией `-std`.

[`-Wall`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wall)

: Включить флаги предупреждений из группы `all`

[`-Wextra`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-W)

: Включить флаги предупреждений из группы `extra`

[`-Wconversion`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wconversion)

: Выводить предупреждения о некоторых видах неявных преобразований типов

[`-Wsign-conversion`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wsign-conversion)

: Выводить предупреждения о неявных преобразованиях типов, изменяющих знак
  целочисленного значения

[`-Weffc++`](https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Dialect-Options.html#index-Weffc_002b_002b)

: Выводить предупреждения в случае, если исходный код не соотвествует некоторым
  известным рекомендациям по стилю программирования

[`-Werror`](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Werror_003d)

: Считать предупреждения ошибками

[`-std=STANDARD`](https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html#index-std-1)

: Определить стандарт языка

# Ссылки #
{: id="Ссылки" }

* [GCC, the GNU Compiler Collection — GNU Project](https://gcc.gnu.org/)

* [Using the GNU Compiler Collection](https://gcc.gnu.org/onlinedocs/gcc/)

  + [Options to Request or Suppress Warnings](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html)

  + [Options That Control Optimization](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)

