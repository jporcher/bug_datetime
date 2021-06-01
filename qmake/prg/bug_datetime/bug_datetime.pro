# boost root PATH:
BOOST_DIR = $${PWD}/../../../boost

# Adding target:
TARGET = bug_datetime

# Using QtCore:
CONFIG += qt
QT += core

# Using QtWidget:
QT += gui widgets

# Specifying template:
TEMPLATE = app

# Importing sources:
SOURCES += main.cpp

# Include directories:
INCLUDEPATH += ../../lib/bug_datetime_base \
    $${BOOST_DIR}/1.70.0

# Mark external includes with 'isystem' so that we do not get any compilation warning from there:
QMAKE_CXXFLAGS += -isystem $${BOOST_DIR}/1.70.0

# Linking boost date_time:
LIBS += -L$${BOOST_DIR}/1.70.0/lib/android_$${ANDROID_TARGET_ARCH}/r21b/boost_date_time-mt-a32.a
# Linking boost system:
LIBS += -L$${BOOST_DIR}/1.70.0/lib/android_$${ANDROID_TARGET_ARCH}/r21b/boost_system-mt-a32.a

# Link to bug_datetime_base
# Workaround3.1: if commenting lines below, imbue works fine from all places in probject
LIBS += $$OUT_PWD/../../lib/bug_datetime_base/libbug_datetime_base_$${ANDROID_TARGET_ARCH}.so
PRE_TARGETDEPS += $$OUT_PWD/../../lib/bug_datetime_base/libbug_datetime_base_$${ANDROID_TARGET_ARCH}.so

# Workaround5: if uncommenting lines below, imbue works fine from all places in probject
#LIBS += $$OUT_PWD/../../lib/bug_datetime_wrapper/libbug_datetime_wrapper_$${ANDROID_TARGET_ARCH}.so
#PRE_TARGETDEPS += $$OUT_PWD/../../lib/bug_datetime_wrapper/libbug_datetime_wrapper_$${ANDROID_TARGET_ARCH}.so

