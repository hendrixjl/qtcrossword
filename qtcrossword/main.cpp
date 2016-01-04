#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QMetaObject>

#include <QDebug>

#include "crossword.h"
#include "datafile.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<CrossWord>("CrossWord", 1,0, "CrossWord");
    qmlRegisterType<DataFile>("DataFile", 1,0, "DataFile");


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *rootObject = engine.rootObjects().first();
    QObject *optionsList = rootObject->findChild<QObject*>("optionsList");

    QVariantMap newElement;
    newElement.insert("name", "SILVANUS");
    newElement.insert("pcolor", "red");

    QMetaObject::invokeMethod(
        optionsList,
        "append",
         Q_ARG(QVariant, QVariant::fromValue(newElement)));

    QObject *qdatafile = rootObject->findChild<QObject*>("dataFile");
    DataFile *datafile = qobject_cast<DataFile *>(qdatafile);
    if (datafile == 0) {
        qDebug() << "datafile is null!\n";
    }
    else {
        qDebug() << "datafile->filename()" << datafile->filename() << '\n';
    }

    return app.exec();
}

