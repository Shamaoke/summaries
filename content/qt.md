---
title: Qt
---

# Содержание #
{: id="Содержание" }

[Терминология](#Терминология)

[C++ \| Ключевые классы и их методы](#C++_Ключевые_классы_и_их_методы)

[С++ \| Специализированные классы и их методы](#C++_Специализированные_классы_и_их_методы)

[C++ \| Макросы](#С++_Макросы)

[QML](#QML)

[QML \| Qt QML](#QML_Qt_QML)

[CMake](#Cmake)

[Руководства](#Руководства)

[Списки](#Списки)

[Ссылки](#Ссылки)

# Терминология #
{: id="Терминология" }

связывание (_binding_)

: one

сигнал (_signal_)

: two

# C++ | Ключевые классы и их методы #
{: id="C++_Ключевые_классы_и_их_методы" }

## [`QCoreApplication`](https://doc.qt.io/qt-6/qcoreapplication.html) ##

* [`void QCoreApplication::exit(int returnCode = 0)`](https://doc.qt.io/qt-6/qcoreapplication.html#exit)

* [`void QCoreApplication::quit()`](https://doc.qt.io/qt-6/qcoreapplication.html#quit)

## [`QGuiApplication`](https://doc.qt.io/qt-6/qguiapplication.html) ##

* [`int QGuiApplication::exec()`](https://doc.qt.io/qt-6/qguiapplication.html#exec)

## [`QObject`](https://doc.qt.io/qt-6/qobject.html) ##

* [`template <typename PointerToMemberFunction, typename Functor>`](https://doc.qt.io/qt-6/qobject.html#connect-4)  
  [`QMetaObject::Connection QObject::connect(const QObject *sender, PointerToMemberFunction signal, Functor functor)`](https://doc.qt.io/qt-6/qobject.html#connect-4)

## [`QProcessEnvironment`](https://doc.qt.io/qt-6/qprocessenvironment.html) ##

* [`void QProcessEnvironment::insert(const QString &name, const QString &value)`](https://doc.qt.io/qt-6/qprocessenvironment.html#insert)

## [`QQmlApplicationEngine`](https://doc.qt.io/qt-6/qqmlapplicationengine.html) ##

* [`void QQmlApplicationEngine::load(const QUrl &url)`](https://doc.qt.io/qt-6/qqmlapplicationengine.html#load)

* [`void QQmlApplicationEngine::load(const QString &filePath)`](https://doc.qt.io/qt-6/qqmlapplicationengine.html#load-1)

## [`QQmlEngine`](https://doc.qt.io/qt-6/qqmlengine.html) ##

* [`void QQmlEngine::addImportPath(const QString &path)`](https://doc.qt.io/qt-6/qqmlengine.html#addImportPath)

# C++ | Специализированные классы и их методы #
{: id="C++_Специализированные_классы_и_их_методы" }

## [`QMediaPlayer`](https://doc.qt.io/qt-6/qmediaplayer.html) ##

# С++ | Макросы #
{: id="С++_Макросы" }

## [`QObject`](https://doc.qt.io/qt-6/qobject.html) ##

* [`Q_CLASSINFO`](https://doc.qt.io/qt-6/qobject.html#Q_CLASSINFO)

* [`Q_EMIT`](https://doc.qt.io/qt-6/qobject.html#Q_EMIT)

* [`Q_INVOKABLE`](https://doc.qt.io/qt-6/qobject.html#Q_INVOKABLE)

* [`Q_OBJECT`](https://doc.qt.io/qt-6/qobject.html#Q_OBJECT)

* [`Q_PROPERTY`](https://doc.qt.io/qt-6/qobject.html#Q_PROPERTY)

* [`Q_SIGNAL`](https://doc.qt.io/qt-6/qobject.html#Q_SIGNAL)

* [`Q_SLOT`](https://doc.qt.io/qt-6/qobject.html#Q_SLOT)

## [`QQmlEngine`](https://doc.qt.io/qt-6/qqmlengine.html) ##

* [`QML_ELEMENT`](https://doc.qt.io/qt-6/qqmlengine.html#QML_ELEMENT)

* [`QML_SINGLETON`](https://doc.qt.io/qt-6/qqmlengine.html#QML_SINGLETON)

# QML #
{: id="QML" }

## [`FocusScope`](https://doc.qt.io/qt-6/qml-qtquick-focusscope.html) ##

## [`FontLoader`](https://doc.qt.io/qt-6/qml-qtquick-fontloader.html) ##

## [`Grid`](https://doc.qt.io/qt-6/qml-qtquick-grid.html) ##

## [`GridLayout`](https://doc.qt.io/qt-6/qml-qtquick-layouts-gridlayout.html) ##

## [`Loader`](https://doc.qt.io/qt-6/qml-qtquick-loader.html) ##

## [`MediaPlayer`](https://doc.qt.io/qt-6/qml-qtmultimedia-mediaplayer.html) ##

## [`QtObject`](https://doc.qt.io/qt-6/qml-qtqml-qtobject.html) ##

## [`Shortcut`](https://doc.qt.io/qt-6/qml-qtquick-shortcut.html) ##

# QML | Qt QML #
{: id="QML_Qt_QML" }

## [`Qt`](https://doc.qt.io/qt-6/qml-qtqml-qt.html) ##

* [`quit()`](https://doc.qt.io/qt-6/qml-qtqml-qt.html#quit-method)

# CMake #
{: id="CMake" }

[`qt_add_qml_module`](https://doc.qt.io/qt-6/qt-add-qml-module.html)

# Руководства #
{: id="Руководства" }

[Singletons in QML \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qml-singleton.html)

[The Style Sheet Syntax \| Qt Widgets 6.7.1](https://doc.qt.io/qt-6/stylesheet-syntax.html)

[Overview - QML and C++ Integration \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-cppintegration-overview.html)

[Signal and Handler Event System \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-syntax-signals.html)

[Qt Test Overview \| Qt Test 6.7.1](https://doc.qt.io/qt-6/qtest-overview.html)

[Debugging QML Applications \| Qt 6.7](https://doc.qt.io/qt-6/qtquick-debugging.html)

[Import Statements \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-syntax-imports.html)

# Списки #
{: id="Списки" }

[All C++ Classes \| Qt 6.7](https://doc.qt.io/qt-6/classes.html)

[All QML Types \| Qt 6.7](https://doc.qt.io/qt-6/qmltypes.html)

[All QML Value Types \| Qt 6.7](https://doc.qt.io/qt-6/qmlvaluetypes.html)

[Qt QML QML Types \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-qmlmodule.html)

[Qt Quick QML Types \| Qt Quick 6.7.1](https://doc.qt.io/qt-6/qtquick-qmlmodule.html)

[Qt QML C++ Classes \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-module.html)

[\<QtLogging\> - Qt Logging Types \| Qt Core 6.7.1](https://doc.qt.io/qt-6/qtlogging.html)

# Ссылки #
{: id="Ссылки" }

<!-- vim: set textwidth=80 colorcolumn=80: -->
