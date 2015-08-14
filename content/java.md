---
layout: summary
title: Java
disqus_identifier: java
---

#Содержание
{: id="Содержание"}

[Глоссарий](#Глоссарий)

[Стандартные инструменты](#Стандартные_инструменты)

[Перечень команд](#Перечень_команд)

[Типы требований](#Типы_требований)

[Многопоточность](#Многопоточность)

[Ввод и вывод](#Ввод_и_вывод)

[Параметризуемые классы](#Параметризуемые_классы)

[Анонимные функции](#Анонимные_функции)

[Примеры](#Примеры)

[Ссылки](#Ссылки)

[Комментарии](#Комментарии)

#Глоссарий
{: id="Глоссарий"}

**access modifier**

модификатор доступа

**autoboxing**

автоупаковка

**compilation unit**

единица компиляции

**generic**

параметризуемый класс/тип; полиморфный класс/тип

**enumeration**

перечисление; перечень; перечислимый тип

**enumerator**

перечислитель

**persistent object**

перманентный (постоянно хранимый) объект

**retention**

удерживание

**runtime**

время исполнения

**wrapper**

упаковщик

#Стандартные инструменты
{: id="Стандартные_инструменты"}

**javac**

Компилятор программы, написанной на языке Java, в байт-код виртуальной машины Java (JVM)

**java**

Программа запуска java-приложения (Java application launcher)

**jdb**

Отладчик програм на Java'е

**javap**

Декомпилятор программы, представленной в виде байт-кода виртуальной машины Java, в текстовый вид, удобный для анализа

#Перечень команд
{: id="Перечень_команд"}

`javac -X`

вывести перечень дополнительных опций

`javac -Xdiags:verbose <file>`

вывести более подробное диагностическое сообщение при наличии ошибок компиляции

#Типы требований
{: id="Типы_требований"}

**требование выразительности**

**соглашение**

**техническое требование**

**требование производительности**

#Многопоточность
{: id="Многопоточность"}

##Глоссарий
{: id="Многопоточность_Глоссарий"}

**context switch**

переключение контекста

**deadlock**

взаимная блокировка

**monitor**

диспетчер, контролёр

**to enter a monitor on an object**

зарегистрировать диспетчера/контролера для объекта;

назначить диспетчера/контролера на объект;

установить диспетчера/контролера на объект

**preemption**

вытеснение

**race**

конкуренция

**race condition**

состояние гонки

**scheduler**

планировщик

**spawn**

порождать

##Перечень состояний треда
{: id="Перечень состояний треда"}

**blocked** (*заблокирован*)

**interrupted** (*прерван*)

**ready to run** (*готов к запуску*)

**resumed** (*возобновлен*)

**running** (*запущен*)

**suspended** (*приостановлен*)

**terminated** (*завершен*)

##Перечень методов
{: id="Перечень методов"}

**`currentThread`** [`java.lang.Thread`](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html#currentThread--)

**`getPriority`** [`java.lang.Thread`](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html#getPriority--)

**`isAlive`** [`java.lang.Thread`](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html#isAlive--)

**`join`** [`java.lang.Thread`](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html#join--)

**`notify`** [`java.lang.Object`](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#notify--)

**`setPriority`** [`java.lang.Thread`](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html#setPriority-int-)

**`wait`** [`java.lang.Object`](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html#wait--)

#Ввод и вывод
{: id="Ввод_и_вывод"}

##Перечень объектов
{: id="Перечень_объектов"}

**`InputStream`** [`java.io.InputStream`](https://docs.oracle.com/javase/8/docs/api/java/io/InputStream.html)

Объект-обёртка для различных источников данных.

**`InputStreamReader`** [`java.io.InputStreamReader`](https://docs.oracle.com/javase/8/docs/api/java/io/InputStreamReader.html)

Объект, предоставляющий возможность извлекать данные из источника.

**`BufferedReader`** [`java.io.BufferedReader`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedReader.html)

Объект, предоставляющий возможность помещать извлекаемые из источника данные во временное хранилище (буфер).

**`OutputStream`** [`java.io.OutputStream`](https://docs.oracle.com/javase/8/docs/api/java/io/OutputStream.html)

Объект-обёртка для различны приёмников данных.

**`PrintStream`** [`java.io.PrintStream`](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html)

Объект, предоставляющий возможность передавать бинарные данные различным приёмникам.

**`PrintWriter`** [`java.io.PrintWriter`](https://docs.oracle.com/javase/8/docs/api/java/io/PrintWriter.html)

Объект, предоставляющий возможность передавать _текстовые_ данные различным преёмникам.

**`FileInputStream`** [`java.io.FileInputStream`](https://docs.oracle.com/javase/8/docs/api/java/io/FileInputStream.html)

Объект-обёртка для файлового источника данных.

**`FilOutputStream`** [`java.io.FileOutputStream`](https://docs.oracle.com/javase/8/docs/api/java/io/FileOutputStream.html)

Объект-обёртка для файлового приёмника данных.

##Перечень методов
{: id="Перечень_методов"}

**`read`** [`java.io.BufferedReader#read`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedReader.html#read--)

Возвратить байт из буфера и конвертировать его в символ на основе текущей/заданной кодировки.

**`read`** [`java.io.FileInputStream#read`](https://docs.oracle.com/javase/8/docs/api/java/io/FileInputStream.html#read--)

Возвратить байт из файла-источника, представив его как целое число. Возвратить -1, при достижении конца файла.

**`readLine`** [`java.io.BufferedReader#readLine`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedReader.html#readLine--)

Возвратить последовательность байтов из буфера и конвертировать каждый байт в строчный символ на основе текущей/заданной кодировки. (Символы завершения строки возвращены не будут.)

**`write(int)`** [`java.io.PrintStream#write`](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#write-int-)

Передать приёмнику один байт данных не очищая буфер.

**`write(int)`** [`java.io.FileOutputStream#write`](https://docs.oracle.com/javase/8/docs/api/java/io/FileOutputStream.html#write-int-)

Передать файлу-приёмнику один байт данных.

**`write(byte[], int, int)`** [`java.io.PrintStream#write`](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#write-byte:A-int-int-)

Передать приёмнику диапазон байтов из заданного массива и автоматически очистить буфер по окончанию передачи.

**`flush`** [`java.io.PrintStream#flush`](https://docs.oracle.com/javase/8/docs/api/java/io/PrintStream.html#flush--)

Очистить буфер от данных.

**`close`** [`java.io.FileInputStream#close`](https://docs.oracle.com/javase/8/docs/api/java/io/FileInputStream.html#read--)

Освободить системный ресурс, связанный с данным файлом-источником. Данный метод должен быть вызван по завершению работы с файлом в соответствии с теребованием производительности. При попытке чтения из закрытого файла-источника будет вызвано исключение `java.io.IOException: Stream Closed`.

**`close`** [`java.io.FileOutputStream#close`](https://docs.oracle.com/javase/8/docs/api/java/io/FileOutputStream.html#close--)

Освободить системный ресурс, связанный с данным файлом-приёмником. Данный метод должен быть вызван по завершению работы с файлом в соответствии с теребованием производительности. При попытке записи в закрытый файл-приёмник будет вызвано исключение `java.io.IOException: Stream Closed`.

#Параметризуемые классы
{: id="Параметризуемые_классы"}

##Способы определения
{: id="Способы_определения"}

`class Sample<T>`

определить параметризуемый класс

`class Sample<T1, T2>`

определить параметризуемый класс с двумя параметрами

`class Sample<T extends SomeClass>`

определить параметризуемый класс с параметром, тип которого ограничен множеством подклассов указанного класса

`class Sample<T extends SomeClass & FirstInterface & SecondInterface>`

определить параметризуемый класс с параметром, тип которого расширяет указанный класс и реализует оба указанных интерфейса

##Указание типа для переменной, содержащей значение параметризуемого класса
{: id="Указание_типа_для_переменной_содержащей_значение_параметризуемого_класса"}

`GenericClass<ConcreteClass> variable`

`GenericClass<?> variable`

`GenericClass<? extends UpperBound> variable // One → (UpperBound → Two → Three)`

`GenericClass<? super LowerBound> variable // (One → Two → LowerBound) → Three`

##Указание переменного типа в декларации метода
{: id="Указание_переменного_типа_в_декларации_метода"}

`<T> T doSomething(T arg);`

определить параметризуемый метод с одним агрументом

`<T1, T2> T1 doSomething(T1 arg1, T2 arg2);`

определить параметризуемый метод с двумя аргументами

`<T extends SomeClass> T doSomething();`

определить параметризуемый метод, тип которого расширяет указанный класс

`<T extends SomeInterface> T doSomething();`

определить параметризуемый метод, тип которого реализует указанный интерфейс

`someObject.<First>doSomething(first);`

вызвать параметризуемый метод (объявление типа не обязательно, но может быть включено для улучшения выразительности)

#Анонимные функции
{: id="Анонимные_функции"}

##Перечень элементов
{: id="Анонимные_функции_Перечень_элементов"}

**functional interface**

**lambda expression**

**method reference**

#Примеры
{: id="Примеры"}

[Adding two integers by the means of a method reference](https://gist.github.com/Shamaoke/c1c2a23c1e5063263420)

[An Elementary Console Text Editor](https://gist.github.com/Shamaoke/5b033bf0833842dc0886)

[Annotations](https://gist.github.com/Shamaoke/3d10682691ddaafb4b88)

[Cooperative Multithreading](https://gist.github.com/Shamaoke/a8d3458b7e74d55df2a8)

[Deadlock](https://gist.github.com/Shamaoke/5528f81e496cf98eb832)

[Declaring a parameterized constructor](https://gist.github.com/Shamaoke/b86896092572e0ac858b)

[Declaring a parameterized interface](https://gist.github.com/Shamaoke/f7fed27a6ce0414c4ca0)

[Declaring a parameterized method inside a non-generic class](https://gist.github.com/Shamaoke/ab5969837b667a948e61)

[Eliminating the need to cast types by using generics](https://gist.github.com/Shamaoke/176a741d29a8834d79eb)

[Exception Handling](https://gist.github.com/Shamaoke/ca96f0ca3965e9c8622c)

[Extracting a string from a container object by the means of an instance method reference](https://gist.github.com/Shamaoke/9899d906ab94cba7a1e7)

[Finding matches in a collection of values by the means of a static and an instance method reference](https://gist.github.com/Shamaoke/f9f0ae116290daaa3ad2)

[Method#invoke](https://gist.github.com/Shamaoke/912f2b48cff7370653ad)

[Setting type bounds for a generic type parameter](https://gist.github.com/Shamaoke/5ab44f22692a5b3e17fc)

[Setting type bounds for a generic type parameter as a set of interfaces](https://gist.github.com/Shamaoke/120f70677ca45d6813c7)

[Specifying a type for a variable, which contains a value of a parameterized type](https://gist.github.com/Shamaoke/b9e90fe6f862651517ee)

[Using a wildcard to specify any allowed type for an argument](https://gist.github.com/Shamaoke/dcc671dbd8ef5ba8d339)

#Ссылки
{: id="Ссылки"}

[Race condition](http://rosettacode.org/wiki/Race_condition)

[Взаимная блокировка](https://ru.wikipedia.org/wiki/%D0%92%D0%B7%D0%B0%D0%B8%D0%BC%D0%BD%D0%B0%D1%8F_%D0%B1%D0%BB%D0%BE%D0%BA%D0%B8%D1%80%D0%BE%D0%B2%D0%BA%D0%B0)

[Состояние гонки](https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5_%D0%B3%D0%BE%D0%BD%D0%BA%D0%B8)

#Комментарии
{: id="Комментарии"}
