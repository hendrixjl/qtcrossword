#ifndef CROSSWORD_H
#define CROSSWORD_H

#include <QObject>

class CrossWord : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString word READ word WRITE setWord)
    Q_PROPERTY(QString pcolor READ pcolor WRITE setPcolor)
public:
    CrossWord(QObject *parent = 0);

    QString word() const;
    void setWord(const QString & word);

    QString pcolor() const;
    void setPcolor(const QString& color);

private:
    QString m_word;
    QString m_pcolor;
};


#endif // CROSSWORD_H
