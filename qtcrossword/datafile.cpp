#include "datafile.h"

DataFile::DataFile(QObject *parent)
    : QObject(parent),
      m_filename()
{
}

QString DataFile::filename() const
{
    return m_filename;
}

void DataFile::setFilename(const QString & filename)
{
    m_filename = filename;
}
