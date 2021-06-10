#include "libecs.hpp"
#include "Process.hpp"

#include <gsl/gsl_errno.h>
#include <gsl/gsl_math.h>

USE_LIBECS;

LIBECS_DM_CLASS( Nygren_1998i_NaCaAssignmentProcess, Process )
{

 public:

  LIBECS_DM_OBJECT( Nygren_1998i_NaCaAssignmentProcess, Process )
  {
    INHERIT_PROPERTIES( Process );

    PROPERTYSLOT_SET_GET( Real, F );
    PROPERTYSLOT_SET_GET( Real, d_NaCa );
    PROPERTYSLOT_SET_GET( Real, R );
    PROPERTYSLOT_SET_GET( Real, T );
    PROPERTYSLOT_SET_GET( Real, k_NaCa );
    PROPERTYSLOT_SET_GET( Real, gamma );

  }

  Nygren_1998i_NaCaAssignmentProcess()
  {
    // do nothing
  }

  SIMPLE_SET_GET_METHOD( Real, F );
  SIMPLE_SET_GET_METHOD( Real, d_NaCa );
  SIMPLE_SET_GET_METHOD( Real, R );
  SIMPLE_SET_GET_METHOD( Real, T );
  SIMPLE_SET_GET_METHOD( Real, k_NaCa );
  SIMPLE_SET_GET_METHOD( Real, gamma );


  virtual void initialize()
  {
    Process::initialize();

    i_NaCa  = getVariableReference( "i_NaCa" ).getVariable();
    Na_i  = getVariableReference( "Na_i" ).getVariable();
    Ca_c  = getVariableReference( "Ca_c" ).getVariable();
    V  = getVariableReference( "V" ).getVariable();
    Na_c  = getVariableReference( "Na_c" ).getVariable();
    Ca_i  = getVariableReference( "Ca_i" ).getVariable();

    _gF_RT = gamma * F / R / T;
    _g_1F_RT = ( gamma - 1.0 ) * F / R / T;
  }

  virtual void fire()
  {
    // INaCa = kNaCa * ( (exp( gam.*y(i_V)*F/R/T ) .* Nass.^3 .* Cao - exp( (gam-1).*y(i_V)*F/R/T ) .* Nao^3 .* y(i_Cass)*fCaNCX ) / ( 1 + dNaCa*(Nao^3 .* y(i_Cass)*fCaNCX + Nass.^3 .* Cao) ) );

    _V = V->getValue();
    _Na_i_mM_3 = gsl_pow_3( Na_i->getMolarConc() * 1000.0 );
    _Na_c_mM_3 = gsl_pow_3( Na_c->getMolarConc() * 1000.0 );
    _Ca_i_mM = Ca_i->getMolarConc() * 1000.0;
    _Ca_c_mM = Ca_c->getMolarConc() * 1000.0;

    i_NaCa->setValue(
      k_NaCa * ( _Na_i_mM_3 * _Ca_c_mM * exp( _gF_RT * _V )
      - _Na_c_mM_3 * _Ca_i_mM * exp( _g_1F_RT * _V ))
      / ( 1.0 + d_NaCa * ( _Na_c_mM_3 * _Ca_i_mM + _Na_i_mM_3 * _Ca_c_mM ))
    );
  }

 protected:

  Variable* i_NaCa;
  Variable* Na_i;
  Variable* Ca_c;
  Variable* V;
  Variable* Na_c;
  Variable* Ca_i;

  Real F;
  Real d_NaCa;
  Real R;
  Real T;
  Real k_NaCa;
  Real gamma;

  Real _gF_RT;
  Real _g_1F_RT;
  Real _V;
  Real _Na_i_mM_3;
  Real _Na_c_mM_3;
  Real _Ca_i_mM;
  Real _Ca_c_mM;
};

LIBECS_DM_INIT( Nygren_1998i_NaCaAssignmentProcess, Process );
