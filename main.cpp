#include "MainWindow.h"

#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    MainWindow mainWindow; // Create a MainWindow class, so we can generate objects from this class

    engine.rootContext()->setContextProperty("mainWindow", &mainWindow);


    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
