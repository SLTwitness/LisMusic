#ifndef MUSICPLAY_H
#define MUSICPLAY_H

#include <QObject>
#include <QMediaPlayer>
#include <QUrl>
#include <QSqlDatabase>
#include <QAudioOutput>

class MusicPlay : public QObject
{
    Q_OBJECT
public:
    explicit MusicPlay(QObject *parent = nullptr);
    Q_INVOKABLE void playmusic(const QString &localpath);
    Q_INVOKABLE void startplay();
    Q_INVOKABLE void stopplay();

    Q_INVOKABLE qint64 duration();
    Q_INVOKABLE qint64 position();
    Q_INVOKABLE void setpos(qint64 position);
    Q_INVOKABLE QString transtime(qint64 duration);

    Q_INVOKABLE QString gettitle();
    Q_INVOKABLE QString getauthor();
    Q_INVOKABLE void setvoice(qreal value);

signals:
    void durationChanged(qint64 duration);
    void titleChanged(const QString &title);
    void authorChanged(const QString &author);


private:
    QMediaPlayer* player;
    QAudioOutput* audiout;

    QString currenttitle;
    QString currentauthor;
};

#endif // MUSICPLAY_H
