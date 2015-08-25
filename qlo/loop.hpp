
// FIXME - this file needs to be autogenerated

#ifndef qla_loop_hpp
#define qla_loop_hpp

#include <boost/bind.hpp>

namespace QuantLibAddin {

    // qlIMMdate

    typedef     boost::_bi::bind_t<
                QuantLib::Date,
                QuantLib::Date (__cdecl*)(
                    const std::string&,
                    const QuantLib::Date&),
                boost::_bi::list2<
                    boost::arg<1>,
                    boost::_bi::value<QuantLib::Date> > >
                qlIMMdateBind;

    // qlIMMcode

    typedef     boost::_bi::bind_t<
                std::string,
                std::string (__cdecl*)(
                    const QuantLib::Date&),
                boost::_bi::list1<
                    boost::arg<1> > >
                qlIMMcodeBind;

    // qlCalendarAdvance

    typedef     boost::_bi::bind_t<
                QuantLib::Date,
                boost::_mfi::cmf4<
                    QuantLib::Date,
                    QuantLib::Calendar,
                    const QuantLib::Date&,
                    const QuantLib::Period&,
                    QuantLib::BusinessDayConvention,
                    bool>,
                boost::_bi::list5<
                    boost::_bi::value<QuantLib::Calendar >,
                    boost::_bi::value<QuantLib::Date>,
                    boost::arg<1>,
                    boost::_bi::value<QuantLib::BusinessDayConvention>,
                    boost::_bi::value<bool> > >
                qlCalendarAdvanceBind;

    typedef     QuantLib::Date 
                (QuantLib::Calendar::* qlCalendarAdvanceSignature)(
                    const QuantLib::Date&,
                    const QuantLib::Period&,
                    QuantLib::BusinessDayConvention,
                    bool) const;

    // qlCalendarIsEndOfMonth

    typedef     boost::_bi::bind_t<
                bool,
                boost::_mfi::cmf1<
                    bool,
                    QuantLib::Calendar,
                    const QuantLib::Date&>,
                boost::_bi::list2<
                    boost::_bi::value<QuantLib::Calendar >,
                    boost::arg<1> > >
                qlCalendarIsEndOfMonthBind;

    typedef     bool 
                (QuantLib::Calendar::* qlCalendarIsEndOfMonthSignature)(
                    const QuantLib::Date&) const;

    // qlCalendarEndOfMonth

    typedef     boost::_bi::bind_t<
                QuantLib::Date,
                boost::_mfi::cmf1<
                    QuantLib::Date,
                    QuantLib::Calendar,
                    const QuantLib::Date&>,
                boost::_bi::list2<
                    boost::_bi::value<QuantLib::Calendar >,
                    boost::arg<1> > >
                qlCalendarEndOfMonthBind;

    typedef     QuantLib::Date 
                (QuantLib::Calendar::* qlCalendarEndOfMonthSignature)(
                    const QuantLib::Date&) const;

    // qlDayCounterYearFraction

    typedef     boost::_bi::bind_t<
                double,
                boost::_mfi::cmf4<
                    double,
                    QuantLib::DayCounter,
                    const QuantLib::Date&,
                    const QuantLib::Date&,
                    const QuantLib::Date&,
                    const QuantLib::Date&>,
                boost::_bi::list5<
                    boost::_bi::value<QuantLib::DayCounter >,
                    boost::_bi::value<QuantLib::Date>,
                    boost::arg<1>,
                    boost::_bi::value<QuantLib::Date>,
                    boost::_bi::value<QuantLib::Date> > >
                qlDayCounterYearFractionBind;

    typedef     double 
                (QuantLib::DayCounter::* qlDayCounterYearFractionSignature)(
                    const QuantLib::Date&,
                    const QuantLib::Date&,
                    const QuantLib::Date&,
                    const QuantLib::Date&) const;
}

#endif

