%line 1 Koivumaki-2011_cAF.em



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
    MolarConc    0.13;
%line 388 Koivumaki-2011_cAF.em
    Fixed  1;
  }

  Variable Variable( Ko )
  {
    MolarConc    0.0054;
%line 394 Koivumaki-2011_cAF.em
    Fixed  1;
  }

  Variable Variable( Cao )
  {
    MolarConc    0.0018;
%line 400 Koivumaki-2011_cAF.em
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
    Value    1.30918156458e-11;
%line 420 Koivumaki-2011_cAF.em
  }
}

System System( /Cell/Cytosol )
{
  StepperID    Default;
  Name "Cell";

  Variable Variable( SIZE )
  {
    Value    1.29095644231e-11;
%line 431 Koivumaki-2011_cAF.em
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
    Value    1.29095644231e-11;
%line 449 Koivumaki-2011_cAF.em
  }

  Variable Variable(Na_i)
  {
    Name "Na_i in component intracellular_ion_concentrations (molar)";
    MolarConc  9.286860e-3;    # hAM_KKT.ode Nai
  }

  Process Koivumaki_2011_DiffusionJNjFluxProcess(JNa_assign)
  {
    Name "Na diffusion from junct to non-junct";
    

    D  0.12;
%line 466 Koivumaki-2011_cAF.em
    Aj_nj  3289.86822419;
%line 467 Koivumaki-2011_cAF.em
    xj_nj  3.912;
%line 468 Koivumaki-2011_cAF.em

    VariableReferenceList
      [nj    :.:Na_i    0]
      [j     :../ss:Na  0];
  }

} # END of /Cell/Cytosol/bulk


# /Cell/Membrane
System System( /Cell/Membrane )
{
  StepperID    Default;
  Name "Cell membrane";

  Variable Variable( SIZE )
  {
    Value    7.90783488e-05; # dummy
%line 9 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(V)
  {
    Name "V in component membrane (millivolt)";
    Value  -78.48;
%line 15 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ENa)
  {
    Name "ENa in component sodium_current (millivolt)";
    Value  70.4634120549;
%line 21 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(EK)
  {
    Name "EK in component Ca_independent_transient_outward_K_current (millivolt)";
    Value  -85.532087784;
%line 27 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ECa)
  {
    Name "ECa in component background_currents (millivolt)";
    Value  124.300233488;
%line 33 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ist)
  {
    Name "ist in component membrane (picoA)";
    Value  0.0;
  }

  # INa

  Variable Variable(INa)
  {
    Name "INa in component sodium_current (picoA)";
    Value  -0.00046796177874;
%line 47 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INam)
  {
    Name "INam in component sodium_current_m_gate (dimensionless)";
    Value  0.001916;
%line 53 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INah1)
  {
    Name "INah1 in component sodium_current_h1_gate (dimensionless)";
    Value  0.9434;
%line 59 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INah2)
  {
    Name "INah2 in component sodium_current_h2_gate (dimensionless)";
    Value  0.9421;
%line 65 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INaminf)
  {
    Name "INaminf in component sodium_current_m_gate (dimensionless)";
    Value  0.00191564077255;
%line 71 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INahinf)
  {
    Name "INahinf in component sodium_current_h1_gate (dimensionless)";
    Value  0.943082298988;
%line 77 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INamtau)
  {
    Name "INamtau in component sodium_current_m_gate (second)";
    Value  2.54369736777e-05;
%line 83 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INah1tau)
  {
    Name "INah1tau in component sodium_current_h1_gate (second)";
    Value  0.0302999611209;
%line 89 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(INah2tau)
  {
    Name "INah2tau in component sodium_current_h2_gate (second)";
    Value  0.122999844484;
%line 95 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # ICaL

  Variable Variable(ICaLfcainf)
  {
    Value  0.944531941919; # ICaLfcainf
%line 102 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaL)
  {
    Name "ICaL in component L_type_Ca_channel (picoA)";
    Value  -0.00503652801144;
%line 108 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLdinf)
  {
    Name "ICaLdinf in component L_type_Ca_channel_d_L_gate (dimensionless)";
    Value  6.27261881005e-06;
%line 114 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLfinf)
  {
    Name "ICaLfinf in component L_type_Ca_channel_f_L1_gate (dimensionless)";
    Value  0.998252910129;
%line 120 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLdtau)
  {
    Name "ICaLdtau in component L_type_Ca_channel_d_L_gate (second)";
    Value  0.000579551551001;
%line 126 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLf1tau)
  {
    Name "ICaLf1tau in component L_type_Ca_channel_f_L1_gate (second)";
    Value  0.0337863662797;
%line 132 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLf2tau)
  {
    Name "ICaLf2tau in component L_type_Ca_channel_f_L2_gate (second)";
    Value  0.0408668305663;
%line 138 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLfcatau)
  {
    Value  0.002;
%line 143 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLd)
  {
    Name "ICaLd in component L_type_Ca_channel_d_L_gate (dimensionless)";
    Value  6.272e-06;
%line 149 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLf1)
  {
    Name "ICaLf1 in component L_type_Ca_channel_f_L1_gate (dimensionless)";
    Value  0.9983;
%line 155 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLf2)
  {
    Name "ICaLf2 in component L_type_Ca_channel_f_L2_gate (dimensionless)";
    Value  0.9983;
%line 161 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICaLfca)
  {
    Name "ICaLfca in component L_type_Ca_channel (dimensionless)";
    Value  0.9445;
%line 167 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # It

  Variable Variable(It)
  {
    Name "It in component Ca_independent_transient_outward_K_current (picoA)";
    Value  0.0155080210811;
%line 175 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Itrinf)
  {
    Name "Itrinf in component Ca_independent_transient_outward_K_current_r_gate (dimensionless)";
    Value  0.000727292296804;
%line 181 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Itsinf)
  {
    Name "Itsinf in component Ca_independent_transient_outward_K_current_s_gate (dimensionless)";
    Value  0.964518195981;
%line 187 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Itrtau)
  {
    Name "Itrtau in component Ca_independent_transient_outward_K_current_r_gate (second)";
    Value  0.00150373244027;
%line 193 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Itstau)
  {
    Name "Itstau in component Ca_independent_transient_outward_K_current_s_gate (second)";
    Value  0.0158871708145;
%line 199 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Itr)
  {
    Name "Itr in component Ca_independent_transient_outward_K_current_r_gate (dimensionless)";
    Value  0.0007272;
%line 205 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Its)
  {
    Name "Its in component Ca_independent_transient_outward_K_current_s_gate (dimensionless)";
    Value  0.9646;
%line 211 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # Isus

  Variable Variable(Isus)
  {
    Name "Isus in component sustained_outward_K_current (picoA)";
    Value  0.00203531713413;
%line 219 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Isusrinf)
  {
    Name "Isusrinf in component sustained_outward_K_current_r_sus_gate (dimensionless)";
    Value  0.000218630901441;
%line 225 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Isussinf)
  {
    Name "Isussinf in component sustained_outward_K_current_s_sus_gate (dimensionless)";
    Value  0.999173926178;
%line 231 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Isusrtau)
  {
    Name "Isusrtau in component sustained_outward_K_current_r_sus_gate (second)";
    Value  0.00948032285559;
%line 237 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Isusstau)
  {
    Name "Isusstau in component sustained_outward_K_current_s_sus_gate (second)";
    Value  3.55969634433;
%line 243 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Isusr)
  {
    Name "Isusr in component sustained_outward_K_current_r_sus_gate (dimensionless)";
    Value  0.0002184;
%line 249 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Isuss)
  {
    Name "Isuss in component sustained_outward_K_current_s_sus_gate (dimensionless)";
    Value  0.9473;
%line 255 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # IKs

  Variable Variable(IKs)
  {
    Name "IKs in component delayed_rectifier_K_currents (picoA)";
    Value  0.0548793471353;
%line 263 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKsninf)
  {
    Name "IKsninf in component delayed_rectifier_K_currents_n_gate (dimensionless)";
    Value  0.000432084722949;
%line 269 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKsntau)
  {
    Name "IKsntau in component delayed_rectifier_K_currents_n_gate (second)";
    Value  0.700000000012;
%line 275 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKsn)
  {
    Name "IKsn in component delayed_rectifier_K_currents_n_gate (dimensionless)";
    Value  0.007782;
%line 281 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # IKr

  Variable Variable(IKrpi)
  {
    Name "IKrpi in component delayed_rectifier_K_currents_pi_gate (dimensionless)";
    Value  0.726777388098;
%line 289 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKr)
  {
    Name "IKr in component delayed_rectifier_K_currents (picoA)";
    Value  6.47837659655e-05;
%line 295 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKrpainf)
  {
    Name "IKrpainf in component delayed_rectifier_K_currents_pa_gate (dimensionless)";
    Value  2.54187003894e-05;
%line 301 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKrpatau)
  {
    Name "IKrpatau in component delayed_rectifier_K_currents_pa_gate (second)";
    Value  0.0313973827192;
%line 307 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IKrpa)
  {
    Name "IKrpa in component delayed_rectifier_K_currents_pa_gate (dimensionless)";
    Value  2.528e-05;
%line 313 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # IK1

  Variable Variable(IK1)
  {
    Name "IK1 in component inward_rectifier (picoA)";
    Value  29.5057915894;
%line 321 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # Background leaks

  Variable Variable(INab)
  {
    Name "INab in component background_currents (picoA)";
    Value  -9.02582182711;
%line 329 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(ICab)
  {
    Name "ICab in component background_currents (picoA)";
    Value  -19.304678228;
%line 335 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # INaK

  Variable Variable(INaK)
  {
    Name "INaK in component sodium_potassium_pump (picoA)";
    Value  14.9485056445;
%line 343 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # INaCa

  Variable Variable(INaCa)
  {
    Name "INaCa in component Na_Ca_ion_exchanger_current (picoA)";
    Value  -10.9816033639;
%line 351 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  # ICaP

  Variable Variable(ICaP)
  {
    Name "ICaP in component sarcolemmal_calcium_pump_current (picoA)";
    Value  0.450573287883;
%line 359 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

# If

  Variable Variable(Ifyinf)
  {
    Name "";
    Value  0.175035903389;
%line 367 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Ifytau)
  {
    Name "";
    Value  1.70073076345;
%line 373 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(Ify)
  {
    Name "";
    Value  0.06449;
%line 379 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IfNa)
  {
    Name "";
    Value  -2.57135504424;
%line 385 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(IfK)
  {
    Name "";
    Value  0.333042088095;
%line 391 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  Variable Variable(If)
  {
    Name "";
    Value  -2.23831295615;
%line 397 ./Koivumaki-2011_cAF_Cell_Membrane.em
  }

  #**********************************************
  # Processes
  #**********************************************

  
  # V
  Process Nygren_1998_VFluxProcess(dV_dt)
  {
    Name "d/dt V in component membrane (millivolt)";

    Cm  0.05;

    VariableReferenceList
      [V      :.:V      1]
      [ist    :.:ist    0]
      [INa    :.:INa    0]
      [ICaL   :.:ICaL   0]
      [It     :.:It     0]
      [Isus   :.:Isus   0]
      [IK1    :.:IK1    0]
      [IKr    :.:IKr    0]
      [IKs    :.:IKs    0]
      [INab   :.:INab   0]
      [ICab   :.:ICab   0]
      [INaK   :.:INaK   0]
      [ICaP   :.:ICaP   0]
      [INaCa  :.:INaCa  0]
      [If     :.:If     0];
  }

  Process Nygren_1998_EAssignmentProcess(ENa)
  {
    StepperID    PSV;
    F  96487.0;
    T  306.15;
    R  8314.0;
    z  1;

    VariableReferenceList
      [E :.:ENa             1]
      [o :/:Nao             0]
      [i :../Cytosol/ss:Na  0];
  }

  Process Nygren_1998_EAssignmentProcess(EK)
  {
    StepperID    PSV;
    F  96487.0;
    T  306.15;
    R  8314.0;
    z  1;

    VariableReferenceList
      [E :.:EK            1]
      [o :/:Ko            0]
      [i :../Cytosol:K_i  0];
  }

  Process Nygren_1998_EAssignmentProcess(ECa)
  {
    StepperID    PSV;
    F  96487.0;
    T  306.15;
    R  8314.0;
    z  2;

    VariableReferenceList
      [E :.:ECa             1]
      [o :/:Cao             0]
      [i :../Cytosol/ss:Ca  0];
  }

  # INa   
  Process Nygren_1998_INaAssignmentProcess(INa) # same as Nygren_1998
  {
    StepperID    PSV;

    T  306.15;
    R  8314.0;
    F  96487.0;
    P_Na  0.0018; # 0.0016, P_Na in component sodium_current (nanolitre_per_second)

    VariableReferenceList
      [i_Na       :.:INa       1]
      [m_infinity :.:INaminf   1]
      [tau_m      :.:INamtau   1]
      [h_infinity :.:INahinf   1]
      [tau_h1     :.:INah1tau  1]
      [tau_h2     :.:INah2tau  1]
      [m          :.:INam      0]
      [h1         :.:INah1     0]
      [h2         :.:INah2     0]
      [Na_c       :/:Nao       0]  # Nao
      [V          :.:V         0]
      [E_Na       :.:ENa       0];
  }

  Process Nygren_1998_GatingFluxProcess(dINam_dt)
  {

    VariableReferenceList
      [gate  :.:INam     1]
      [g_inf :.:INaminf  0]
      [g_tau :.:INamtau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dINah1_dt)
  {
    Name "dINah1_dt in component sodium_current_h1_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:INah1     1]
      [g_inf :.:INahinf   0]
      [g_tau :.:INah1tau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dINah2_dt)
  {
    Name "dINah2_dt in component sodium_current_h2_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:INah2     1]
      [g_inf :.:INahinf   0]
      [g_tau :.:INah2tau  0];
  }
  

  # ICaL   
  Process Koivumaki_2011_ICaLAssignmentProcess(ICaL)
  {
    StepperID    PSV;

    E_Ca_app 60; # 60,    E_Ca_app in component L_type_Ca_channel (millivolt)
    g_Ca_L   6.15;    # 6.75,  g_Ca_L in component L_type_Ca_channel (nanoS)
    kCa      0.0006;     # 0.025, k_Ca in component L_type_Ca_channel (millimolar)
    kCan     2;

    VariableReferenceList
      [ICaL       :.:ICaL               1]
      [ICaLfcainf :.:ICaLfcainf         1]
      [ICaLfcatau :.:ICaLfcatau         1]
      [ICaLdinf   :.:ICaLdinf           1]
      [ICaLdtau   :.:ICaLdtau           1]
      [ICaLfinf   :.:ICaLfinf           1]
      [ICaLf1tau  :.:ICaLf1tau          1]
      [ICaLf2tau  :.:ICaLf2tau          1]
      [ICaLfca    :.:ICaLfca            0]   # ICaLfca
      [ICaLd      :.:ICaLd              0]   # ICaLd
      [ICaLf1     :.:ICaLf1             0]   # ICaLf1
      [ICaLf2     :.:ICaLf2             0]   # ICaLf2
      [Ca_ss      :../Cytosol/ss:Ca     0]
      [V          :.:V                  0];
  }

  Process Nygren_1998_GatingFluxProcess(dICaLd_dt)
  {
    Name "dICaLd_dt in component L_type_Ca_channel_d_L_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:ICaLd     1]
      [g_inf :.:ICaLdinf  0]
      [g_tau :.:ICaLdtau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dICaLf1_dt)
  {
    Name "dICaLf1_dt in component L_type_Ca_channel_f_L1_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:ICaLf1     1]
      [g_inf :.:ICaLfinf   0]
      [g_tau :.:ICaLf1tau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dICaLf2_dt)
  {
    Name "dICaLf2_dt in component L_type_Ca_channel_f_L2_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:ICaLf2     1]
      [g_inf :.:ICaLfinf   0]
      [g_tau :.:ICaLf2tau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dICaLfca_dt)
  {
    VariableReferenceList
      [gate  :.:ICaLfca     1]
      [g_inf :.:ICaLfcainf  0]
      [g_tau :.:ICaLfcatau  0];
  }
  

  # It   
  Process Koivumaki_2011_ItAssignmentProcess(It)
  {
    StepperID    PSV;

    g_t  3.135; # 7.5, g_t in component Ca_independent_transient_outward_K_current (nanoS)

    VariableReferenceList
      [It     :.:It      1]
      [Itrtau :.:Itrtau  1]
      [Itrinf :.:Itrinf  1]
      [Itstau :.:Itstau  1]
      [Itsinf :.:Itsinf  1]
      [Itr    :.:Itr     0]
      [Its    :.:Its     0]
      [V      :.:V       0]
      [EK     :.:EK      0];
  }

  Process Nygren_1998_GatingFluxProcess(dItr_dt)
  {
    Name "dItr_dt in component Ca_independent_transient_outward_K_current_r_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:Itr     1]
      [g_inf :.:Itrinf  0]
      [g_tau :.:Itrtau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dIts_dt)
  {
    Name "dIts_dt in component Ca_independent_transient_outward_K_current_s_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:Its     1]
      [g_inf :.:Itsinf  0]
      [g_tau :.:Itstau  0];
  }
  

  # Isus   
  Process Koivumaki_2011_IsusAssignmentProcess(Isus)
  {
    StepperID    PSV;

    g_sus  1.395; # 2.75, g_sus in component sustained_outward_K_current (nanoS)

    VariableReferenceList
      [Isusrtau :.:Isusrtau  1]
      [Isusrinf :.:Isusrinf  1]
      [Isusstau :.:Isusstau  1]
      [Isussinf :.:Isussinf  1]
      [Isus     :.:Isus      1]
      [Isusr    :.:Isusr     0]
      [Isuss    :.:Isuss     0]
      [V        :.:V         0]
      [EK       :.:EK        0];
  }

  Process Nygren_1998_GatingFluxProcess(dIsusr_dt)
  {
    Name "dIsusr_dt in component sustained_outward_K_current_r_sus_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:Isusr     1]
      [g_inf :.:Isusrinf  0]
      [g_tau :.:Isusrtau  0];
  }

  Process Nygren_1998_GatingFluxProcess(dIsuss_dt)
  {
    Name "dIsuss_dt in component sustained_outward_K_current_s_sus_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:Isuss     1]
      [g_inf :.:Isussinf  0]
      [g_tau :.:Isusstau  0];
  }
  

  # IKs   
  Process Nygren_1998_IKsAssignmentProcess(IKs)
  {
    StepperID    PSV;

    g_Ks  1; # 1, g_Ks in component delayed_rectifier_K_currents (nanoS)

    VariableReferenceList
      [tau_n      :.:IKsntau  1]
      [n_infinity :.:IKsninf  1]
      [i_Ks       :.:IKs      1]
      [n          :.:IKsn     0]
      [V          :.:V        0]
      [E_K        :.:EK       0];
  }

  Process Nygren_1998_GatingFluxProcess(dIKsn_dt)
  {
    Name "dIKsn_dt in component delayed_rectifier_K_currents_n_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:IKsn     1]
      [g_inf :.:IKsninf  0]
      [g_tau :.:IKsntau  0];
  }
  

  # IKr   
  Process Nygren_1998_IKrAssignmentProcess(IKr)
  {
    StepperID    PSV;

    g_Kr  0.5; # 0.5, g_Kr in component delayed_rectifier_K_currents (nanoS)

    VariableReferenceList
      [tau_p_a      :.:IKrpatau  1]
      [p_a_infinity :.:IKrpainf  1]
      [p_i          :.:IKrpi     1]
      [i_Kr         :.:IKr       1]
      [p_a          :.:IKrpa     0]
      [V            :.:V         0]
      [E_K          :.:EK        0];
  }

  Process Nygren_1998_GatingFluxProcess(dIKrpa_dt)
  {
    Name "dIKrpa_dt in component delayed_rectifier_K_currents_pa_gate (dimensionless)";

    VariableReferenceList
      [gate  :.:IKrpa     1]
      [g_inf :.:IKrpainf  0]
      [g_tau :.:IKrpatau  0];
  }
  

  # If   
  Process Koivumaki_2011_IfAssignmentProcess(If)
  {
    StepperID    PSV;

    gIf  1;

    VariableReferenceList
      [Ifyinf :.:Ifyinf  1]
      [Ifytau :.:Ifytau  1]
      [IfNa   :.:IfNa    1]
      [IfK    :.:IfK     1]
      [If     :.:If      1]
      [Ify    :.:Ify     0]
      [ENa    :.:ENa     0]
      [EK     :.:EK      0]
      [V      :.:V       0];
  }

  Process Nygren_1998_GatingFluxProcess(dIfy_dt)
  {
    Name "dIfy_dt (sec^-1)";

    VariableReferenceList
      [gate  :.:Ify     1]
      [g_inf :.:Ifyinf  0]
      [g_tau :.:Ifytau  0];
  }
  

  # IK1
  Process Nygren_1998i_K1AssignmentProcess(IK1)
  {
    StepperID    PSV;

    T  306.15;
    R  8314.0;
    F  96487.0;
    g_K1  5.589; # 3, g_K1 in component inward_rectifier (nanoS)

    VariableReferenceList
      [i_K1 :.:IK1  1]
      [K_c  :/:Ko   0]
      [V    :.:V    0]
      [E_K  :.:EK  0];
  }

  # INaK
  Process Nygren_1998i_NaKAssignmentProcess(INaK)
  {
    StepperID    PSV;

    k_NaK_Na   11;  # 11,      k_NaK_Na in component sodium_potassium_pump (millimolar)
    k_NaK_K    1;   # 1,       k_NaK_K in component sodium_potassium_pump (millimolar)
    i_NaK_max  70.8253; # 70.8253, i_NaK_max in component sodium_potassium_pump (picoA)

    VariableReferenceList
      [i_NaK :.:INaK               1]
      [K_c   :/:Ko                 0]  # Ko
      [Na_i  :../Cytosol/ss:Na  0]  # Nass
      [V     :.:V                  0];
  }

  Process Nygren_1998_BackgroudLeakAssignmentProcess(INab)
  {
    StepperID    PSV;

    g  0.060599; # g_B_Na in component background_currents (nanoS)

    VariableReferenceList
      [i :.:INab  1]
      [V :.:V     0]
      [E :.:ENa  0];
  }

  
  Process Nygren_1998_BackgroudLeakAssignmentProcess(ICab)
  {
    StepperID    PSV;

    g  0.078681; # g_B_Ca in component background_currents (nanoS)

    VariableReferenceList
      [i :.:ICab  1]
      [V :.:V     0]
      [E :.:ECa  0];
  }
  

  Process Nygren_1998i_CaPAssignmentProcess(ICaP)
  {
    StepperID    PSV;

    k_CaP      0.0005;    # 0.0002, k_CaP in component sarcolemmal_calcium_pump_current (millimolar)
    i_CaP_max  2.0; # 4, i_CaP_max in component sarcolemmal_calcium_pump_current (picoA)

    VariableReferenceList
      [i_CaP :.:ICaP               1]
      [Ca_i  :../Cytosol/ss:Ca  0]; # Cass
  }

  Process Nygren_1998i_NaCaAssignmentProcess(INaCa)
  {
    StepperID    PSV;

    T  306.15;
    R  8314.0;
    F  96487.0;
    gamma   0.45;   # 0.45, gamma in component Na_Ca_ion_exchanger_current (dimensionless)
    k_NaCa  0.0126; # 0.0374842, k_NaCa in component Na_Ca_ion_exchanger_current (picoA_per_millimolar_4)
    d_NaCa  0.0003; # 0.0003, d_NaCa in component Na_Ca_ion_exchanger_current (per_millimolar_4)
    # fCaNCX  1;

    VariableReferenceList
      [i_NaCa :.:INaCa           1]
      [Na_i   :../Cytosol/ss:Na  0]  # Nass
      [Ca_c   :/:Cao             0]  # Cao
      [V      :.:V               0]
      [Na_c   :/:Nao             0]  # Nao
      [Ca_i   :../Cytosol/ss:Ca  0]; # Cass
  }

  Process Koivumaki_2011_IstAssignmentProcess(ist)
  {
    StepperID    PSV;

    Name "ist in component membrane (picoA)";

    

    stim_duration   0.001;
    stim_amp        -2820.0;
    BCL             1.0;
    stim_steepness  20.0;
    stim_offset     0.01;

    VariableReferenceList
      [ist :.:ist  1]
      [t   :/:t    0];
  }

 
  Process Koivumaki_2011_ZeroVariableAsCurrentFluxProcess(JNa_mem)
  {
    k -1;
    F 96487.0;

    VariableReferenceList
      [INa   :../Membrane:INa    0] # pA = pC/sec
      [INab  :../Membrane:INab   0]
      [INaK  :../Membrane:INaK   0] # 3 * INaK
      [INaK  :../Membrane:INaK   0]
      [INaK  :../Membrane:INaK   0]
      [INaCa :../Membrane:INaCa  0] # 3 * INaCa
      [INaCa :../Membrane:INaCa  0]
      [INaCa :../Membrane:INaCa  0]
      [IfNa  :../Membrane:IfNa   0]
      [Nass  :../Cytosol/ss:Na   1];
  }

  Process Koivumaki_2011_ZeroVariableAsCurrentFluxProcess(JK_mem)
  {
    k -1;
    F 96487.0;

    VariableReferenceList
      [It   :../Membrane:It    0] # pA = pC/sec
      [Isus :../Membrane:Isus  0]
      [IK1  :../Membrane:IK1   0]
      [IKr  :../Membrane:IKr   0]
      [IKs  :../Membrane:IKs   0]
      [IfK  :../Membrane:IfK   0]
      [ist  :../Membrane:ist   0]
      [Ki   :../Cytosol:K_i    1];
  }

  Process Koivumaki_2011_ZeroVariableAsCurrentFluxProcess(JK_INaK)
  {
    k 2;
    F 96487.0;

    VariableReferenceList
      [INaK :../Membrane:INaK  0]
      [Ki   :../Cytosol:K_i    1];
  }

  Process Koivumaki_2011_ZeroVariableAsCurrentFluxProcess(JCa_mem)
  {
    k -0.5;
    F 96487.0;

    VariableReferenceList
      [ICaL :../Membrane:ICaL  0] # pA = pC/sec
      [ICab :../Membrane:ICab  0]
      [ICaP :../Membrane:ICaP  0]
      [Cass :../Cytosol/ss:Ca  1];
  }

  Process Koivumaki_2011_ZeroVariableAsCurrentFluxProcess(JCa_INaCa)
  {
    k 1;
    F 96487.0;

    VariableReferenceList
      [INaCa :../Membrane:INaCa  0] # pA = pC/sec
      [Cass  :../Cytosol/ss:Ca   1];
  }
        %line 941 ./Koivumaki-2011_cAF_Cell_Membrane.em

} # End of /Cell/Membrane
%line 478 Koivumaki-2011_cAF.em

%line 479 Koivumaki-2011_cAF.em

# /Cell/Cytoplasm/{ss||bulk_x}



%line 1 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

System System( /Cell/Cytosol/ss )
%line 8 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
{
  StepperID    Default;
  Name "Cytosol ss";
%line 11 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( SIZE )
  {
    Value    7.90783488e-14;
%line 15 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  
  Variable Variable(Na) # ss only
  {
    Name "Nass in component cleft_space_ion_concentrations (molar)";
    MolarConc  0.008993;
  }

  Variable Variable( Na_buffer ) # ss only
  {
    Name "Variable to hold Velocity of Na buffering";
    MolarConc    0.0;
    Fixed 1;
  }
  
%line 31 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( Ca )
  {
    MolarConc    1.454e-07;  # Cai1
%line 35 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Variable Variable( SERCACa ) # ss, bulk_1-3
  {
    MolarConc    7.291e-07;  # SERCACa1
  }

  Variable Variable( J_SERCASR ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    5.218970849e-07;
  }

  Variable Variable( J_bulkSERCA ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    5.27705341133e-07;
  }

  Variable Variable( JSRCaleak ) # ss, bulk_1-3
  {
    Value    7.57099106803e-08;
  }

  Variable Variable( RyRa ) # ss, bulk_1-3
  {
    Value    0.2212; # RyRa0
  }

  Variable Variable( RyRo ) # ss, bulk_1-3
  {
    Value    0.00201; # RyRo0
  }

  Variable Variable( RyRc ) # ss, bulk_1-3
  {
    Value    0.9999; # RyRc0
  }

  Variable Variable( RyRainf ) # ss, bulk_1-3
  {
    Value    0.14049708494;
  }

  Variable Variable( RyRoinf ) # ss, bulk_1-3
  {
    Value    0.00203884001162;
  }

  Variable Variable( RyRcinf ) # ss, bulk_1-3
  {
    Value    0.999930907826;
  }

  Variable Variable( RyRtauact ) # ss, bulk_1-3
  {
    Value    0.005;
    Fixed  1;
  }

  Variable Variable( RyRtauinact ) # ss, bulk_1-3
  {
    Value    0.015;
    Fixed  1;
  }

  Variable Variable( RyRtauadapt ) # ss, bulk_1-3
  {
    Value    1;
    Fixed  1;
  }

  Variable Variable( Jrel ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    1.16771740421e-05;
  }

  
  # ss, bulk_1-3
  Process Koivumaki_2011_J_SERCAAssignmentProcess( J_SERCA )
  {
    StepperID    PSV;
    Name "";
    

    k1      13000000.0;
    k2      1.1457905472;
    k3      6.36368565826;
    k4      13.0;
    cpumps  0.0159090909091;

    VariableReferenceList
      [J_SERCASR   :.:J_SERCASR                1]
      [J_bulkSERCA :.:J_bulkSERCA              1]
      [SERCACa     :.:SERCACa                  0]
      [CaSR        :../../SR_4:Ca  0]
      [Cai         :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_SERCASR)
  {
    VariableReferenceList
      [J_SERCASR :.:J_SERCASR                0] # pmol/sec
      [SERCACa   :.:SERCACa                 -1]
      [CaSR      :../../SR_4:Ca  2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_bulkSERCA)
  {
    VariableReferenceList
      [J_bulkSERCA :.:J_bulkSERCA  0] # pmol/sec
      [SERCACa     :.:SERCACa      1]
      [Cai         :.:Ca          -2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JSRCaleakAssignmentProcess( JSRCaleak_assign )
  {
    StepperID    PSV;
    Name "";
    

    kSRleak  0.00378787878788;

    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                1]
      [CaSR      :../../SR_4:Ca  0]
      [Cai       :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(JSRCaleak)
  {
    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                0] # pmol/sec
      [Cai       :.:Ca                       1]
      [CaSR      :../../SR_4:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JrelAssignmentProcess( Jrel_assign )
  {
    StepperID    PSV;
    Name "";
    

    k_nu  394.570707071;  # k_nuss in SR4
    k_Ca  2.0;

    VariableReferenceList
      [Jrel    :.:Jrel                     1]
      [RyRainf :.:RyRainf                  1]
      [RyRoinf :.:RyRoinf                  1]
      [RyRcinf :.:RyRcinf                  1]
      [RyRa    :.:RyRa                     0]
      [RyRo    :.:RyRo                     0]
      [RyRc    :.:RyRc                     0]
      [CaSR    :../../SR_4:Ca  0]
      [Cai     :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(Jrel)
  {
    VariableReferenceList
      [Jrel :.:Jrel                     0] # pmol/sec
      [Cai  :.:Ca                       1]
      [CaSR :../../SR_4:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRo_dt)
  {
    VariableReferenceList
      [gate  :.:RyRo       1]
      [g_inf :.:RyRoinf    0]
      [g_tau :.:RyRtauact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRc_dt)
  {
    VariableReferenceList
      [gate  :.:RyRc         1]
      [g_inf :.:RyRcinf      0]
      [g_tau :.:RyRtauinact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRa_dt)
  {
    VariableReferenceList
      [gate  :.:RyRa         1]
      [g_inf :.:RyRainf      0]
      [g_tau :.:RyRtauadapt  0];
  }
        %line 265 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  
   # ss
  # ss only
  Process Koivumaki_2011_CassBufferFluxProcess(Ca_buffer)
  {
    

    SLlow    165;
    KdSLlow  1.1;
    SLhigh   13;
    KdSLhigh 0.013;
    BCa      0.024;
    KdBCa    0.00238;

    VariableReferenceList
      [Cass   :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }

  # ss only
  Process Koivumaki_2011_BufferFluxProcess(Na_buffer)
  {
    Name "Sodium buffering";

    

    B    1.1319;
    KdB  10;

    VariableReferenceList
      [ion    :.:Na        -1]
      [buffer :.:Na_buffer  1];
  }

  # ss only
  Process Koivumaki_2011_DiffusionJNjFluxProcess(Jj_nj)
  {
    Name "Ca diffusion from junct to non-junct";
    

    D  780.0;
    Aj_nj  3289.86822419;
    xj_nj  0.987;

    VariableReferenceList
      [nj :../bulk_4:Ca  1]  # Cai4
      [j  :.:Ca         -1]; # Cass
  }
  
    %line 366 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

} # END of /Cell/Cytosol/ss
%line 368 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
%line 491 Koivumaki-2011_cAF.em




%line 1 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

System System( /Cell/Cytosol/bulk_1 )
%line 8 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
{
  StepperID    Default;
  Name "Cytosol bulk_1";
%line 11 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( SIZE )
  {
    Value    8.01905379645e-13;
%line 15 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  
%line 31 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( Ca )
  {
    MolarConc    1.35e-07;  # Cai1
%line 35 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Variable Variable( SERCACa ) # ss, bulk_1-3
  {
    MolarConc    9.545e-07;  # SERCACa1
  }

  Variable Variable( J_SERCASR ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    3.01667100603e-06;
  }

  Variable Variable( J_bulkSERCA ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    3.9284692982e-06;
  }

  Variable Variable( JSRCaleak ) # ss, bulk_1-3
  {
    Value    1.00986921229e-06;
  }

  Variable Variable( RyRa ) # ss, bulk_1-3
  {
    Value    0.1631; # RyRa1
  }

  Variable Variable( RyRo ) # ss, bulk_1-3
  {
    Value    0.005833; # RyRo1
  }

  Variable Variable( RyRc ) # ss, bulk_1-3
  {
    Value    0.9978; # RyRc1
  }

  Variable Variable( RyRainf ) # ss, bulk_1-3
  {
    Value    0.134029514819;
  }

  Variable Variable( RyRoinf ) # ss, bulk_1-3
  {
    Value    0.0099190129128;
  }

  Variable Variable( RyRcinf ) # ss, bulk_1-3
  {
    Value    0.991917991375;
  }

  Variable Variable( RyRtauact ) # ss, bulk_1-3
  {
    Value    0.01875;
    Fixed  1;
  }

  Variable Variable( RyRtauinact ) # ss, bulk_1-3
  {
    Value    0.0875;
    Fixed  1;
  }

  Variable Variable( RyRtauadapt ) # ss, bulk_1-3
  {
    Value    1;
    Fixed  1;
  }

  Variable Variable( Jrel ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    8.4371544822e-07;
  }

  
  # ss, bulk_1-3
  Process Koivumaki_2011_J_SERCAAssignmentProcess( J_SERCA )
  {
    StepperID    PSV;
    Name "";
    

    k1      13000000.0;
    k2      1.1457905472;
    k3      6.36368565826;
    k4      13.0;
    cpumps  0.0159090909091;

    VariableReferenceList
      [J_SERCASR   :.:J_SERCASR                1]
      [J_bulkSERCA :.:J_bulkSERCA              1]
      [SERCACa     :.:SERCACa                  0]
      [CaSR        :../../SR_1:Ca  0]
      [Cai         :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_SERCASR)
  {
    VariableReferenceList
      [J_SERCASR :.:J_SERCASR                0] # pmol/sec
      [SERCACa   :.:SERCACa                 -1]
      [CaSR      :../../SR_1:Ca  2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_bulkSERCA)
  {
    VariableReferenceList
      [J_bulkSERCA :.:J_bulkSERCA  0] # pmol/sec
      [SERCACa     :.:SERCACa      1]
      [Cai         :.:Ca          -2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JSRCaleakAssignmentProcess( JSRCaleak_assign )
  {
    StepperID    PSV;
    Name "";
    

    kSRleak  0.00378787878788;

    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                1]
      [CaSR      :../../SR_1:Ca  0]
      [Cai       :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(JSRCaleak)
  {
    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                0] # pmol/sec
      [Cai       :.:Ca                       1]
      [CaSR      :../../SR_1:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JrelAssignmentProcess( Jrel_assign )
  {
    StepperID    PSV;
    Name "";
    

    k_nu  0.631313131313;  # k_nuss in SR4
    k_Ca  2.0;

    VariableReferenceList
      [Jrel    :.:Jrel                     1]
      [RyRainf :.:RyRainf                  1]
      [RyRoinf :.:RyRoinf                  1]
      [RyRcinf :.:RyRcinf                  1]
      [RyRa    :.:RyRa                     0]
      [RyRo    :.:RyRo                     0]
      [RyRc    :.:RyRc                     0]
      [CaSR    :../../SR_1:Ca  0]
      [Cai     :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(Jrel)
  {
    VariableReferenceList
      [Jrel :.:Jrel                     0] # pmol/sec
      [Cai  :.:Ca                       1]
      [CaSR :../../SR_1:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRo_dt)
  {
    VariableReferenceList
      [gate  :.:RyRo       1]
      [g_inf :.:RyRoinf    0]
      [g_tau :.:RyRtauact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRc_dt)
  {
    VariableReferenceList
      [gate  :.:RyRc         1]
      [g_inf :.:RyRcinf      0]
      [g_tau :.:RyRtauinact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRa_dt)
  {
    VariableReferenceList
      [gate  :.:RyRa         1]
      [g_inf :.:RyRainf      0]
      [g_tau :.:RyRtauadapt  0];
  }
        %line 265 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  
   # bulk_1-4
  # bulk_1-4
  Process Koivumaki_2011_CaBulkDiffusionFluxProcess(Ca_diff)
  {
    Name "Sodium buffering";

    

    DCa    780.0;
    DCaBm  25.0;
    BCa    0.024;
    KdBCa  0.00238;
    dx     1.95;
    j      1;

    VariableReferenceList
      [Ca_up   :../bulk_2:Ca  0]
      [Ca_down :../bulk_1:Ca  0]
      [Ca      :.:Ca                        1];
  }

  # bulk_1-4
  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    0.024;
    KdB  0.00238;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }

  
    %line 366 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

} # END of /Cell/Cytosol/bulk_1
%line 368 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
%line 491 Koivumaki-2011_cAF.em




%line 1 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

System System( /Cell/Cytosol/bulk_2 )
%line 8 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
{
  StepperID    Default;
  Name "Cytosol bulk_2";
%line 11 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( SIZE )
  {
    Value    2.40571613894e-12;
%line 15 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  
%line 31 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( Ca )
  {
    MolarConc    1.38e-07;  # Cai1
%line 35 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Variable Variable( SERCACa ) # ss, bulk_1-3
  {
    MolarConc    9.013e-07;  # SERCACa1
  }

  Variable Variable( J_SERCASR ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    9.87782760481e-06;
  }

  Variable Variable( J_bulkSERCA ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    1.29081479998e-05;
  }

  Variable Variable( JSRCaleak ) # ss, bulk_1-3
  {
    Value    2.89744816276e-06;
  }

  Variable Variable( RyRa ) # ss, bulk_1-3
  {
    Value    0.1683; # RyRa2
  }

  Variable Variable( RyRo ) # ss, bulk_1-3
  {
    Value    0.005244; # RyRo2
  }

  Variable Variable( RyRc ) # ss, bulk_1-3
  {
    Value    0.9983; # RyRc2
  }

  Variable Variable( RyRainf ) # ss, bulk_1-3
  {
    Value    0.135834551649;
  }

  Variable Variable( RyRoinf ) # ss, bulk_1-3
  {
    Value    0.00922411903369;
  }

  Variable Variable( RyRcinf ) # ss, bulk_1-3
  {
    Value    0.993503667716;
  }

  Variable Variable( RyRtauact ) # ss, bulk_1-3
  {
    Value    0.01875;
    Fixed  1;
  }

  Variable Variable( RyRtauinact ) # ss, bulk_1-3
  {
    Value    0.0875;
    Fixed  1;
  }

  Variable Variable( RyRtauadapt ) # ss, bulk_1-3
  {
    Value    1;
    Fixed  1;
  }

  Variable Variable( Jrel ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    2.13125180438e-06;
  }

  
  # ss, bulk_1-3
  Process Koivumaki_2011_J_SERCAAssignmentProcess( J_SERCA )
  {
    StepperID    PSV;
    Name "";
    

    k1      13000000.0;
    k2      1.1457905472;
    k3      6.36368565826;
    k4      13.0;
    cpumps  0.0159090909091;

    VariableReferenceList
      [J_SERCASR   :.:J_SERCASR                1]
      [J_bulkSERCA :.:J_bulkSERCA              1]
      [SERCACa     :.:SERCACa                  0]
      [CaSR        :../../SR_2:Ca  0]
      [Cai         :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_SERCASR)
  {
    VariableReferenceList
      [J_SERCASR :.:J_SERCASR                0] # pmol/sec
      [SERCACa   :.:SERCACa                 -1]
      [CaSR      :../../SR_2:Ca  2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_bulkSERCA)
  {
    VariableReferenceList
      [J_bulkSERCA :.:J_bulkSERCA  0] # pmol/sec
      [SERCACa     :.:SERCACa      1]
      [Cai         :.:Ca          -2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JSRCaleakAssignmentProcess( JSRCaleak_assign )
  {
    StepperID    PSV;
    Name "";
    

    kSRleak  0.00378787878788;

    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                1]
      [CaSR      :../../SR_2:Ca  0]
      [Cai       :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(JSRCaleak)
  {
    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                0] # pmol/sec
      [Cai       :.:Ca                       1]
      [CaSR      :../../SR_2:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JrelAssignmentProcess( Jrel_assign )
  {
    StepperID    PSV;
    Name "";
    

    k_nu  0.631313131313;  # k_nuss in SR4
    k_Ca  2.0;

    VariableReferenceList
      [Jrel    :.:Jrel                     1]
      [RyRainf :.:RyRainf                  1]
      [RyRoinf :.:RyRoinf                  1]
      [RyRcinf :.:RyRcinf                  1]
      [RyRa    :.:RyRa                     0]
      [RyRo    :.:RyRo                     0]
      [RyRc    :.:RyRc                     0]
      [CaSR    :../../SR_2:Ca  0]
      [Cai     :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(Jrel)
  {
    VariableReferenceList
      [Jrel :.:Jrel                     0] # pmol/sec
      [Cai  :.:Ca                       1]
      [CaSR :../../SR_2:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRo_dt)
  {
    VariableReferenceList
      [gate  :.:RyRo       1]
      [g_inf :.:RyRoinf    0]
      [g_tau :.:RyRtauact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRc_dt)
  {
    VariableReferenceList
      [gate  :.:RyRc         1]
      [g_inf :.:RyRcinf      0]
      [g_tau :.:RyRtauinact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRa_dt)
  {
    VariableReferenceList
      [gate  :.:RyRa         1]
      [g_inf :.:RyRainf      0]
      [g_tau :.:RyRtauadapt  0];
  }
        %line 265 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  
   # bulk_1-4
  # bulk_1-4
  Process Koivumaki_2011_CaBulkDiffusionFluxProcess(Ca_diff)
  {
    Name "Sodium buffering";

    

    DCa    780.0;
    DCaBm  25.0;
    BCa    0.024;
    KdBCa  0.00238;
    dx     1.95;
    j      2;

    VariableReferenceList
      [Ca_up   :../bulk_3:Ca  0]
      [Ca_down :../bulk_1:Ca  0]
      [Ca      :.:Ca                        1];
  }

  # bulk_1-4
  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    0.024;
    KdB  0.00238;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }

  
    %line 366 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

} # END of /Cell/Cytosol/bulk_2
%line 368 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
%line 491 Koivumaki-2011_cAF.em




%line 1 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

System System( /Cell/Cytosol/bulk_3 )
%line 8 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
{
  StepperID    Default;
  Name "Cytosol bulk_3";
%line 11 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( SIZE )
  {
    Value    4.00952689823e-12;
%line 15 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  
%line 31 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( Ca )
  {
    MolarConc    1.44e-07;  # Cai1
%line 35 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Variable Variable( SERCACa ) # ss, bulk_1-3
  {
    MolarConc    8.056e-07;  # SERCACa1
  }

  Variable Variable( J_SERCASR ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    1.90283421603e-05;
  }

  Variable Variable( J_bulkSERCA ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    2.5246940162e-05;
  }

  Variable Variable( JSRCaleak ) # ss, bulk_1-3
  {
    Value    4.40677381319e-06;
  }

  Variable Variable( RyRa ) # ss, bulk_1-3
  {
    Value    0.1824; # RyRa3
  }

  Variable Variable( RyRo ) # ss, bulk_1-3
  {
    Value    0.003932; # RyRo3
  }

  Variable Variable( RyRc ) # ss, bulk_1-3
  {
    Value    0.999; # RyRc3
  }

  Variable Variable( RyRainf ) # ss, bulk_1-3
  {
    Value    0.139591722793;
  }

  Variable Variable( RyRoinf ) # ss, bulk_1-3
  {
    Value    0.00705690583718;
  }

  Variable Variable( RyRcinf ) # ss, bulk_1-3
  {
    Value    0.997099594198;
  }

  Variable Variable( RyRtauact ) # ss, bulk_1-3
  {
    Value    0.01875;
    Fixed  1;
  }

  Variable Variable( RyRtauinact ) # ss, bulk_1-3
  {
    Value    0.0875;
    Fixed  1;
  }

  Variable Variable( RyRtauadapt ) # ss, bulk_1-3
  {
    Value    1;
    Fixed  1;
  }

  Variable Variable( Jrel ) # ss, bulk_1-3
  {
    Name "pmol/sec";
    Value    2.315687032e-06;
  }

  
  # ss, bulk_1-3
  Process Koivumaki_2011_J_SERCAAssignmentProcess( J_SERCA )
  {
    StepperID    PSV;
    Name "";
    

    k1      13000000.0;
    k2      1.1457905472;
    k3      6.36368565826;
    k4      13.0;
    cpumps  0.0159090909091;

    VariableReferenceList
      [J_SERCASR   :.:J_SERCASR                1]
      [J_bulkSERCA :.:J_bulkSERCA              1]
      [SERCACa     :.:SERCACa                  0]
      [CaSR        :../../SR_3:Ca  0]
      [Cai         :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_SERCASR)
  {
    VariableReferenceList
      [J_SERCASR :.:J_SERCASR                0] # pmol/sec
      [SERCACa   :.:SERCACa                 -1]
      [CaSR      :../../SR_3:Ca  2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(J_bulkSERCA)
  {
    VariableReferenceList
      [J_bulkSERCA :.:J_bulkSERCA  0] # pmol/sec
      [SERCACa     :.:SERCACa      1]
      [Cai         :.:Ca          -2];

    k 3.01107038e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JSRCaleakAssignmentProcess( JSRCaleak_assign )
  {
    StepperID    PSV;
    Name "";
    

    kSRleak  0.00378787878788;

    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                1]
      [CaSR      :../../SR_3:Ca  0]
      [Cai       :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(JSRCaleak)
  {
    VariableReferenceList
      [JSRCaleak :.:JSRCaleak                0] # pmol/sec
      [Cai       :.:Ca                       1]
      [CaSR      :../../SR_3:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Koivumaki_2011_JrelAssignmentProcess( Jrel_assign )
  {
    StepperID    PSV;
    Name "";
    

    k_nu  0.631313131313;  # k_nuss in SR4
    k_Ca  2.0;

    VariableReferenceList
      [Jrel    :.:Jrel                     1]
      [RyRainf :.:RyRainf                  1]
      [RyRoinf :.:RyRoinf                  1]
      [RyRcinf :.:RyRcinf                  1]
      [RyRa    :.:RyRa                     0]
      [RyRo    :.:RyRo                     0]
      [RyRc    :.:RyRc                     0]
      [CaSR    :../../SR_3:Ca  0]
      [Cai     :.:Ca                       0];
  }

  # ss, bulk_1-3
  Process ZeroVariableAsFluxProcess(Jrel)
  {
    VariableReferenceList
      [Jrel :.:Jrel                     0] # pmol/sec
      [Cai  :.:Ca                       1]
      [CaSR :../../SR_3:Ca -1];

    k 6.02214076e+11;  # pmol/sec -> NoM/sec
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRo_dt)
  {
    VariableReferenceList
      [gate  :.:RyRo       1]
      [g_inf :.:RyRoinf    0]
      [g_tau :.:RyRtauact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRc_dt)
  {
    VariableReferenceList
      [gate  :.:RyRc         1]
      [g_inf :.:RyRcinf      0]
      [g_tau :.:RyRtauinact  0];
  }

  # ss, bulk_1-3
  Process Nygren_1998_GatingFluxProcess(dRyRa_dt)
  {
    VariableReferenceList
      [gate  :.:RyRa         1]
      [g_inf :.:RyRainf      0]
      [g_tau :.:RyRtauadapt  0];
  }
        %line 265 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  
   # bulk_1-4
  # bulk_1-4
  Process Koivumaki_2011_CaBulkDiffusionFluxProcess(Ca_diff)
  {
    Name "Sodium buffering";

    

    DCa    780.0;
    DCaBm  25.0;
    BCa    0.024;
    KdBCa  0.00238;
    dx     1.95;
    j      3;

    VariableReferenceList
      [Ca_up   :../bulk_4:Ca  0]
      [Ca_down :../bulk_2:Ca  0]
      [Ca      :.:Ca                        1];
  }

  # bulk_1-4
  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    0.024;
    KdB  0.00238;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }

  
    %line 366 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

} # END of /Cell/Cytosol/bulk_3
%line 368 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
%line 491 Koivumaki-2011_cAF.em




%line 1 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

System System( /Cell/Cytosol/bulk_4 )
%line 8 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
{
  StepperID    Default;
  Name "Cytosol bulk_4";
%line 11 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( SIZE )
  {
    Value    5.61333765752e-12;
%line 15 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  
%line 31 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  Variable Variable( Ca )
  {
    MolarConc    1.56e-07;  # Cai1
%line 35 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

    %line 265 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

  
   # bulk_1-4
  # bulk_1-4
  Process Koivumaki_2011_CaBulkDiffusionFluxProcess(Ca_diff)
  {
    Name "Sodium buffering";

    

    DCa    780.0;
    DCaBm  25.0;
    BCa    0.024;
    KdBCa  0.00238;
    dx     1.95;
    j      4;

    VariableReferenceList
      [Ca_up   :../bulk_4:Ca  0]
      [Ca_down :../bulk_3:Ca  0]
      [Ca      :.:Ca                        1];
  }

  # bulk_1-4
  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    0.024;
    KdB  0.00238;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }

  
    %line 366 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em

} # END of /Cell/Cytosol/bulk_4
%line 368 ./Koivumaki-2011_cAF_Cell_Cytoplasm_bulk_x.em
%line 491 Koivumaki-2011_cAF.em



%line 492 Koivumaki-2011_cAF.em

# /Cell/SR_x


%line 1 ./Koivumaki-2011_Cell_SR_x.em
System System( /Cell/SR_1 )
%line 2 ./Koivumaki-2011_Cell_SR_x.em
{
  StepperID    Default;
  Name "SR 1";
%line 5 ./Koivumaki-2011_Cell_SR_x.em

  Variable Variable( SIZE )
  {
    Value    1.13907014154e-14; # L (nL -> L)
%line 9 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca )
  {
    MolarConc    0.0003326;  # CaSR1
%line 14 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Process Koivumaki_2011_CaSRDiffusionFluxProcess(Ca_diff)
  {
    Name "Ca buffering";

    

    DCa    44.0;
    dx     1.95;
    j      1;

    VariableReferenceList
      [Ca_up   :../SR_2:Ca  0]
      [Ca_down :../SR_1:Ca  0]
      [Ca      :.:Ca                      1];
  }

  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    6.7;
    KdB  0.8;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }
    %line 58 ./Koivumaki-2011_Cell_SR_x.em

} # END of /Cell/SR_1
%line 60 ./Koivumaki-2011_Cell_SR_x.em
%line 498 Koivumaki-2011_cAF.em



%line 1 ./Koivumaki-2011_Cell_SR_x.em
System System( /Cell/SR_2 )
%line 2 ./Koivumaki-2011_Cell_SR_x.em
{
  StepperID    Default;
  Name "SR 2";
%line 5 ./Koivumaki-2011_Cell_SR_x.em

  Variable Variable( SIZE )
  {
    Value    3.41721042462e-14; # L (nL -> L)
%line 9 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca )
  {
    MolarConc    0.0003181;  # CaSR2
%line 14 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Process Koivumaki_2011_CaSRDiffusionFluxProcess(Ca_diff)
  {
    Name "Ca buffering";

    

    DCa    44.0;
    dx     1.95;
    j      2;

    VariableReferenceList
      [Ca_up   :../SR_3:Ca  0]
      [Ca_down :../SR_1:Ca  0]
      [Ca      :.:Ca                      1];
  }

  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    6.7;
    KdB  0.8;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }
    %line 58 ./Koivumaki-2011_Cell_SR_x.em

} # END of /Cell/SR_2
%line 60 ./Koivumaki-2011_Cell_SR_x.em
%line 498 Koivumaki-2011_cAF.em



%line 1 ./Koivumaki-2011_Cell_SR_x.em
System System( /Cell/SR_3 )
%line 2 ./Koivumaki-2011_Cell_SR_x.em
{
  StepperID    Default;
  Name "SR 3";
%line 5 ./Koivumaki-2011_Cell_SR_x.em

  Variable Variable( SIZE )
  {
    Value    5.69535070771e-14; # L (nL -> L)
%line 9 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca )
  {
    MolarConc    0.0002903;  # CaSR3
%line 14 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Process Koivumaki_2011_CaSRDiffusionFluxProcess(Ca_diff)
  {
    Name "Ca buffering";

    

    DCa    44.0;
    dx     1.95;
    j      3;

    VariableReferenceList
      [Ca_up   :../SR_4:Ca  0]
      [Ca_down :../SR_2:Ca  0]
      [Ca      :.:Ca                      1];
  }

  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    6.7;
    KdB  0.8;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }
    %line 58 ./Koivumaki-2011_Cell_SR_x.em

} # END of /Cell/SR_3
%line 60 ./Koivumaki-2011_Cell_SR_x.em
%line 498 Koivumaki-2011_cAF.em



%line 1 ./Koivumaki-2011_Cell_SR_x.em
System System( /Cell/SR_4 )
%line 2 ./Koivumaki-2011_Cell_SR_x.em
{
  StepperID    Default;
  Name "SR 4";
%line 5 ./Koivumaki-2011_Cell_SR_x.em

  Variable Variable( SIZE )
  {
    Value    7.97349099079e-14; # L (nL -> L)
%line 9 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca )
  {
    MolarConc    0.0002529;  # CaSR4
%line 14 ./Koivumaki-2011_Cell_SR_x.em
  }

  Variable Variable( Ca_buffer )
  {
    Name "Variable to hold Velocity of Ca buffering";
    MolarConc    0.0;
    Fixed 1;
  }

  
  Process Koivumaki_2011_CaSRDiffusionFluxProcess(Ca_diff)
  {
    Name "Ca buffering";

    

    DCa    44.0;
    dx     1.95;
    j      4;

    VariableReferenceList
      [Ca_up   :../SR_4:Ca  0]
      [Ca_down :../SR_3:Ca  0]
      [Ca      :.:Ca                      1];
  }

  Process Koivumaki_2011_BufferFluxProcess(Ca_buffer)
  {
    Name "Ca buffering";

    

    B    6.7;
    KdB  0.8;

    VariableReferenceList
      [ion    :.:Ca        -1]
      [buffer :.:Ca_buffer  1];
  }
    %line 58 ./Koivumaki-2011_Cell_SR_x.em

} # END of /Cell/SR_4
%line 60 ./Koivumaki-2011_Cell_SR_x.em
%line 498 Koivumaki-2011_cAF.em



%line 499 Koivumaki-2011_cAF.em
