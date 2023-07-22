// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// check_ISO8601_durations_cpp
LogicalVector check_ISO8601_durations_cpp(StringVector putative_duration_strings);
RcppExport SEXP _reval_check_ISO8601_durations_cpp(SEXP putative_duration_stringsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< StringVector >::type putative_duration_strings(putative_duration_stringsSEXP);
    rcpp_result_gen = Rcpp::wrap(check_ISO8601_durations_cpp(putative_duration_strings));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_reval_check_ISO8601_durations_cpp", (DL_FUNC) &_reval_check_ISO8601_durations_cpp, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_reval(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
