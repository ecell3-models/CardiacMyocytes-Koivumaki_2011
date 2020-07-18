@{
from math import exp, log, pi

N_A = 6.02214076e+23

R  = 8314.0  # R in component membrane (millijoule_per_mole_kelvin)
T  = 306.15  # T in component membrane (kelvin)
F  = 96487   # F in component membrane (coulomb_per_mole)

Nao = 130
Cao = 1.8
Ko = 5.4

Cm = 0.05 #nF

stim_duration = 6.0e-3 # sec
stim_amp = -1000.0      # pA
BCL = 1.0              # sec
stim_steepness = 5.0
stim_offset = 1.0e-2   # sec

# Geometry
Vss    = 4.99232e-5  # volume of the subspace (nanolitre) (Table 1)
rjunct = 6.5         # radius of the bulk cytosol (micrometer) (Table 1)
lcell  = 122.051     # length of the cell (micrometer) (Table 1)

# Ca diffusion grid
dx = 1.625  # width of bulk cytosol compartment (micrometer) (Table 1)

'''
Area between junct and nonjunct (Text S1, Eqn. 16)(micrometer**2) '''
Aj_nj = pi * rjunct * 2 * lcell * 0.5
'''
diffusion distance from center to center of junct to first njunct
(Text S1, Eqn. 17)(micrometer) '''
xj_nj = 0.02/2 + dx/2
'''
diffusion distance from center of junct to center of njunct
(between 2nd and 3rd njunct)(micrometer) '''
xj_nj_Nai = 0.02/2 + 2*dx

# Diffusion compartment volumes (uses j^2-(j-1)^2 = 2*j - 1) (Text S1, Eqn. 42)
# (nL)
Vnonjunct1 = pi * lcell * 1e-6 * 0.5 * dx * dx
Vnonjunct2 = 3 * Vnonjunct1
Vnonjunct3 = 5 * Vnonjunct1
Vnonjunct4 = 7 * Vnonjunct1

Vcytosol = [ Vss, Vnonjunct1, Vnonjunct2, Vnonjunct3, Vnonjunct4]

# Vcytosol = 16 * Vnonjunct1 + Vss

VSR1 = 0.05*Vnonjunct1/2*0.9  # Accessible volume of SR compartment (Text S1, Eqn. 42)
VSR2 = 0.05*Vnonjunct2/2*0.9
VSR3 = 0.05*Vnonjunct3/2*0.9
VSR4 = 0.05*Vnonjunct4/2*0.9

VSR = [ 0, VSR1, VSR2, VSR3, VSR4]

# Vnonjunct_Nai = 16 * Vnonjunct1
Vnonjunct_Nai = sum( Vcytosol )


# Cytosol Ca Buffers
BCa = 24e-3
SLlow = 165
SLhigh = 13

KdBCa = 2.38e-3
KdSLlow = 1.1
KdSLhigh = 13e-3

# SR Ca buffers
CSQN =  6.7
KdCSQN = 0.8

# Sarcolemmal Na burrering
# Area relation to Grandi et al. model 6.5**2 * pi() * 122 / (10.25**2 * pi() * 100) = 0.49
# Bmax = 7.651*0.11 + 1.65*0.89 = 2.31
BNa = 0.49 * 2.31
KdBNa = 10

# Ion channel conductances & permeabilities & other parameters

PNa = 0.0018  # INa:P_Na

ECa_app = 60    # ICaL:ECa_app
gCaL = 25.3125  # ICaL:ECa_app
kCan = 2
kCa = 1e-3      # ICaL:k_Ca


#gt = 7.5
gt = 1.09*7.5      # It:g_t     Increased by ~9# in Maleckar et al.
#gsus = 2.75
gsus = 0.89*2.75   # Isus:g_sus Decreased by ~11# in Maleckar et al.
gKs = 1            # IKs:g_Ks
gKr = 0.5          # IKr:g_Kr
#gK1 = 3.825
gK1 = 3.825 * 0.90 # IK1:g_K1   3 in Nygren et al. 9 in Courtemanche et al.
gNab = 0.060599    # INab:g_B_Na
gCab = 0.0952      # ICab:g_B_Ca

INaKmax = 70.8253  # INaK:i_NaK_max
kNaKK = 1          # INaK:k_NaK_K
kNaKNa = 11        # INaK:k_NaK_Na

ICaPmax = 2.0      # ICaP:i_CaP_max
kCaP = 0.0005      # ICaP:k_CaP

kNaCa = 0.0084     # INaCa:k_NaCa
gam = 0.45         # INaCa:gamma
dNaCa = 0.0003     # INaCa:d_NaCa

gIf = 1            # If:gIf

# Ca and Na diffusion
DCa = 780.0  # diffusion coefficient for Ca2+ (micrometer**2/sec)
DCaSR = 44.0 # diffusion coefficient for Ca2+ in SR (micrometer**2/sec)
DCaBm = 25.0 # diffusion coefficient for Ca2+-buffer complex (micrometer**2/sec)

#DNa = 0.17 # Despa et al. (2002) 0.12 um2/s, Shannon et al. (2004)
#1.79E-5 cm2/s = 1790 um2/s, Grandi et al. (2009) 1.2722E-6 cm2/s = 127um/s
DNa = 0.12

# SERCA parameters
SERCAKmf = 0.25e-3  # SERCA half-maximal binding in cytosol (mM, Table S1)
SERCAKmr = 1.8  # SERCA half-maximal binding in SR (mM, Table S1)
k4 = 7.5  # pump rate (sec^-1, Table S1)

k3 = k4 / SERCAKmr**2
k1 = 1000**2 * k4
k2 = k1 * SERCAKmf**2

cpumps = 40e-3 # pump concentration in cytosol volume (mM, Table S1)

# SR Ca leak
kSRleak = 6e-3

# RyR
k_nu = 1.0
k_nuss = 625.0

RyRtauadapt = 1

RyRtauactss = 5e-3
RyRtauinactss = 15e-3

RyRtauact = 18.75e-3
RyRtauinact = 87.5e-3

### status
V_0 = -75.319410
INam_0 = 0.002779
INah1_0 = 0.903910
INah2_0 = 0.903967
ICaLd_0 = 0.000011
ICaLf1_0 = 0.998857
ICaLf2_0 = 0.998862
ICaLfca_0 = 0.974437
Itr_0 = 0.000959
Its_0 = 0.954338
Isusr_0 = 0.000311
Isuss_0 = 0.975109
IKsn_0 = 0.004110
IKrpa_0 = 0.000042
Ify_0 = 0.056207
Nai_0 = 9.286860
Ki_0 = 134.631300
Nass_0 = 8.691502
Cass_0 = 0.000162
Cai_0 = [ Cass_0, 0.000135, 0.000138, 0.000144, 0.000156 ]
RyRoss_0 = 0.000040
RyRcss_0 = 0.999972
RyRass_0 = 0.245530
RyRo_0 = [ RyRoss_0, 0.000095, 0.000078, 0.000057 ]
RyRc_0 = [ RyRcss_0, 0.999372, 0.999509, 0.999560 ]
RyRa_0 = [ RyRass_0, 0.192536, 0.201034, 0.216312 ]
SERCACass_0 = 0.004250
SERCACa_0 = [ SERCACass_0, 0.004639, 0.004512, 0.004326, 0.004250 ]
CaCytosol_0 = [ Cass_0, 0.000135, 0.000138, 0.000144, 0.000156 ]
CaSR_0 = [ 0, 0.618922, 0.607629, 0.590527, 0.573811 ]

ENa_0 = R*T/F * log ( Nao / Nass_0 )
EK_0 = R*T/F * log ( Ko / Ki_0 )
ECa_0 = R*T/F/2 * log ( Cao / Cass_0 )

# INa
INa_0 = PNa * INam_0**3 * ( 0.9*INah1_0 + 0.1*INah2_0) * Nao * V_0 * F**2/(R*T) * ( exp( (V_0-ENa_0)*F/R/T ) - 1) / ( exp( V_0*F/R/T ) - 1)
INaminf_0 = 1/(1+exp((V_0+27.12)/-8.21))
INahinf_0 = 1/(1+exp((V_0+63.6)/5.3))
INamtau_0 = 0.000042*exp( -((V_0+25.57)/28.8)**2 ) + 0.000024
INah1tau_0 = 0.03/(1+exp((V_0+35.1)/3.2)) + 0.0003
INah2tau_0 = 0.12/(1+exp((V_0+35.1)/3.2)) + 0.003

# ICaL
ICaLfcainf_0 = 1-1 / ( 1 + (kCa/Cass_0)**(kCan))
ICaL_0 = gCaL *(ICaLd_0) * (ICaLfca_0)*(ICaLf1_0)* (ICaLf2_0) * (V_0 - ECa_app)
ICaLdinf_0 = 1/(1+exp((V_0+9)/-5.8))
ICaLfinf_0 = 1/(1+exp((V_0+27.4)/7.1))
ICaLdtau_0 = 0.0027*exp( -((V_0+35)/30)**2 ) + 0.002
ICaLf1tau_0 = 0.98698*exp( -((V_0+30.16047)/7.09396)**2 ) + 0.04275/(1+exp((V_0-51.61555)/-80.61331)) + 0.03576/(1+exp((V_0+29.57272)/13.21758)) - 0.00821
ICaLf2tau_0 = 1.3323*exp( -((V_0+40)/14.2)**2 ) + 0.0626
ICaLfcatau_0 = 2e-3

# It
It_0 = gt * (Itr_0) * (Its_0) * (V_0 - EK_0)
Itrinf_0 = 1.0/(1.0+exp((V_0-1.0)/-11.0))
Itsinf_0 = 1.0/(1.0+exp((V_0+40.5)/11.5))
Itrtau_0 = 0.0035*exp( -((V_0+0)/30.0)**2.0 ) + 0.0015
#Itstau_0 = 0.4812*exp( -((V_0+52.45)/14.97)**2.0 ) + 0.01414
Itstau_0 = 0.025635*exp( -((V_0+52.45)/15.8827)**2.0 ) + 0.01414 # Maleckar et al.

# Isus
Isus_0 = gsus * (Isusr_0) * (Isuss_0) * (V_0 - EK_0)
Isusrinf_0 = 1.0/(1.0 + exp((V_0 + 6)/-8.6)) # Maleckar et al.
Isussinf_0 = 1.0/(1.0 + exp((V_0 + 7.5)/10.0)) # Maleckar et al.
Isusrtau_0 = 0.009/(1.0 + exp((V_0 + 5)/12.0)) + 0.0005 # Maleckar et al.
Isusstau_0 = 0.59/(1.0 + exp((V_0 + 60.0)/10.0)) + 3.05 # Maleckar et al.

# IKs
IKs_0 = gKs * (IKsn_0) * (V_0 - EK_0)
IKsninf_0 = 1.0/(1.0+exp((V_0-19.9)/-12.7))
IKsntau_0 = 0.4*exp( -((V_0-20.0)/20.0)**2.0 ) + 0.7

# IKr
IKrpi_0 = 1.0/(1.0+exp((V_0+55.0)/24.0))
IKr_0 = gKr * (IKrpa_0) * IKrpi_0 * (V_0 - EK_0)
IKrpainf_0 = 1.0/(1.0+exp((V_0+15.0)/-6.0))
IKrpatau_0 = 0.21718*exp( -((V_0+20.1376)/22.1996)**2.0 ) + 0.03118

# IK1
IK1_0 = gK1 * Ko**0.4457 * (V_0 - EK_0) / (1.0+exp(1.5*(V_0-EK_0+3.6)*F/R/T))

# Background leaks
INab_0 = gNab * (V_0 - ENa_0)
ICab_0 = gCab * (V_0 - ECa_0)

# INaK
INaK_0 = INaKmax * Ko/(Ko + kNaKK) * Nass_0**1.5/(Nass_0**1.5+kNaKNa**1.5) * (V_0 + 150.0) / (V_0 + 200.0)

# INaCa
fCaNCX = 1.0
INaCa_0 = kNaCa * ( (exp( gam*V_0*F/R/T ) * Nass_0**3.0 * Cao - exp( (gam-1.0)*V_0*F/R/T ) * Nao**3.0 * Cass_0*fCaNCX ) / ( 1.0 + dNaCa*(Nao**3.0 * Cass_0*fCaNCX + Nass_0**3.0 * Cao) ) )

# ICaP
ICaP_0 = ICaPmax * Cass_0 / (kCaP + Cass_0)

# If, Zorn-Pauly LAW fit
Ifyinf_0 = 1.0 / (1.0 + exp((V_0+97.82874)/12.48025))
Ifytau_0 = 1.0 / (0.00332*exp(-V_0/16.54103)+23.71839*exp(V_0/16.54103))
IfNa_0 = gIf * (Ify_0)*((0.2677)*(V_0-ENa_0))
IfK_0 = gIf * (Ify_0)*((1.0-0.2677)*(V_0-EK_0))
If_0 = IfK_0 + IfNa_0

# SERCA fluxes

J_SERCASRss_0 = (-k3*CaSR_0[4]**2*(cpumps-SERCACass_0)+k4*SERCACass_0)*Vss*2.0
J_bulkSERCAss_0 = (k1*Cass_0**2.0*(cpumps-SERCACass_0)-k2*SERCACass_0)*Vss*2.0

J_SERCASR_0 = [J_SERCASRss_0, 0.0, 0.0, 0.0]
J_bulkSERCA_0 = [J_bulkSERCAss_0, 0.0, 0.0, 0.0]
for x in [1, 2, 3]:
  J_SERCASR_0[x] = (-k3*CaSR_0[x]**2.0*(cpumps-SERCACa_0[x])+k4*SERCACa_0[x])*Vcytosol[x]*2.0
  J_bulkSERCA_0[x] = (k1*CaCytosol_0[x]**2.0*(cpumps-SERCACa_0[x])-k2*SERCACa_0[x])*Vcytosol[x]*2.0

# RyR

RyRSRCass_0 = (1.0 - 1.0/(1.0 +  exp((CaSR_0[4]-0.3)/0.1)))
RyRainfss_0 = 0.505-0.427/(1.0 + exp((Cass_0*1000.0-0.29)/0.082))
RyRoinfss_0 = (1.0 - 1.0/(1.0 +  exp((Cass_0*1000.0-((RyRass_0) + 0.22))/0.03)))
RyRcinfss_0 = (1.0/(1.0 + exp((Cass_0*1000.0-((RyRass_0)+0.02))/0.01)))
Jrelss_0 = k_nuss * Vss * ( (RyRoss_0) ) * (RyRcss_0) * RyRSRCass_0 * ( CaSR_0[4] -  Cass_0 )

RyRSRCa_0 = [RyRSRCass_0, 0.0, 0.0, 0.0]
RyRainf_0 = [RyRainfss_0, 0.0, 0.0, 0.0]
RyRoinf_0 = [RyRoinfss_0, 0.0, 0.0, 0.0]
RyRcinf_0 = [RyRcinfss_0, 0.0, 0.0, 0.0]
for x in [1, 2, 3]:
  RyRSRCa_0[x] = (1.0 - 1.0/(1.0 +  exp((CaSR_0[x]-0.3)/0.1)))
  RyRainf_0[x] = 0.505-0.427/(1.0 + exp((CaCytosol_0[x]*1000.0-0.29)/0.082))
  RyRoinf_0[x] = (1.0 - 1.0/(1.0 +  exp(( CaCytosol_0[x]*1000.0-(RyRa_0[x] + 0.22))/0.03)))
  RyRcinf_0[x] = (1.0/(1.0 +  exp(( CaCytosol_0[x]*1000.0-(RyRa_0[x]+0.02))/0.01)))

Jrel_0 = [Jrelss_0, 0.0, 0.0, 0.0]
for x in [1, 2, 3]:
  Jrel_0[x] = k_nu * Vcytosol[x] * ( RyRo_0[x] ) * RyRc_0[x] * RyRSRCa_0[x] * ( CaSR_0[x] -  CaCytosol_0[x] )

# SR leak fluxes
JSRCaleakss = kSRleak * ( CaSR_0[4] - Cass_0 ) * Vss
JSRCaleak_0 = [JSRCaleakss, 0.0, 0.0, 0.0]
for x in [1, 2, 3]:
  JSRCaleak_0[x] = kSRleak * ( CaSR_0[x] - Cai_0[x] ) * Vcytosol[x]

# Naflux in 1 nl volume
JNa_0 = DNa * Aj_nj / xj_nj_Nai * (Nass_0 - Nai_0)* 1e-6

}


Stepper FixedODE1Stepper( Default ){ StepInterval 1.0e-5; }

Stepper PassiveStepper( PSV ) {}

System System( / )
{
  StepperID    Default;

  Variable Variable( SIZE )
  {
      Value    1.0;
  }

  Variable Variable(t)
  {
    Name "time in component environment (second)";
    Value  0.0;
  }

  Variable Variable( Nao )
  {
    MolarConc    @(Nao * 1.0e-3);
    Fixed  1;
  }

  Variable Variable( Ko )
  {
    MolarConc    @(Ko * 1.0e-3);
    Fixed  1;
  }

  Variable Variable( Cao )
  {
    MolarConc    @(Cao * 1.0e-3);
    Fixed  1;
  }

  Process Nygren_1998voiFluxProcess(t)
  {
    Name "time in component environment (second)";

    VariableReferenceList
      [voi :.:t  1];
  }
}

System System( /Cell )
{
  StepperID    Default;
  Name "Cell";

  Variable Variable( SIZE )
  {
    Value    @((sum( Vcytosol ) + sum( VSR ))*1.0E-9);
  }
}

System System( /Cell/Cytosol )
{
  StepperID    Default;
  Name "Cell";

  Variable Variable( SIZE )
  {
    Value    @(sum( Vcytosol ) * 1.0e-9);
  }

  Variable Variable(K_i)
  {
    Name "K_i in component intracellular_ion_concentrations (molar)";
    MolarConc  134.631300e-3;  # hAM_KKT.ode Ki
  }

} # END of /Cell/Cytosol

System System( /Cell/Cytosol/bulk )
{
  StepperID    Default;
  Name "Cell";

  Variable Variable( SIZE )
  {
    Value    @( sum(Vcytosol) * 1.0e-9);
  }

  Variable Variable(Na_i)
  {
    Name "Na_i in component intracellular_ion_concentrations (molar)";
    MolarConc  9.286860e-3;    # hAM_KKT.ode Nai
  }

  Process Koivumaki_2011_DiffusionJNjFluxProcess(JNa_assign)
  {
    Name "Na diffusion from junct to non-junct";
    @{'''
    #  Diffusion from junct to non-junct    (pmol/sec)
    JNa = DNa * Aj_nj / xj_nj_Nai * (Nass - Nai)* 1e-3
    '''}

    D  @DNa;
    Aj_nj  @Aj_nj;
    xj_nj  @xj_nj_Nai;

    VariableReferenceList
      [nj    :.:Na_i    0]
      [j     :../ss:Na  0];
  }

} # END of /Cell/Cytosol/bulk


# /Cell/Membrane
@{
DEBUG_WITHOUT_PROCESS = 0
DEBUG_WITHOUT_INa   = 0
DEBUG_WITHOUT_ICaL  = 0
DEBUG_WITHOUT_It    = 0
DEBUG_WITHOUT_Isus  = 0
DEBUG_WITHOUT_IKs   = 0
DEBUG_WITHOUT_IKr   = 0
DEBUG_WITHOUT_If    = 0
DEBUG_WITHOUT_ICab  = 0
DEBUG_WITHOUT_J_mem = 0
}
@include('./Koivumaki-2011_Cell_Membrane.em')

# /Cell/Cytoplasm/{ss||bulk_x}
@{DEBUG_WITHOUT_PROCESS = 0}
@{x = 0}
@[while x <= 4]
@{
if x == 0:
  c = 'ss'
else:
  c = x
}
@include('./Koivumaki-2011_Cell_Cytoplasm_bulk_x.em')
@{x += 1}
@[end while]

# /Cell/SR_x
@{DEBUG_WITHOUT_PROCESS = 0}
@{x = 1}
@[while x <= 4]
@include('./Koivumaki-2011_Cell_SR_x.em')
@{x += 1}
@[end while]
