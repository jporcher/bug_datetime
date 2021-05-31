# Adding target:
TARGET = bug_datetime_wrapper

# Disabling QtCore as not needed:
QT -= core

# Disabling QtGui as not needed:
QT -= gui

# Specifying template:
TEMPLATE = lib
CONFIG += shared

# Importing sources:
SOURCES += wrapper.cpp

# Importing headers:
HEADERS += wrapper.h

# Note: linking wrapper to boost_datetime does not fix the issue

# Link to bug_datetime_base
# Workaround3.2: if commenting lines below, imbue works fine from all places in probject
LIBS += $$OUT_PWD/../../lib/bug_datetime_base/libbug_datetime_base_$${ANDROID_TARGET_ARCH}.so
PRE_TARGETDEPS += $$OUT_PWD/../../lib/bug_datetime_base/libbug_datetime_base_$${ANDROID_TARGET_ARCH}.so
# Link to bug_datetime_lib
# Workaround3.3: if commenting lines below, imbue works fine from all places in probject
LIBS += $$OUT_PWD/../../lib/bug_datetime_lib/libbug_datetime_lib_$${ANDROID_TARGET_ARCH}.so
PRE_TARGETDEPS += $$OUT_PWD/../../lib/bug_datetime_lib/libbug_datetime_lib_$${ANDROID_TARGET_ARCH}.so

# Workaround4: link to bug_datetime_lib before bug_datetime_base.
#LIBS += $$OUT_PWD/../../lib/bug_datetime_lib/libbug_datetime_lib_$${ANDROID_TARGET_ARCH}.so
#PRE_TARGETDEPS += $$OUT_PWD/../../lib/bug_datetime_lib/libbug_datetime_lib_$${ANDROID_TARGET_ARCH}.so
#LIBS += $$OUT_PWD/../../lib/bug_datetime_base/libbug_datetime_base_$${ANDROID_TARGET_ARCH}.so
#PRE_TARGETDEPS += $$OUT_PWD/../../lib/bug_datetime_base/libbug_datetime_base_$${ANDROID_TARGET_ARCH}.so
