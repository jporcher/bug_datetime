
TEMPLATE = subdirs

# Adding all libraries and program:
SUBDIRS += qmake/lib/bug_datetime_base/bug_datetime_base.pro
SUBDIRS += qmake/lib/bug_datetime_lib/bug_datetime_lib.pro
SUBDIRS += qmake/lib/bug_datetime_wrapper/bug_datetime_wrapper.pro
SUBDIRS += qmake/prg/bug_datetime/bug_datetime.pro

# Manage dependencies to support multi-threaded builds (-j option):
CONFIG += ordered
bug_datetime_wrapper.depends = bug_datetime_base bug_datetime_lib
bug_datetime.depends = bug_datetime_base
