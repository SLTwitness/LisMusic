#include <QApplication>
#include <QQmlApplicationEngine>
#include <savehisty.h>
#include <musicinfo.h>
#include <musicplay.h>
#include <QQmlContext>

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
    qmlRegisterType<MusicInfo>("musicinfo",1,0,"MusicInfo");
    qmlRegisterType<MusicPlay>("musicplay",1,0,"MusicPlay");

    MusicPlay player;
    engine.rootContext()->setContextProperty("player",&player);
    // MusicInfo reader;
    // engine.rootContext()->setContextProperty("reader",&reader);

    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/Config/Config.qml")), "Config", 1, 0, "Config");
    engine.load(url);
    return app.exec();
}
