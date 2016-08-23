---
title: MongoDB
---

#Содержание
{: id="Содержание"}

[Глоссарий](#Глоссарий)

[Перечень элементов](#Перечень_элементов)

[Типы данных](#Типы_данных)

[Перечень методов драйвера JavaScript'а](#Перечень_методов_драйвера_JavaScript_а)

[Агрегирование](#Агрегирование)

[Перечень операторов](#Перечень_операторов)

[Проекция](#Проекция)

[Перечень административных команд](#Перечень_административных_команд)

[Перечень внутренних команд командной оболочки](#Перечень_внутренних_команд_командной_оболочки)

[Функции драйверов](#Функции_драйверов)

[Статистика базы данных](#Статистика_базы_данных)

[Статистика коллекции](#Статистика_коллекции)

[Статистика запроса](#Статистика_запроса)

[Системные коллекции](#Системные_коллекции)

[Гайды](#Гайды)

[Инструменты](#Инструменты)

[Файлы](#Файлы)

[Ссылки](#Ссылки)

[Комментарии](#Комментарии)

#Глоссарий
{: id="Глоссарий"}

**age out**

удаление на основе «возраста»

**ad hoc query**

динамический запрос

**domain**

предметная область

**durability**

надежность

**capped collection**

фиксированная коллекция

**eventual consistency**

вероятностная конзистентность; вероятностная связность; вероятностная согласованность

**extent**

экстент (непрерывная область памяти)

**failover**

обход отказа

**implementation specific directive**

указание, специфичное для конкретной реализации протокола (HTTP)

**journaling**

отслеживание; регистрация; протоколирование (изменений)

**logging**

регистрация

**lookup**

выборка

**map-reduce**

связать-преобразовать; связать-свернуть

**master-slave**

ведущий-ведомый

**non-terminal**

непростой объект (составной, делимый, изменяемый, состоящий из нескольких простых объектов; молекула)

**production rule**

порождающее правило

**reduce**

свёртка

**redundancy**

резервирование

**slug**

именованный идентификатор ресурса

**sniffer**

анализатор трафика

**strong consistency**

устойчивая конзистентность

**terminal**

простой объект (неделимый, неизменяемый; атом)

**throughput**

пропускная способность

#Перечень элементов
{: id="Перечень_элементов"}

**атрибут**

Элемент предметной области, отраженный в поле документа. Бывает статическим и динамическим.

**база данных**

Логическая и физическая группа коллекций.

**встроенный документ**

Документ, являющийся значением поля документа коллекции.

**денормализация**

Дублирование одного и того же поля объекта предметной области в нескольких объектах базы данных.

**динамический атрибут**

Атрибут, изменяющийся от документа к документу в отдельно взятой коллекции.

**динамический запрос**

**добавочный коэффициент**

Число, определяющее количество места, которое будет выделено для хранения некоторого документа. В момент сохранения документа, при добавочном коэффициенте равном единице, будет выделено ровно столько места, сколько необходимо для хранения данного документа.

**документ**

**драйвер**

**индекс**

Объект базы данных, создаваемый с целью повышения производительности поиска данных.

**коллекция**

Контейнер для структурно, либо концептуально схожих документов. Бывают пользовательскими и системными, а так же нормальными и фиксированными.

**командная оболочка**

**комплект реплик**

**контейнер**

Поле документа, содержащее документ, предназначенный для хранения динамических атрибутов.

**критерий селектора запроса**

Поле документа, являющегося селектором запроса.

**модель базы данных**

Способ организации любых данных в рамках отдельно взятой СУБД.

**модель данных**

Способ организации данных некоторой предметной области вне каких-либо рамок.

**нормализация**

Представление объекта предметной области с помощью нескольких объектов базы данных.

**обновление**

Документ, используемый при обновлении документов.

**общий селектор запроса**

Документ, содержащий имя поля искомого документа и либо значение, либо специальный селектор.

**объект базы данных**

**объект предметной области**

**оператор запроса**

Ключевое слово, используемое в специальном селекторе запроса.

**проектирование схемы базы данных**

Процесс выбора наилучшей репрезентации данных, учитывая функционал используемой системы (модель БД), природу данных (модель данных) и требования программируемого приложения.

**проекция**

Операция нахождения подмножества из множества, на основе заданного набора атрибутов.

**репликация**

**реплика**

**селектор запроса**

Документ, используемый при поиске документов. Бывает общим и специальным.

**специальный селектор запроса**

Документ, содержащий операторы запроса.

**статический атрибут**

Атрибут, присутствующий во всех документах коллекции.

**схема базы данных**

- Формальное описание того, как будут организованы данные конкретной предметной области в рамках отдельно взятой СУБД.

- Способ организации данных конкретной предметной области в рамках отдельно взятой системы.

**тип данных**

Форма, в которой представлены данные в хранилище, либо в драйвере.

**указатель**

**шардирование**

Разделение хранимых объектов на части (на основе некоторого единого критерия) и разнесение этих частей по разным физическим хранилищам.

#Типы данных
{: id="Типы_данных"}

**число с плавающей запятой** (floating point number) "\x01"

**cтрока** (string) "\x02"

**документ** (document) "\x03"

**массив** (array) "\x04"

**двоичный тип** (binary) "\x05"

**объектный идентификатор** (object id) "\x07"

**логический тип** (boolean) "\x08"

**дата-время** (datetime) "\x09"

**пустой тип** (null) "\x0A"

**регулярное выражение** (reqular expression) "\x0B"

**код JavaScript'а** (JavaScript code) "\x0D"

**код JavaScripta'a с контекстом** (JavaScript code with context) "\x0F"

**32-х битное целое число** (32-bit integer) "\x10"

**временна́я отметка** (timestamp) "\x11"

**64-х битное целое число** (64-bit integer) "\x12"

**минимальное значение** (Minimum value) "\xFF"

**максимальное значение** (Maximum value) "\x7F"

#Перечень методов драйвера JavaScript'а
{: id="Перечень_методов_драйвера_JavaScript_а"}

**count** \[collection\] \[cursor\]

**createCollection** \[db\]

**drop** \[collection\]

**dropDatabase** \[db\]

**dropIndex** \[collection\]

**ensureIndex** \[collection\]

**explain** \[cursor\]

**find** \[collection\]

**findOne** \[collection\]

**getCollection** \[db\]

**getCollectionNames** \[db\]

**getIndexes** \[collection\]

**getName** \[db\]

**getSiblingDB** \[db\]

**help** \[db\] \[collection\]

**insert** \[collection\]

**limit** \[cursor\]

**printjson** \[global\]

**remove** \[collection\]

**renameCollection** \[collection\]

**runCommand** \[db\]

**runCommand** \[collection\]

**save** \[collection\]

**size** \[cursor\]

**skip** \[cursor\]

**sort** \[cursor\]

**stats** \[db\] \[collection\]

**toArray** \[cursor\]

**update** \[collection\]

#Агрегирование
{: id="Агрегирование"}

**минимум**

~~~
sort(-1).limit(1)
~~~

**максимум**

~~~
sort(1).limit(1)
~~~

**список уникальных значений**

~~~
distinct(поле, селектор)
~~~

**группировка**

~~~
group(ключ, изначальный документ, функция преобразования)
~~~

~~~
mapReduce(map, reduce)
~~~

*map* := функция связования ключа с коллекцией значений

~~~
[{key1: [1, 1, 1]}, {key2: [1]}, {key3: [1, 1]}]
~~~

*reduce* := функция преобразования коллекции значений для ключа

~~~
[{_id: 'key1', value: 3}, {_id: 'key2', value: 1}, {_id: 'key3', value: 2}]
~~~

#Перечень операторов
{: id="Перечень_операторов"}

##Тэги
{: id="Тэги"}

\[query\]

Запрос. Операторы помеченные данным тэгом используются только при выборки документов.

\[update\]

Обновление. Операторы помеченные данным тэгом используются только при обновлении документов.

**$** \[update\]

- Заменить элемент массива.

- Заменить поле документа, являющегося элементом массива.

~~~
{'array.$': value}
~~~

~~~
{'array.$.field': value}
~~~

~~~
db.example.update({'data': 'Jack'}, {'$set': {'data.$': 'Jack The Ripper'}})
~~~

*Find the first document with the given data, replace the given data with the provided value.*

*Найти первый документ с заданными данными, заменить заданные данные предоставленным значением.*

~~~
db.categories.update({'ancestors.name': 'two'},
                     {'$set': {'ancestors.$.name': 'the great two'}},
                     false, true)
~~~

*Find documents with an ancestor with the given name, replace the given ancestor name with the provided value.*

*Найти документы, содержащие предка с заданным именем, заменить заданное имя предка предоставленным значением.*

**$all** \[query\] \[comparison\]

Документ, содержащий поле с составным значением, в котором содержаться все указанные значения.

~~~
{ field: { $all: [value1, value2, ..., valueN] } }
~~~

**$and** \[query\] \[logical\]

Документ, содержащий все поля с указанными значениями.

~~~
{ $and: [{ field1: value1 }, { field2: value2 }, ..., { fieldN: valueN }] }
~~~

Пример:

~~~
db.products.find({ $and: [{ tags: { $in: ['gift', 'holiday'] } }, { tags: { $in: ['gardening', 'landscaping'] } }] })
~~~

*Find all documents where the “tags” field is “gift” or “holiday” and “gardening” or “landscaping”.*

*Найти все документы, где поле „tags“ содержит значения „gift“ или „holiday“ и „gardening“ или „landscaping“.*

**$elemMatch** \[array\]

Выбрать все документы, содержащие массив документов в качестве значения одного из полей, где искомый документ содержит все поля указанного.

~~~
{ field: { $elemMatch: { field1: value1, field2: value2, ..., fieldN: valueN } } }
~~~

Пример:

~~~
db.users.find({ addresses: { $elemMatch: { name: 'home', state: 'NY' } } })
~~~

*Find all documents of the users collection in the current database with the “addresses” array containing a document having both the “name” and the “state” fields where “name” equals “home” and “state” equals “NY”.*

*Найти все документы в коллекции „users“ текущей базы данных, с массивом „addresses“, содержащим документ, имеющий и поле „name“, и поле „state“ со значениями „home“ и „NY“ соответственно.*

**$exists** \[query\] \[field\]

Документ, содержащий указанное поле.

~~~
{ field: { $exists: logical_value } }
~~~

Пример:

~~~
db.inventory.find({ qty: { $exists: true } })
~~~

*Find all documents in the “inventory” collection where the field “qty” exists.*

*Найти все документы в коллекции „inventory“, в которых есть поле „qty“.*

**$gt** \[query\] \[comparison\]

Документ, содержащий поле со значением, большим указанного.

~~~
{ field: { $gt: value } }
~~~

**$gte** \[query\] \[comparison\]

Документ, содержащий поле со значением, большим либо равным указанному.

~~~
{ field: { $gte: value } }
~~~

**$in** \[query\] \[comparison\]

Документ, содержащий поле со значением, равным одному из указанных.

~~~
{ field: { $in: [value1, value2, ..., valueN] } }
~~~

Пример:

~~~
db.inventory.find({qty: {$in: [5, 15]}})
~~~

Find all inventories with a quantity of 5 or 15.

Find all documents in the “inventory” collection of the current database where the “qty” field has a value of 5 or 15.

Найти все товары количеством равным 5 или 15.

Найти все документы в коллекции „inventory“ текущей базы данных, в которых поле „qty“ содержит значение равное 5 или 15.

**$inc** \[update\]

Повысить числовое значение поля на указанную величину (включая отрицательную).

~~~
{ $inc: { field: <value>, field2: <value>, ... } }
~~~

~~~
db.products.update({'name': 'name'}, {'$inc': {'reviews': 1}})
~~~

Find the first document in the products collection of the current database with the given name, increment by 1 the “reviews” field.

Найти первый документ в коллекции продуктов текущей базы данных с заданным именем, повысить на единицу значение поля „reviews“.

**$lt** \[query\] \[comparison\]

Документ, содержащий поле со значением, меньшим указанного.

~~~
{ field: { $lt: value } }
~~~

**$lte** \[query\] \[comparison\]

Документ, содержащий поле со значением, меньшим либо равным указанному.

~~~
{ field: { $lte: value } }
~~~

**$mod** \[element\]

Возвратить все документы, содержащие целое число в указанном поле, которое при делении на первый элемент массива, переданного данному оператору, даст остаток равный второму элементу данного массива.

~~~
{ field: { $mod: [divisor, remainder] } }
~~~

Пример:

~~~
db.numbers.find({ value: { $mod: [3, 0] } })
~~~

*Find all documents in the “numbers” collection of the current database where the “value” field contains an integer which when divided by 3 leaves a remainder of 0.*

*Найти все документы в коллекции „numbers“ текущей базы данных, где поле „value“ содержит целое число, которое при делении на 3 дает остаток 0.*

**$natural** \[sort\]

Возвратить документы в восходящем или нисходящем порядке их занесения в коллекцию.

~~~
{ $natural: 1 }
~~~

~~~
{ $natural: -1 }
~~~

**$ne** \[query\] \[comparison\]

Документ, содержащий поле со значением не равным указанному.

~~~
{ field: { $ne: value } }
~~~

**$nin** \[query\] \[comparison\]

Документ, в котором указанное поле либо отсутствует, либо его значение не равно одному из указанных.

~~~
{ field: { $nin: [value1, value2, ..., valueN] }
~~~

**$nor** \[query\] \[logical\]

Документ, который не содержит ни одного из указанных полей, либо ни одно из указанных полей не имеет переданный значений.

~~~
{ $nor: [{ field1: value1 }, { field2: value2 }, ..., { fieldN: valueN }] }
~~~

Пример:

~~~
db.docs.find({'$nor': [{a: 'one'}, {b: 'two'}]})  // a != 'one' and b != 'two'
~~~

*Find all documents wich doesn't contain the field “a” with the value “one” and the field “b” with the value “two” or any of the specified fields don't exist.*

*Найти все документы, которые не содержат поля „a“ со значением „one“ и поля „b“ со значением „two“ либо, не содержат одного или всех указанных полей.*

**$not** \[query\] \[logical\]

Документ, в которых указанное поле либо отсутствует, либо его значение противоположно определяемому отрицаемым селектором запроса.

~~~
{ field: { $not: { $operator: value } }
~~~

Пример:

~~~
db.inventory.find({ price: { $not: { $gt: 1.99 } } })
~~~

*Find all documents where the “price” field is not set or for which it is not true that the value of the field is greater than 1.99.*

*Найти все документы, где поле „price“ отсутствует, или для которых неверно, что значение данного поля больше чем 1.99.*

**$or** \[query\] \[logical\]

Документ, содержащий хотя бы одно из полей с указанным значением.

~~~
{ $or: [{ field1: value1 }, { field2: value2 }, ..., { fieldN: valueN }] }
~~~

Пример:

~~~
db.inventory.find({ $or: [{ qty: 20 }, { sale: true }] })
~~~

*Select all documents where the quantity field equals 20 or the sale field equals true.*

*Выбрать все документы, где поле „количество“ равно 20 или поле „продано“ равно true.*

**$push** \[update\]

**действие**: найти и добавить

**данные**: запрос, замена

Добавить элемент в массив.

~~~
{ $push: { field: value } }
~~~

Пример:

~~~
db.users.update({name: 'name'}, {$push: {addresses: {city: 'city'}}})
~~~

*опциональные данные*{:opt}

*заменители*{:rep}

- неименованные (*current db, given data, provided document*)

- именованные (*addresses list, given name*)

_Find the first document in the **“users” collection** of the **current database**{:rep} with the **given name**, add the **provided document** to the **addresses list**._

*Найти первый документ в **коллекции „users“** **текущей бызы данных** с **заданным именем**, добавить **предоставленный документ** в **перечень адресов**.*

{:opt: style="text-decoration: underline; font-style: normal"}

{:rep: style="color: blue; font-style: normal"}

**$regex** \[javascript\]

Выбрать все документы, содержащие текстовое поле, значение которого соответствует переданному регулярному выражению.

~~~
{ field: { $regex: 'regular expression', $options: 'options for the regular expression' } }
~~~

Пример:

~~~
db.products.find({ producer: { $regex: 'acme.*corp', $options: 'i' } })
~~~

*Find all documents in the “products” collection of the current database where the “producer” field contains the string which matches the regular expression “acme.\*corp” regardless of the case.*

*Найти все документы в коллекции „products“ текущей базы данных, в которых поле „producer“ содержит строку, соответствующую регулярному выражению „acme.\*corp“, независимо от регистра.

**$set** \[update\]

Заменить значение поля.

~~~
{ $set: { field: value } }
~~~

Пример:

~~~
db.users.update({name: 'name'}, {$set: {address: 'address'}})
~~~

*Find the first document in the users collection of the current database with the given name, replace the address field with the provided data.*

*Найти первый документ в коллекции пользователей текущей базы данных с заданным именем, заменить значение адресного поля предоставленными данными.*

**$size** \[array\]

Выбрать все документы, содержащие массив в качестве значения одного из полей, где размер данного массива равен указанному.

~~~
{ field: { $size: value } }
~~~

**$slice** \[projection\]

Сократить массив, содержащийся в указанном поле выбранных документов.

~~~
{ name: { $slice: count } }
~~~

~~~
{ name: { $slice: [skip, limit] } }
~~~

~~~
db.posts.find({ }, { comments: { $slice: 5 } })
~~~

*Find all posts, select the first 5 comments.*

*Find all documents in the “posts” collection of the current database, select the first 5 elements from the “comments” array.*

*Найти все статьи, выбрать первые 5 комментариев.*

*Найти все документы в коллекции „posts“ текущей базы данных, выбрать первые пять элементов из массива „comments“.*

~~~
db.posts.find({ }, { comments: { $slice: -5 } })
~~~

*Find all posts, select the last 5 comments.*

*Find all documents in the “posts” collection of the current database, select the last 5 elements from the “comments” array.*

*Найти все статьи, выбрать последние 5 комментариев.*

*Найти все документы в коллекции „posts“ текущей базы данных, выбрать последние пять элементов из массива „comments“.*

~~~
db.posts.find({ }, { comments: { $slice: [2, 5] } })
~~~

*Find all posts, skip 2 and select 5 comments.*

*Find all documents in the “posts” collection of the current database, skip 2 and select 5 elements from the “comments” array.*

*Найти все статьи, пропустить 2 и выбрать 5 комменариев.*

*Найти все документы в коллекции „posts“ текущей базы данных, пропустить 2 и выбрать 5 элементов из массива „comments“.*

~~~
db.posts.find({ }, { comments: { $slice: [-10, 5] } })
~~~

*Find all posts, select 5 comments beginning with the 10th comment from the last one.*

*Find all documents in the “posts” collection of the current database, select 5 elements from the “comments” array beginning with the 10th element from the end.*

*Найти все статьи, выбрать 5 комментариев, начиная с 10-го комментария, считая от последнего.*

*Найти все документы в коллекции „posts“ текущей базы данных, выбрать 5 элементов из массива „comments“, начиная с 10-го элемента, считая с конца данного массива.*

**$type** \[element\]

Выбрать все документы, в которых заданное поле содержит значение указанного типа.

~~~
{ field: { $type: type } }
~~~

Пример:

~~~
db.users.find({ _id: { $type: 2 } })
~~~

*Find all users with an id that has a type of 2.*

*Find all documents in the “users” collection of the current database where the “_id” field has a value of a type 2.*

*Найти все документы в коллекции „users“ текущей базы данных, в которых поле „_id“ имеет тип 2.*

**$unset** \[update\]

Удалить поле.

~~~
{ $unset: { field: '' } }
~~~

Пример:

~~~
db.users.update({ name: 'name' }, { $unset: { address: '' } })
~~~

*Find the first document with the given name, unset the address field.*

*Найти первый документ с заданным именем, снять поле „address“.*

**$where** \[javascript\]

Выбрать все документы для которых справедливо утверждение, переданное данному оператору в качестве аргумента.

~~~
{ $where: 'javascript statement or expression' }
~~~

Пример:

~~~
db.products.find({ $where: 'this.price > 100' })
~~~

*Find all documents of the “products” collection in the current database for which the javascript expression “this.price > 10” is true.*

*Найти все документы в коллекции „products“ текущей базы данных, для которых справедливо выражение javascript'а „this.price > 10“.*


#Проекция
{: id="Проекция"}

~~~
db.users.find({}, {name: 1})
~~~

*Find all users including only their names in the documents of the result set.*

*Найти всех пользователей, включая в документы полученной коллекции только их имена.*

~~~
db.users.find({}, {surname: 0})
~~~

*Find all users excluding their surnames from the documents of the result set.*

*Найти всех пользователей, исключая из документов полученной коллекции их фамилии.*

#Перечень административных команд
{: id="Перечень_административных_команд"}

**listDatabases**

#Перечень внутренних команд командной оболочки
{: id="Перечень_внутренних_команд_командной_оболочки"}

**exit**

Выйти из командной оболочки

**help**

**it**

**show collections**

Отобразить перечень коллекций в текущей базе данных

**show dbs**

Отобразить перечень баз данных на текущем сервере

**use**

#Функции драйверов
{: id="Функции_драйверов"}

**Создавать идентификаторы**

**Осуществлять сериализацию-десереализацию**

**Выступать в роли клиента коммуникации**

#Статистика базы данных
{: id="Статистика_базы_данных"}

**avgObjSize** \[scale\]

средний размер каждого объекта в коллекциях текущей базы данных (dataSize / objects)

**collections**

количество коллекций в текущей базе данных

**dataSize** \[scale\]

общий размер данных, содержащихся в текущей базе данных; изменяется при удалении документов

**db**

имя текущей базы данных

**fileSize** \[scale\]

общий размер файлов, содержащих текущую базу данных

**indexes**

количество индексов в коллекциях текущей базы данных

**indexSize** \[scale\]

общий размер индексов, созданных в текущей базе данных

**nsSizeMB**

общий размер файлов, содержащих сведения о пространстве имен текущей базы данных

**numExtents**

количество экстентов в коллекциях текущей базы данных

**objects**

общее количество объектов (документов) во всех коллекциях текущей базы данных

**storageSize** \[scale\]

общий размер, выделенный коллекциям на хранение документов в текущей базе данных; не изменяется при удалении документов, либо их полей

#Статистика коллекции
{: id="Статистика_коллекции"}

**avgObjSize** \[scale\]

средний размер каждого объекта в текущей коллекции

**count**

количество документов в текущей коллекции

**indexSizes** \[scale\]

имена и размеры всех индексов, содержащихся в текущей коллекции

**lastExtentSize** \[scale\]

размер последнего выделенного экстента

**nindexes**

количество индексов в текущей коллекции

**ns**

имя пространства имен для текущей коллекции

**numExtents**

количество экстентов в текущей коллекции

**paddingFactor**

добавочный коэффициент

**size** \[scale\]

общий размер данных, содержащихся в текущей коллекции

**storageSize** \[scale\]

общий размер, выделенный текущей коллекции на хранение документов; не изменяется при удалении документов, либо их полей

**systemFlags**

системные метки

**totalIndexSize** \[scale\]

общий размер индексов в текущей коллекции

**userFlags**

пользовательские метки

#Статистика запроса
{: id="Статистика_запроса"}

**cursor**

**n**

**nscanned**

#Системные коллекции
{: id="Системные_коллекции"}

**system.namespaces**

**system.indexes**

#Гайды
{: id="Гайды"}

**Д**инамические атрибуты стоит размещать в зависимых документах.

**М**ассив документов, хранящийся в поле некоторого документа, фактически представляет из себя коллекцию документов зависимых от текущего.

**П**ри проектировании схемы базы данных важно учитывать количество запросов, которое потребуется совершить при извлечении тех или иных комплектов данных.

**О**ператоры отрицания (*$nin*, *$ne*) не эффективны при поиске, так как они неиндексируемы. Следует добавлять индексируемый критерий при использовании подобных операторов.

**Д**ля увеличения производительности высоконагруженных систем имеет смысл сокращать имена полей хранимых документов.

**Д**ля повышения эффективности запросов к документам с полями, содержащими массивы в качестве значений, следует кэшировать размеры этих массивов в отдельном атрибуте текущего документа.

Например, запрос

~~~
db.collection.find({ field: { size: { $lt: value } } })
~~~

будет эффективен при следующей структуре документа

~~~
{ field: [value1, value2, ... vlaueN], size: N }
~~~

Запрос

~~~
db.collection.find({ field: { $size: { $lt: value } } })
~~~

при следующей структуре

~~~
{ field: [value1, value2, ... valueN] }
~~~

будет не эффективен.

**Д**ля повышения эффективности запросов, использующих оператор *$where*, следует включать в селектор запроса индексированный критерий.

Т. е. вместо

~~~
db.products.find({ $where: 'this.price > 100' })
~~~

использовать

~~~
db.products.find({ category: 'gardening', $where: 'this.price > 100' })
~~~

где поле *category* является проиндексированным полем.

**Ч**тобы научиться создавать эффективные схемы баз данных, нужно хорошо знать все приемущества и недостатки используемой вами системы.

**С**ледует создавать индексы для всех полей документа, являющихся ссылками на другие документы.

**К**оллекция и индекс — сущности одного порядка. Если для некоторого поля документа коллекции создан индекс, то при обращении к этому полю, запрос перенаправляется от коллекции к созданному индексу.

**И**ндекс — коллекция со структурой, более эффективной для поиска.

#Инструменты
{: id="Инструменты"}

**mongod**

**mongos**

**mongo**

#Файлы
{: id="Файлы"}

*/etc/mongodb.conf*

файл конфигурации

*/var/log/mongodb*

файл журнала

*/var/lib/mongodb/*

директория с файлами баз данных

*prefix/database_name.n*

файл базы данных

*prefix/database_name.ns*

файл пространства имен базы данных

*prefix/mongod.lock*

файл процессного идентификатора

#Ссылки
{: id="Ссылки"}

[MongoDB. Официальный сайт](http://www.mongodb.org/)

[MongoDB. Глоссарий на официальном сайте](http://docs.mongodb.org/manual/reference/glossary)

[MongoDB. Справочник по интерфейсу командной оболочки JavaScript'а](http://docs.mongodb.org/manual/reference/javascript/)

[MongoDB. Справочник по командам, доступным для вызова из метода db.runCommand](http://docs.mongodb.org/manual/reference/commands/)

[MongoDB. Справочник по работе в командной оболочке](http://docs.mongodb.org/manual/reference/mongo-shell/)

[MongoDB. Справочник по операторам](http://docs.mongodb.org/manual/reference/operators)

[MongoDB. Справочник по интерфейсу Ruby](http://rdoc.info/gems/mongo/frames)

[MongoDB. Node.js драйвер. Руководство пользователя](http://mongodb.github.io/node-mongodb-native/)

[MongoDB. Протокол связи](http://www.mongodb.org/display/DOCS/Mongo+Wire+Protocol)

[MongoDB. Объектные идентификаторы](http://www.mongodb.org/display/DOCS/Object+IDs#ObjectIDs-DocumentTimestamps)

[MongoDB. Статистика базы данных](http://docs.mongodb.org/manual/reference/database-statistics/)

[MongoDB. Статистика коллекции](http://docs.mongodb.org/manual/reference/collection-statistics/)

[MongoDB. Статистика запроса](http://www.mongodb.org/display/DOCS/Explain)

[MongoDB. Фиксированные коллекции](http://www.mongodb.org/display/DOCS/Capped+Collections)

---

[MongoDB. Установка в Debian](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-debian/)

[MongoDB. Настройка для использования в Ruby on Rails](http://www.mongodb.org/display/DOCS/Rails+3+-+Getting+Started)

---

[Mongoid. Официальный сайт](http://mongoid.org)

[MongoMapper. Официальный сайт](http://mongomapper.com)

[BSON. Официальный сайт](http://bsonspec.org)

---

[ORM](http://ru.wikipedia.org/wiki/ORM)

<a href="http://ru.wikipedia.org/wiki/Индекс_(базы_данных)">Индекс</a>

[Модель данных](http://ru.wikipedia.org/wiki/Модель_данных)

[Нормальная форма](http://ru.wikipedia.org/wiki/Нормальная_форма)

[Отображение файла в память](http://ru.wikipedia.org/wiki/Отображение_файла_в_память)

[Формальный язык](http://ru.wikipedia.org/wiki/Формальный_язык)

[Формальная грамматика](http://ru.wikipedia.org/wiki/Формальная_грамматика)

[Шардирование](http://ru.wikipedia.org/wiki/Шардирование)

[Экстент](http://ru.wikipedia.org/wiki/Экстент)

#Комментарии
{: id="Комментарии"}
