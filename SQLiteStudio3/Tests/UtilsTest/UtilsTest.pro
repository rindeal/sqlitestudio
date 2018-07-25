#-------------------------------------------------
#
# Project created by QtCreator 2016-10-03T10:48:04
#
#-------------------------------------------------

include($$PWD/../TestUtils/test_common.pri)

QT       += testlib

QT       -= gui

TARGET = tst_utilssqltest
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app
message("CONFIG:")
message($$CONFIG)
message("LIBS:")
message($$LIBS)

SOURCES += tst_utilssqltest.cpp
DEFINES += SRCDIR=\\\"$$PWD/\\\"
