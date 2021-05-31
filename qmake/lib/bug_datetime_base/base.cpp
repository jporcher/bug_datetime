#include "base.h"

#include <iostream>

MyClass::MyClass( const boost::posix_time::ptime& timeInfo )
{
    // Workaround1:
    // If line below is commented, then formatting boost::posix_time::ptime using imbue from
    // other places in the project works perfectly
    std::cout << timeInfo;
}
