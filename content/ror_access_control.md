---
layout: default
title: Контроль доступа
---

#Содержание
{: id="Содержание"}

[Глоссарий](#Глоссарий)

[Внешние инструменты](#Внешние_инструменты)

[Перечень методов](#Перечень_методов)

[Ссылки](#Ссылки)

#Глоссарий
{: id="Глоссарий"}

**Авторизация**

Регламентирование доступа к ресурсам;

Проверка обоснованности требования пользователя на доступ к ресурсу.

**Аутентификация**

Подтверждения пользователем права на доступ к группе ресурсов;

Проверка достоверности (аутентичности) пользователя.

**Идентификатор**

Имя учетной записи.

**Идентификация**

Представление системе.

**Пароль**

Секретное слово для доступа к учетной записи.

**Учетная запись**

Запись в БД, содержащая сведения о пользователе.

#Внешние инструменты
{: id="Внешние_инструменты"}

**Devise**

Внешний инструмент для реализации системы аутентификации в Rails.

**Warden**

Внешний инструмент общего назначения для реализации системы аутентификации в Rails.

#Перечень методов
{: id="Перечень_методов"}

**attr_accessible** \[ruby on rails\] [`AtiveveModel::MassAssignmentSecurity::ClassMethods`](http://rdoc.info/gems/activemodel/ActiveModel/MassAssignmentSecurity/ClassMethods)

Определить список атрибутов, которым можно передавать значения посредством массированного назначения.

**attr_protected** \[ruby on rails\] [`AtiveveModel::MassAssignmentSecurity::ClassMethods`](http://rdoc.info/gems/activemodel/ActiveModel/MassAssignmentSecurity/ClassMethods)

Определить список атрибутов, которым нельзя передaвать значения посредством массированного назначения.

**authenticate** \[ruby on rails\] [`ActiveModel::SecurePassword::InstanceMethodsOnActivation`](http://rdoc.info/gems/activemodel/ActiveModel/SecurePassword/InstanceMethodsOnActivation)

Возвратить текущую модель, если пароль верен. В противном случае, возвратить `false`.

**devise** \[devise\] [`Devise::Models`](http://rdoc.info/gems/devise/Devise/Models)

Включить в модель указанный модуль Devise.

**devise_for** \[devise\] [`ActionDispatch::Routing::Mapper`](http://rdoc.info/gems/devise/ActionDispatch/Routing/Mapper)

Установить все необходимые маршруты для включенных в модель модулей Devise.

**has_secure_password** \[ruby on rails\] [`ActiveModel::SecurePassword::ClassMethods`](http://rdoc.info/gems/activemodel/ActiveModel/SecurePassword/ClassMethods)

Добавить для данной модели методы password= и authenticate. Установить проверку наличия пароля и его подтверждения. Модель должна иметь атрибут `password_digest`.

**password=** \[ruby on rails\] [`ActiveModel::SecurePassword::InstanceMethodsOnActivation`](http://rdoc.info/gems/activemodel/ActiveModel/SecurePassword/InstanceMethodsOnActivation)

Зашифровать пароль и сохранить его в атрибуте `password_digest` текущей модели.

#Ссылки
{: id="Ссылки"}

[Devise RDoc](http://rubydoc.info/gems/devise/frames)

[Devise вики](https://github.com/plataformatec/devise/wiki)

[Warden Github](https://github.com/hassox/warden)
