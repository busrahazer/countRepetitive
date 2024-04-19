// MainWindow.h

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QObject>
#include <QDebug>


class MainWindow : public QObject
{
    Q_OBJECT

public:
    explicit MainWindow(QObject *parent = nullptr); // Just a constructor definition

signals:

};

#endif // MAINWINDOW_H
