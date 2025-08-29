#include "savehisty.h"
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QDebug>
#include <QSqlError>

Savehisty::Savehisty(QObject *parent)
    : QObject{parent}
{
    init();
}

void Savehisty::savehis(const QVariantList &data)
{
    QSqlQuery clear("DELETE FROM history");
    QSqlQuery insert;
    insert.prepare(R"(
        INSERT INTO history (historysearch)
        VALUES (?)
    )");

    for(const QVariant& item:data){
        QVariantMap map=item.toMap();
        insert.addBindValue(map["historysearch"]);
        if(!insert.exec()){
            qWarning()<<"添加失败";
        }
    }

    qDebug()<<"保存成功";
}

QVariantList Savehisty::loadhis()
{
    QVariantList res;
    QSqlQuery query("SELECT historysearch FROM history");
    while(query.next()){
        QVariantMap map;
        map["historysearch"]=query.value(0).toString();
        res.append(map);
    }
    return res;
}

void Savehisty::init()
{
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("history.db");
    if(!db.open()){
        qWarning()<<"打开失败";
    }

    QSqlQuery query;
    QString create=R"(
        CREATE TABLE IF NOT EXISTS history(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            historysearch TEXT
        )
    )";

    if(!query.exec(create)){
        qWarning()<<"创建失败"<<query.lastError().text();
    }
}
