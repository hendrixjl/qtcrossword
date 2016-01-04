#include "crossword.h"

CrossWord::CrossWord(QObject *parent)
    : QObject(parent),
      m_pcolor("black")
{
}

QString CrossWord::word() const
{
    return m_word;
}

void CrossWord::setWord(const QString & word)
{
    m_word = word;
}

QString CrossWord::pcolor() const
{
    return m_pcolor;
}

void CrossWord::setPcolor(const QString& color)
{
    m_pcolor = color;
}
