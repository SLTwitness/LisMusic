#ifndef MUSICINFO_H
#define MUSICINFO_H

#include <QObject>
#include <QMediaPlayer>
#include <QUrl>
#include <QSqlDatabase>

class MusicInfo : public QObject
{
    Q_OBJECT
public:
    explicit MusicInfo(QObject *parent = nullptr);
    Q_INVOKABLE void getdata(const QString &file);
    Q_INVOKABLE QVariantList loaddata();
    Q_INVOKABLE void deletedate(const QString &localpath);
    Q_INVOKABLE QVariantList seekdata(const QString &title);

signals:
    // void dataready(const QString &title,const QString &author,const QString &album,qint64 time);
    void changedata();

private:
    void init();
    QSqlDatabase db;
};

#endif // MUSICINFO_H
