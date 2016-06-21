
// These are types which require specific typemaps to be defined.  Tell the
// reposit SWIG module to treat these types as strings, that causes some of the
// necessary typemaps to be generated, the rest are defined in this project.
%apply rp_tp_string { QuantLib::Period & };
%apply rp_tp_string { QuantLib::Schedule & };
%apply rp_tp_string { QuantLib::OptimizationMethod & };
%apply rp_tp_string { QuantLib::EndCriteria & };
%apply rp_tp_string { QuantLib::Leg & };

// Enumerated types.
ENUMERATED_TYPE(QuantLib::Currency)
ENUMERATED_TYPE(QuantLib::Compounding)
ENUMERATED_TYPE(QuantLib::Option::Type)
ENUMERATED_TYPE(QuantLib::Frequency)
ENUMERATED_TYPE(QuantLib::BusinessDayConvention)
ENUMERATED_TYPE(QuantLib::Futures::Type)
ENUMERATED_TYPE(QuantLibAddin::RateHelper::DepoInclusionCriteria)
ENUMERATED_TYPE(QuantLib::DateGeneration::Rule)
ENUMERATED_TYPE(QuantLibAddin::SwapIndex::FixingType)
ENUMERATED_TYPE(QuantLib::VanillaSwap::Type)
ENUMERATED_TYPE(QuantLib::Pillar::Choice)
ENUMERATED_TYPE(QuantLib::Position::Type)
ENUMERATED_TYPE(QuantLib::Duration::Type)

// Enumerated classes.
ENUMERATED_CLASS(QuantLib::Calendar)
ENUMERATED_CLASS(QuantLib::DayCounter)

// Data types of objects passed as function parameters to be retrieved from the repository
OBJECT_WRAPPER(QuantLibAddin::Index, QuantLib::Index)
OBJECT_WRAPPER(QuantLibAddin::IborIndex, QuantLib::IborIndex)
OBJECT_WRAPPER(QuantLibAddin::SwapIndex, QuantLib::SwapIndex)
OBJECT_WRAPPER(QuantLibAddin::OvernightIndex, QuantLib::OvernightIndex)
OBJECT_WRAPPER(QuantLibAddin::PricingEngine, QuantLib::PricingEngine)
OBJECT_WRAPPER(QuantLibAddin::StrikedTypePayoff, QuantLib::StrikedTypePayoff)
OBJECT_WRAPPER(QuantLibAddin::Exercise, QuantLib::Exercise)
OBJECT_WRAPPER(QuantLibAddin::GeneralizedBlackScholesProcess, QuantLib::GeneralizedBlackScholesProcess)
OBJECT_WRAPPER(QuantLibAddin::Schedule, QuantLib::Schedule)
OBJECT_WRAPPER(QuantLibAddin::OneFactorAffineModel, QuantLib::OneFactorAffineModel)
OBJECT_WRAPPER(QuantLibAddin::ShortRateModel, QuantLib::ShortRateModel)
OBJECT_WRAPPER(QuantLibAddin::G2, QuantLib::G2)
OBJECT_WRAPPER(QuantLibAddin::VanillaSwap, QuantLib::VanillaSwap)
OBJECT_WRAPPER(QuantLibAddin::Instrument, QuantLib::Instrument)
OBJECT_WRAPPER(QuantLibAddin::InterestRateIndex, QuantLib::InterestRateIndex)
OBJECT_WRAPPER(QuantLibAddin::CalibrationHelper, QuantLib::CalibrationHelper)
OBJECT_WRAPPER(QuantLibAddin::SwaptionHelper, QuantLib::SwaptionHelper)
OBJECT_WRAPPER(QuantLibAddin::CalibratedModel, QuantLib::CalibratedModel)
OBJECT_WRAPPER(QuantLibAddin::RateHelper, QuantLib::RateHelper)
OBJECT_WRAPPER(QuantLibAddin::Extrapolator, QuantLib::Extrapolator)
OBJECT_WRAPPER(QuantLibAddin::FloatingRateCouponPricer, QuantLib::FloatingRateCouponPricer)

// QuantLib Handles.
QUANTLIB_HANDLE(QuantLibAddin::FlatForward, QuantLib::YieldTermStructure)
QUANTLIB_HANDLE(QuantLibAddin::BlackConstantVol, QuantLib::BlackVolTermStructure)
QUANTLIB_HANDLE(QuantLibAddin::Quote, QuantLib::Quote)

// Override some of the typemaps that were generated by the macro above.

%typemap(rp_tm_xll_cnvt) QuantLib::Handle<QuantLib::Quote> const & %{
        reposit::property_t $1_name_cnv = reposit::convert2<reposit::property_t>(
            reposit::ConvertOper(*$1_name));
        QuantLib::Handle<QuantLib::Quote> $1_name_handle = 
            reposit::convert2<QuantLib::Handle<QuantLib::Quote> >(
                reposit::ConvertOper(*$1_name), "$1_name");
%}

%typemap(rp_tm_xll_cnvt) QuantLib::Handle<QuantLib::YieldTermStructure> const & %{
        std::string $1_name_vo = reposit::convert2<std::string>(
            reposit::ConvertOper(*$1_name), "$1_name", "");

        RP_GET_OBJECT_DEFAULT($1_nameCoerce, $1_name_vo, reposit::Object)
        QuantLib::Handle<QuantLib::YieldTermStructure> $1_name_handle =
            QuantLibAddin::CoerceHandle<
                QuantLibAddin::YieldTermStructure,
                QuantLib::YieldTermStructure>()(
                    $1_nameCoerce, QuantLib::Handle<QuantLib::YieldTermStructure>());
%}

%typemap(rp_tm_csh_cnvt) QuantLib::Handle<QuantLib::YieldTermStructure> const & %{
        RP_GET_OBJECT_DEFAULT($1_nameCoerce, std::string($1_name), reposit::Object)
        QuantLib::Handle<QuantLib::YieldTermStructure> $1_name_handle =
            QuantLibAddin::CoerceHandle<
                QuantLibAddin::YieldTermStructure,
                QuantLib::YieldTermStructure>()(
                    $1_nameCoerce, QuantLib::Handle<QuantLib::YieldTermStructure>());
%}

%typemap(rp_tm_cfy_cnvt) QuantLib::Handle<QuantLib::YieldTermStructure> const & %{
        RP_GET_OBJECT_DEFAULT($1_name_get, std::string($1_name), reposit::Object)
        QuantLib::Handle<QuantLib::YieldTermStructure> $1_name_handle =
            QuantLibAddin::CoerceHandle<
                QuantLibAddin::YieldTermStructure,
                QuantLib::YieldTermStructure>()(
                    $1_name_get, QuantLib::Handle<QuantLib::YieldTermStructure>());
%}

