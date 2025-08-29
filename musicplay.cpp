#include "musicplay.h"
#include <QMediaPlayer>
#include <QMediaMetaData>
#include <QAudioOutput>
#include <QUrl>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QVariant>
#include <QVariantList>

MusicPlay::MusicPlay(QObject *parent)
    : QObject{parent}
{
    player=new QMediaPlayer(this);
    audiout=new QAudioOutput(this);
    player->setAudioOutput(audiout);
    audiout->setVolume(0.5f);

    connect(player, &QMediaPlayer::durationChanged, this, [=](qint64 duration){
        emit durationChanged(duration);
    });

    connect(player,&QMediaPlayer::metaDataChanged,this,[=](){
        const QMediaMetaData &meta=player->metaData();
        QString title=meta.stringValue(QMediaMetaData::Title);

        if(title!=currenttitle){
            currenttitle=title;
            emit titleChanged(currenttitle);
        }
    });

    connect(player,&QMediaPlayer::metaDataChanged,this,[=]{
        const QMediaMetaData &meta=player->metaData();
        QString author=meta.stringValue(QMediaMetaData::ContributingArtist);

        if(author!=currentauthor){
            currentauthor=author;
            emit authorChanged(currentauthor);
        }
    });
}

void MusicPlay::playmusic(const QString &localpath)
{
    if(localpath.isEmpty()){
        return;
    }
    player->setSource(QUrl::fromLocalFile(localpath));
    player->play();
}

void MusicPlay::startplay()
{
    player->play();
}

void MusicPlay::stopplay()
{
    player->pause();
}

qint64 MusicPlay::duration()
{
    return player->duration();
}

qint64 MusicPlay::position()
{
    return player->position();
}

void MusicPlay::setpos(qint64 position)
{
    player->setPosition(position);
}

QString MusicPlay::transtime(qint64 duration)
{
    qint64 totalsec=duration/1000;
    int min=totalsec/60;
    int sec=totalsec%60;
    return QString("%1:%2").arg(min,2,10,QChar('0')).arg(sec,2,10,QChar('0'));
}

QString MusicPlay::gettitle()
{
    return currenttitle;
}

QString MusicPlay::getauthor()
{
    return currentauthor;
}

void MusicPlay::setvoice(qreal value)
{
    audiout->setVolume(value);
    // qDebug()<<"volume:"<<value;
}
