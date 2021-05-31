#include "lib.h"

#include <sstream>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <QDebug> 

void TestBoost()
{
    boost::posix_time::ptime t1(boost::gregorian::date(2002,boost::gregorian::Jan,10),
                                boost::posix_time::time_duration(1,2,4));

    std::stringstream temp;

    temp << "FROM TestBoost:" << std::endl << "Unformatted:" << t1 << std::endl;

    boost::posix_time::time_facet* facet = new boost::posix_time::time_facet("%Y$%b$%d %H:%M:%S.TestBoost.%f");
    const std::locale loc = std::locale(std::locale::classic(), facet);
    temp.imbue(loc);

    temp << "Formatted:" << t1;

    qDebug() << temp.str().c_str();
}

