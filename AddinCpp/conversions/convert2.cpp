
#include "convert2.hpp"
#include <boost/lexical_cast.hpp>

namespace ObjectHandler {

    // FIXME consolidate with AddinObjects/conversions/convert2.cpp

    inline bool is_numeric(const std::string &s, double &l) {
        try {
            l = boost::lexical_cast<double>(s);
            return true;
        } catch(...) {
            return false;
        }
    }

    template<class container_t>
    QuantLib::Date convertDate(const container_t& c) {
        if(c.type() == typeid(long))
            return QuantLib::Date(c.operator long());
        //else if(c.type() == typeid(double))
        //    return QuantLib::Date(static_cast<QuantLib::BigInteger>(c.operator double()));
        else if(c.type() == typeid(std::string)) {
            std::string s = c.operator std::string();
            double d;
            if (is_numeric(s, d))
                return QuantLib::Date(static_cast<QuantLib::BigInteger>(d));
        //    if (QuantLib::IMM::isIMMcode(s, false))
        //        return QuantLib::IMM::date(s);
        //    QuantLib::Period p = QuantLib::PeriodParser::parse(s);
        //    QuantLib::Date d2 = QuantLib::Settings::instance().evaluationDate();
        //    return d2 + p;
        }
        OH_FAIL("unable to convert type '" << c.type().name() << "' to type 'QuantLib::Date'");
    }

    template<> 
    QuantLib::Date convert2<QuantLib::Date, property_t>(const property_t& c) {
        return convertDate(c);
    }
}
