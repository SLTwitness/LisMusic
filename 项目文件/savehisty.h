#ifndef SAVEHISTY_H
#define SAVEHISTY_H

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>

class Savehisty : public QObject
{
    Q_OBJECT
public:
    explicit Savehisty(QObject *parent = nullptr);
    Q_INVOKABLE void savehis(const QVariantList& data);
    Q_INVOKABLE QVariantList loadhis();

signals:

private:
    void init();
    QSqlDatabase db;
};

#endif // SAVEHISTY_H
