# boost root PATH:
BOOST_DIR = $${PWD}/../../../boost

# Adding target:
TARGET = bug_datetime_lib

# Disabling QtGui as not needed:
QT -= gui

# Using QtCore:
CONFIG += qt
QT += core

# Specifying template:
TEMPLATE = lib
CONFIG += shared

# Importing sources:
SOURCES += lib.cpp

# Importing headers:
HEADERS += lib.h

# Include directories:
INCLUDEPATH += \ 
    $${BOOST_DIR}/1.70.0

# Mark external includes with 'isystem' so that we do not get any compilation warning from there:
QMAKE_CXXFLAGS += -isystem $${BOOST_DIR}1.70.0

# Linking boost date_time:
LIBS += -L$${BOOST_DIR}/1.70.0/lib/android_$${ANDROID_TARGET_ARCH}/r21b/boost_date_time-mt-a32.a
# Linking boost system:
LIBS += -L$${BOOST_DIR}/1.70.0/lib/android_$${ANDROID_TARGET_ARCH}/r21b/boost_system-mt-a32.a
