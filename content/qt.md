---
title: Qt
---

# Содержание #
{: id="Содержание" }

[Терминология](#Терминология)

[C++](#C++)

[C++ \| Макросы](#С++_Макросы)

[QML](#QML)

[QML \| Qt QML](#QML_Qt_QML)

[QML \| Статьи](#QML_Статьи)

[Списки](#Списки)

[Ссылки](#Ссылки)

# Терминология #
{: id="Терминология" }

**связывание** (_binding_)

**сигнал** (_signal_)

# С++ #
{: id="C++" }

[**QCoreApplication**](https://doc.qt.io/qt-6/qcoreapplication.html)

~~~~
void QCoreApplication::exit(int returnCode = 0)
~~~~

[ссылка](https://doc.qt.io/qt-6/qcoreapplication.html#exit)

~~~~
void QCoreApplication::quit()
~~~~

[ссылка](https://doc.qt.io/qt-6/qcoreapplication.html#quit)

[**QGuiApplication**](https://doc.qt.io/qt-6/qguiapplication.html)

~~~~
int QGuiApplication::exec()
~~~~

[ссылка](https://doc.qt.io/qt-6/qguiapplication.html#exec)

[**QObject**](https://doc.qt.io/qt-6/qobject.html)

~~~~
template <typename PointerToMemberFunction, typename Functor>
QMetaObject::Connection QObject::connect(const QObject *sender, PointerToMemberFunction signal, Functor functor)
~~~~

[ссылка](https://doc.qt.io/qt-6/qobject.html#connect-4)

[**QProcessEnvironment**](https://doc.qt.io/qt-6/qprocessenvironment.html)

~~~~
void QProcessEnvironment::insert(const QString &name, const QString &value)
~~~~

[ссылка](https://doc.qt.io/qt-6/qprocessenvironment.html#insert)

[**QQmlApplicationEngine**](https://doc.qt.io/qt-6/qqmlapplicationengine.html)

~~~~
void QQmlApplicationEngine::load(const QUrl &url)
~~~~

[ссылка](https://doc.qt.io/qt-6/qqmlapplicationengine.html#load)

~~~~
void QQmlApplicationEngine::load(const QString &filePath)
~~~~

[ссылка](https://doc.qt.io/qt-6/qqmlapplicationengine.html#load-1)

[**QQmlEngine**](https://doc.qt.io/qt-6/qqmlengine.html)

~~~~
void QQmlEngine::addImportPath(const QString &path)
~~~~

[ссылка](https://doc.qt.io/qt-6/qqmlengine.html#addImportPath)

# С++ | Макросы #
{: id="С++_Макросы" }

[**QObject**](https://doc.qt.io/qt-6/qobject.html)

: [**Q_CLASSINFO**](https://doc.qt.io/qt-6/qobject.html#Q_CLASSINFO)

: [**Q_EMIT**](https://doc.qt.io/qt-6/qobject.html#Q_EMIT)

: [**Q_INVOKABLE**](https://doc.qt.io/qt-6/qobject.html#Q_INVOKABLE)

: [**Q_OBJECT**](https://doc.qt.io/qt-6/qobject.html#Q_OBJECT)

: [**Q_PROPERTY**](https://doc.qt.io/qt-6/qobject.html#Q_PROPERTY)

: [**Q_SIGNAL**](https://doc.qt.io/qt-6/qobject.html#Q_SIGNAL)

: [**Q_SLOT**](https://doc.qt.io/qt-6/qobject.html#Q_SLOT)

[**QQmlEngine**](https://doc.qt.io/qt-6/qqmlengine.html)

: [**QML_ELEMENT**](https://doc.qt.io/qt-6/qqmlengine.html#QML_ELEMENT)

: [**QML_SINGLETON**](https://doc.qt.io/qt-6/qqmlengine.html#QML_SINGLETON)

# QML #
{: id="QML" }

[**FocusScope**](https://doc.qt.io/qt-6/qml-qtquick-focusscope.html)

[**FontLoader**](https://doc.qt.io/qt-6/qml-qtquick-fontloader.html)

[**Grid**](https://doc.qt.io/qt-6/qml-qtquick-grid.html)

[**GridLayout**](https://doc.qt.io/qt-6/qml-qtquick-layouts-gridlayout.html)

[**Loader**](https://doc.qt.io/qt-6/qml-qtquick-loader.html)

[**MediaPlayer**](https://doc.qt.io/qt-6/qml-qtmultimedia-mediaplayer.html)

[**QtObject**](https://doc.qt.io/qt-6/qml-qtqml-qtobject.html)

[**Shortcut**](https://doc.qt.io/qt-6/qml-qtquick-shortcut.html)

# QML | Qt QML #
{: id="QML_Qt_QML" }

[**Qt**](https://doc.qt.io/qt-6/qml-qtqml-qt.html)

~~~~
quit()
~~~~

[ссылка](https://doc.qt.io/qt-6/qml-qtqml-qt.html#quit-method)

# QML | Статьи #
{: id="QML_Статьи" }

• [Debugging QML Applications \| Qt 6.7](https://doc.qt.io/qt-6/qtquick-debugging.html)

• [Import Statements \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-syntax-imports.html)

# Списки #
{: id="Списки" }

• [Qt QML QML Types \| Qt QML 6.7.1](https://doc.qt.io/qt-6/qtqml-qmlmodule.html)

• [Qt Quick QML Types \| Qt Quick 6.7.1](https://doc.qt.io/qt-6/qtquick-qmlmodule.html)

# Ссылки #
{: id="Ссылки" }

• [All Classes \| Qt 5.15](https://doc.qt.io/qt-5/classes.html)

• [All QML Types \| Qt 5.15](https://doc.qt.io/qt-5/qmltypes.html)

<!-- vim: set textwidth=80 colorcolumn=80: -->
