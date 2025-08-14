#include <QApplication>
#include <QQmlApplicationEngine>
#include <savehisty.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath("qrc:/");

    const QUrl url(QStringLiteral("qrc:/LisMusic/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    qmlRegisterType<Savehisty>("savehisty",1,0,"Savehisty");
    engine.load(url);
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/Config/Config.qml")), "Config", 1, 0, "Config");
    return app.exec();
}
