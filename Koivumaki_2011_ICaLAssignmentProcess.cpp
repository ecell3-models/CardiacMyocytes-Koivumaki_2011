
#include "libecs.hpp"
#include "Process.hpp"
#include <gsl/gsl_math.h>

USE_LIBECS;

LIBECS_DM_CLASS( Koivumaki_2011_ICaLAssignmentProcess, Process )
{

 public:

  LIBECS_DM_OBJECT( Koivumaki_2011_ICaLAssignmentProcess, Process )
  {
    INHERIT_PROPERTIES( Process );

    PROPERTYSLOT_SET_GET( Real, E_Ca_app );
    PROPERTYSLOT_SET_GET( Real, g_Ca_L );
    PROPERTYSLOT_SET_GET( Real, kCa );
    PROPERTYSLOT_SET_GET( Real, kCan );
    PROPERTYSLOT_SET_GET( Real, h_f1 );
    PROPERTYSLOT_SET_GET( Real, k_finf1 );
    PROPERTYSLOT_SET_GET( Real, k_finf2 );
    PROPERTYSLOT_SET_GET( Real, k_finf3 );
    PROPERTYSLOT_SET_GET( Real, k_finf4 );
    PROPERTYSLOT_SET_GET( Real, k_finf5 );
    PROPERTYSLOT_SET_GET( Real, k_finf6 );
    PROPERTYSLOT_SET_GET( Real, k_finf7 );
    PROPERTYSLOT_SET_GET( Real, k_finf8 );
    PROPERTYSLOT_SET_GET( Real, k_finf9 );
    PROPERTYSLOT_SET_GET( Real, k_dtau1 );
    PROPERTYSLOT_SET_GET( Real, k_dtau2 );
    PROPERTYSLOT_SET_GET( Real, k_dtau3 );
    PROPERTYSLOT_SET_GET( Real, k_dtau4 );
    PROPERTYSLOT_SET_GET( Real, k_f2tau1 );
    PROPERTYSLOT_SET_GET( Real, k_f2tau2 );
    PROPERTYSLOT_SET_GET( Real, k_f2tau3 );
    PROPERTYSLOT_SET_GET( Real, k_f2tau4 );
  }

  Koivumaki_2011_ICaLAssignmentProcess()
    :
    h_f1( 0.0 ),
    k_finf1( 0.04 ),
    k_finf2( 0.96 ),
    k_finf3( 1.0 ),
    k_finf4( 25.5 ),
    k_finf5( 8.4 ),
    k_finf6( 1.0 ),
    k_finf7( 1.0 ),
    k_finf8( 60.0 ),
    k_finf9( 8.0 ),
    k_dtau1( 0.00065 ),
    k_dtau2( 35.0 ),
    k_dtau3( 30.0 ),
    k_dtau4( 0.0005 ),
    k_f2tau1( 1.34 ),
    k_f2tau2( 40.0 ),
    k_f2tau3( 14.2 ),
    k_f2tau4( 0.04 )
  {
    // do nothing
  }

  SIMPLE_SET_GET_METHOD( Real, E_Ca_app );
  SIMPLE_SET_GET_METHOD( Real, g_Ca_L );
  SIMPLE_SET_GET_METHOD( Real, kCa );
  SIMPLE_SET_GET_METHOD( Real, kCan );
  SIMPLE_SET_GET_METHOD( Real, h_f1 );
  SIMPLE_SET_GET_METHOD( Real, k_finf1 );
  SIMPLE_SET_GET_METHOD( Real, k_finf2 );
  SIMPLE_SET_GET_METHOD( Real, k_finf3 );
  SIMPLE_SET_GET_METHOD( Real, k_finf4 );
  SIMPLE_SET_GET_METHOD( Real, k_finf5 );
  SIMPLE_SET_GET_METHOD( Real, k_finf6 );
  SIMPLE_SET_GET_METHOD( Real, k_finf7 );
  SIMPLE_SET_GET_METHOD( Real, k_finf8 );
  SIMPLE_SET_GET_METHOD( Real, k_finf9 );
  SIMPLE_SET_GET_METHOD( Real, k_dtau1 );
  SIMPLE_SET_GET_METHOD( Real, k_dtau2 );
  SIMPLE_SET_GET_METHOD( Real, k_dtau3 );
  SIMPLE_SET_GET_METHOD( Real, k_dtau4 );
  SIMPLE_SET_GET_METHOD( Real, k_f2tau1 );
  SIMPLE_SET_GET_METHOD( Real, k_f2tau2 );
  SIMPLE_SET_GET_METHOD( Real, k_f2tau3 );
  SIMPLE_SET_GET_METHOD( Real, k_f2tau4 );
  virtual void initialize()
  {
    Process::initialize();

    ICaL  = getVariableReference( "ICaL" ).getVariable();
    ICaLd  = getVariableReference( "ICaLd" ).getVariable();
    ICaLfca  = getVariableReference( "ICaLfca" ).getVariable();
    ICaLf1  = getVariableReference( "ICaLf1" ).getVariable();
    ICaLf2  = getVariableReference( "ICaLf2" ).getVariable();
    Ca_ss  = getVariableReference( "Ca_ss" ).getVariable();
    ICaLfcainf  = getVariableReference( "ICaLfcainf" ).getVariable();
    ICaLfcatau  = getVariableReference( "ICaLfcatau" ).getVariable();
    ICaLdinf  = getVariableReference( "ICaLdinf" ).getVariable();
    ICaLdtau  = getVariableReference( "ICaLdtau" ).getVariable();
    ICaLfinf  = getVariableReference( "ICaLfinf" ).getVariable();
    ICaLf1tau  = getVariableReference( "ICaLf1tau" ).getVariable();
    ICaLf2tau  = getVariableReference( "ICaLf2tau" ).getVariable();
    V  = getVariableReference( "V" ).getVariable();
  }

  virtual void fire()
  {
    v = V->getValue();
    // ICaLfcainf = 1-1 / ( 1 + (kCa/Cass)**(kCan))
    ICaLfcainf->setValue( 1.0 - 1.0 / ( 1.0 + pow( kCa /( Ca_ss->getMolarConc() * 1000.0 ), kCan)) );
    // hAM_KKT.ode      ICaL = gCaL *(ICaLd) * (ICaLfca) * (ICaLf1) * (ICaLf2) * (V - ECa_app)
    // hAM_KSMT_cAF.ode ICaL = gCaL *(ICaLd) * (ICaLfca)            * (ICaLf2) * (V - ECa_app)
    // hAM_KSMT_nSR.ode ICaL = gCaL *(ICaLd) * (ICaLfca)            * (ICaLf2) * (V - ECa_app)
    ICaL->setValue( g_Ca_L * ICaLd->getValue() * ICaLfca->getValue() * pow( ICaLf1->getValue(), h_f1 ) * ICaLf2->getValue() * ( v - E_Ca_app ));
    // ICaLdinf = 1/(1+exp((V+9)/-5.8))
    ICaLdinf->setValue( 1.0 /( 1.0 + exp(( v + 9.0 )/ -5.8 )));
    /*
                                k1     k2      k3           k4    k5      k6   k7            k8  k9
    hAM_KKT.ode      ICaLfinf = 0.00 + 1.00 / (1 + exp((V + 27.4)/7.1)) + 0 / (1 + exp(-(V - 0.)/1.0e10))
    hAM_KSMT_cAF.ode ICaLfinf = 0.04 + 0.96 / (1 + exp((V + 25.5)/8.4)) + 1 / (1 + exp(-(V - 60)/8.0))
    hAM_KSMT_nSR.ode ICaLfinf = 0.04 + 0.96 / (1 + exp((V + 25.5)/8.4)) + 1 / (1 + exp(-(V - 60)/8.0))
    */
    ICaLfinf->setValue( k_finf1 + k_finf2 / (k_finf3 + exp(( v + k_finf4)/k_finf5)) + k_finf6 / (k_finf7 + exp(-(v - k_finf8)/k_finf9)));
    /*
                                k1                 k2  k3         k4
    hAM_KKT.ode      ICaLdtau = 0.0027 * exp( -((V+35)/30)**2 ) + 0.002
    hAM_KSMT_cAF.ode ICaLdtau = 0.00065* exp( -((V+35)/30)**2 ) + 0.0005
    hAM_KSMT_nSR.ode ICaLdtau = 0.00065* exp( -((V+35)/30)**2 ) + 0.0005
    */
    ICaLdtau->setValue( k_dtau1 * exp( -gsl_pow_2(( v + k_dtau2 )/ k_dtau3 )) + k_dtau4 );
    // ICaLf1tau = 0.98698*exp( -((V+30.16047)/7.09396)**2 ) + 0.04275/(1+exp((V-51.61555)/-80.61331)) + 0.03576/(1+exp((V+29.57272)/13.21758)) - 0.00821
    ICaLf1tau->setValue( 0.98698 * exp( -gsl_pow_2(( v + 30.16047 )/ 7.09396 ) ) + 0.04275/( 1.0 + exp(( v - 51.61555 )/ -80.61331 )) + 0.03576 /( 1.0 + exp(( v + 29.57272 )/ 13.21758 )) - 0.00821 );
    /*
                                 k1               k2  k3           k4
    hAM_KKT.ode      ICaLf2tau = 1.3323*exp( -((V+40)/14.2)**2 ) + 0.0626
    hAM_KSMT_cAF.ode ICaLf2tau = 1.34  *exp( -((V+40)/14.2)**2 ) + 0.04
    hAM_KSMT_nSR.ode ICaLf2tau = 1.34  *exp( -((V+40)/14.2)**2 ) + 0.04
    */
    ICaLf2tau->setValue( k_f2tau1 * exp( -gsl_pow_2(( v + k_f2tau2 )/ k_f2tau3 )) + k_f2tau4 );
    // ICaLfcatau = 2e-3
    ICaLfcatau->setValue( 2.0e-3 );
  }

 protected:

  Variable* ICaL;
  Variable* ICaLd;
  Variable* ICaLfca;
  Variable* ICaLf1;
  Variable* ICaLf2;
  Variable* Ca_ss;
  Variable* ICaLfcainf;
  Variable* ICaLfcatau;
  Variable* ICaLdinf;
  Variable* ICaLdtau;
  Variable* ICaLfinf;
  Variable* ICaLf1tau;
  Variable* ICaLf2tau;
  Variable* V;

  Real E_Ca_app;
  Real g_Ca_L;
  Real kCa;
  Real kCan;
  Real h_f1;

  Real k_finf1;
  Real k_finf2;
  Real k_finf3;
  Real k_finf4;
  Real k_finf5;
  Real k_finf6;
  Real k_finf7;
  Real k_finf8;
  Real k_finf9;

  Real k_dtau1;
  Real k_dtau2;
  Real k_dtau3;
  Real k_dtau4;

  Real k_f2tau1;
  Real k_f2tau2;
  Real k_f2tau3;
  Real k_f2tau4;

  Real v;
};

LIBECS_DM_INIT( Koivumaki_2011_ICaLAssignmentProcess, Process );
