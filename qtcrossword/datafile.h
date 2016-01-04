#ifndef DATAFILE_H
#define DATAFILE_H


#include <QObject>

class DataFile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString filename READ filename WRITE setFilename)
public:
    DataFile(QObject *parent = 0);

    QString filename() const;
    void setFilename(const QString & filename);

private:
    QString m_filename;
};

#endif // DATAFILE_H
