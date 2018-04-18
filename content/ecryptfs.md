---
title: Ecryptfs
---


#Содержание
{: id="Содержание"}

[Глоссарий](#Глоссарий)

[Инструментарий](#Инструментарий)

Для создания зашифрованного тома Ecryptfs необходимо использовать пользовательские утилиты из пакета [_ecryptfs-utils_](#ecryptfs-utils).

Порядок создания зашифрованного раздела следующий:

**1\.** Загрузить модуль ядра _ecryptfs_

`modprobe ecryptfs` или создать файл _ecryptfs.conf_ в _/etc/modprobe.d/_, добавив в него имя загружаемого модуля (_ecryptfs_). Во втором случае, модуль загрузится автоматически при следующем запуске.

**2\.** Сгенерировать случайный [пароль монтирования](#wrapped_passphrase)

**3\.** Придумать [пароль для контейнера](#wrapping_passphrase)

**4\.** Упаковать пароль монтирования в криптографический контейнер

~~~
ecryptfs-wrap-passphrase $HOME/.ecryptfs/wrapped_passphrase "mount_passphrase\nwrapping_passphrase"
~~~

Контейнер будет содержаться в файле и в дальнейшем будет использован при монтировании зашифрованного тома.

**5\.** Добавить пароль монтирования в ключницу

~~~
ecryptfs-insert-wrapped-passphrase-into-keyring $HOME/.ecryptfs/wrapped_passphrase wrapping_passphrase
~~~

По окончанию данной операции на экран будет выведена подпись ключа монтирования. Впоследствии она будет использоваться в конфигурационных файлах вместо пароля.

Получить значение подписи ключа монтирования можно в любой момент командой `keyctl list @u`.

**6\.** Создать каталог зашифрованных файлов

~~~
mkdir -m 700 .data-lower
~~~

**7\.** Создать каталог доступа

~~~
mkdir -m 500 .data-upper
~~~

Файлы станут доступны после монтирования зашифрованного тома.

**8\.** Добавить в _/etc/fstab_ следующее

~~~
/home/user/.data-lower /home/user/.data-upper ecryptfs noauto,user,ecryptfs_sig=16242358f0079dd6,ecryptfs_fnek_sig=16242358f0079dd6,ecryptfs_cipher=blowfish,ecryptfs_key_bytes=32,ecryptfs_unlink_sigs 0 0
~~~

_**noauto**_: не монтировать том автоматически; без этой опции systemd попытается смонтировать том при загрузке и вернет ошибку, т. к. зашифрованные тома монтируются вручную;

_**user**_: разрешить пользователю монтировать том;

_**ecryptfs_sig**_: подпись ключа монтирования;

_**ecrypts_fnek_sig**_: „filename encryption key signature“, подпись ключа для шифрования файловых имен;

_**ecryptfs_cipher**_: алгоритм шифрования;

_**ecryptfs_key_bytes**_: размер ключа шифрования;

_**ecryptfs_unlink_sigs**_: удалять пароль монтирования из ключницы при размонтировании тома.

**9\.** Смонтировать том

~~~
mount -i ~/.data-upper
~~~

При выполнении данной команды пароль монтирования должен находиться в ключнице.

Файлы, добавляемые в каталог _~/.data-upper_, будут зашифрованы и добавлены в каталог _~/.data-lower_. При размонтировании _~/.data-upper_, все файлы из него исчезнут, но их зашифрованные дубликаты останутся в _~/.data-lower_.

**10\.** Размонтировать том

~~~
umount ~/.data-upper
~~~

Пароль монтирования будет удален из ключницы и потребует повторного добавления при последующем монтировании тома.

#Глоссарий
{: id="Глоссарий"}

**mount passphrase**
{: id="monunt_passphrase"}

пароль монтирования

**stacked cryptographic file system**
{: id="stacked_cryptographic_file_system"}

файловая система, устанавливаемая поверх уже существующей

**wrapped passphrase**
{: id="wrapped_passphrase"}

упакованный пароль

**wrapping passphrase**
{: id="wrapping_passphrase"}

пароль упаковщика

#Инструментарий
{: id="Инструментарий"}

**ecryptfs-utils** _набор утилит для работы с Ecryptfs_
{: id="ecryptfs-utils"}

**ecryptfs-wrap-passphrase** _упаковщик пароля монтирвания_
{: id="ecryptfs-wrap-passphrase"}

~~~
# упаковать пароль монтирования
printf "%s\n%s" "mount_passphrase" "wrapping_passphrase" | ecryptfs-wrap-passphrase $HOME/.ecryptfs/wrpapped-passphrase -
~~~

**keyctl** _менеджер ключей_
{: id="keyctl"}

~~~
# показать пароли, хранимые в ключнице
keyctl list @u
~~~

**keyutils** _набор утилит для работы с ключницей_
{: id="keyutils"}

**modprobe** _средство загрузки модулей ядра_
{: id="modprobe"}
