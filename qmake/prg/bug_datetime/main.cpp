#include <sstream>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <QDebug>
#include <QApplication>

#include <dlfcn.h>
typedef void* dllHandle;

int main( int argc, char* argv[] )
{
    QApplication app( argc, argv );

    void* wrapperPtr = NULL;

    // Workaround2:
    // if commenting line below, bug_datetime_wrapper is not loaded, using imbue from any places works perfectly
    wrapperPtr = dlopen( "libbug_datetime_wrapper_armeabi-v7a.so", 0);

    if ( wrapperPtr )
        qDebug() << "Loaded bug_datetime_wrapper, then formatting will fail";
    else
        qDebug() << "Failed to load bug_datetime_wrapper, then formatting will work";

    {
        boost::posix_time::ptime t1(boost::gregorian::date(2002,boost::gregorian::Jan,10),
                                    boost::posix_time::time_duration(1,2,4));

        std::stringstream temp;

        boost::posix_time::time_facet* facet = new boost::posix_time::time_facet("%Y$%b$%d %H:%M:%S.main.%f");
        const std::locale loc = std::locale(std::locale::classic(), facet);
        temp.imbue(loc);

        temp << t1;

        qDebug() << "FROM MAIN: " << temp.str().c_str();
    }

    auto libPtr = dlopen( "libbug_datetime_lib_armeabi-v7a.so", 0);
    if ( libPtr )
    {
        typedef void (*TestBoostFunc)();
        auto func = (TestBoostFunc) dlsym( libPtr, "TestBoost" );
        if ( func )
            (*func)();
        else
            qDebug() << "Failed to load TestBoost function";
    }
    else
    {
        qDebug() << "Failed to load library function";
    }

    return app.exec();
}
