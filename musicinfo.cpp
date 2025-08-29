#include "musicinfo.h"
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

MusicInfo::MusicInfo(QObject *parent)
    : QObject{parent}
{
    init();
}

void MusicInfo::getdata(const QString &file)
{
    QUrl url(file);
    QString localpath=url.toLocalFile();
    //qDebug()<<"本地路径为"<<localpath;

    QSqlQuery check(db);
    check.prepare("SELECT COUNT(*) FROM music WHERE localpath = ?");
    check.addBindValue(localpath);
    if(!check.exec()){
        qWarning()<<"检测数据库失败"<<check.lastError().text();
        return;
    }
    if(check.next()){
        int count=check.value(0).toInt();
        if(count>0){
            qWarning()<<"音乐已存在";
            return;
        }
    }

    QMediaPlayer* player=new QMediaPlayer;

    player->setSource(QUrl::fromLocalFile(localpath));

    connect(player,&QMediaPlayer::metaDataChanged,this,[=](){
        const QMediaMetaData &meta = player->metaData();

        QString title = meta.stringValue(QMediaMetaData::Title);
        QString author = meta.stringValue(QMediaMetaData::ContributingArtist);
        QString album = meta.stringValue(QMediaMetaData::AlbumTitle);
        qint64 listime = meta.value(QMediaMetaData::Duration).toLongLong();

        qDebug() << "标题:" << title;
        qDebug() << "艺术家:" << author;
        qDebug() << "专辑:" << album;
        qDebug() << "时长:" << listime;

        QSqlQuery insert(db);
        if (!insert.prepare(R"(
            INSERT INTO music (title,author,album,listime,localpath)
            VALUES (:title,:author,:album,:listime,:localpath)
        )")) {
            qWarning() << "准备插入查询失败:" << insert.lastError().text();
            return;
        }

        insert.bindValue(":title",title);
        insert.bindValue(":author",author);
        insert.bindValue(":album",album);
        insert.bindValue(":listime",listime);
        insert.bindValue(":localpath",localpath);

        if(!insert.exec()){
            qWarning()<<"添加数据库失败"<<insert.lastError().text();
        }
        else{
            emit changedata();
        }
    });
    qDebug()<<"保存成功";
}

QVariantList MusicInfo::loaddata()
{
    QVariantList res;
    QSqlQuery query(db);
    query.exec("SELECT title,author,album,listime,localpath FROM music");
    while(query.next()){
        QVariantMap map;
        map["title"]=query.value(0).toString();
        map["author"]=query.value(1).toString();
        map["album"]=query.value(2).toString();
        qint64 duration=query.value(3).toLongLong();
        int seconds=duration/1000;
        int min=seconds/60;
        int sec=seconds%60;
        QString time=QString("%1:%2").arg(min,2,10,QLatin1Char('0')).arg(sec,2,10,QLatin1Char('0'));
        map["listime"]=time;
        map["localpath"]=query.value(4).toString();
        res.append(map);
    }

    return res;
}

void MusicInfo::deletedate(const QString &localpath)
{
    if(!db.open()){
        qWarning()<<"打开数据库失败"<<db.lastError().text();
        return;
    }

    QSqlQuery query(db);
    query.prepare("DELETE FROM music WHERE localpath = ?");
    query.addBindValue(localpath);
    if(!query.exec()){
        qWarning()<<"删除数据失败"<<query.lastError().text();
    }
}

QVariantList MusicInfo::seekdata(const QString &title)
{
    QVariantList res;
    QSqlQuery query(db);
    query.prepare("SELECT * FROM music WHERE title LIKE ?");
    query.addBindValue(title+"%");
    if(query.exec()){
        while(query.next()){
            QVariantMap map;
            map["title"]=query.value(1).toString();
            map["author"]=query.value(2).toString();
            map["album"]=query.value(3).toString();
            qint64 duration=query.value(4).toLongLong();
            int seconds=duration/1000;
            int min=seconds/60;
            int sec=seconds%60;
            QString time=QString("%1:%2").arg(min,2,10,QLatin1Char('0')).arg(sec,2,10,QLatin1Char('0'));
            map["listime"]=time;
            map["localpath"]=query.value(5).toString();
            res.append(map);
        }
    }
    return res;
}

void MusicInfo::init()
{
    if(QSqlDatabase::contains("music_connection")) {
        db = QSqlDatabase::database("music_connection");
    }
    else{
        db = QSqlDatabase::addDatabase("QSQLITE", "music_connection");
    }
    db.setDatabaseName("music.db");
    if(!db.open()){
        qWarning()<<"打开数据库失败"<<db.lastError().text();
        return;
    }

    QSqlQuery query(db);
    QString create=R"(
        CREATE TABLE IF NOT EXISTS music(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            author TEXT,
            album TEXT,
            listime INTEGER,
            localpath TEXT
        )
    )";

    if(!query.exec(create)){
        qWarning()<<"创建失败"<<query.lastError().text();
    }
}
