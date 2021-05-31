#pragma once

#include <boost/date_time/posix_time/posix_time.hpp>

class MyClass
{
public:
    MyClass( const boost::posix_time::ptime& timeInfo );
};
