function [participation_constraint_B_L_L_L,participation_constraint_B_L_L_H,participation_constraint_B_L_H_L,participation_constraint_B_L_H_H,participation_constraint_B_H_L_L,participation_constraint_B_H_L_H,participation_constraint_B_H_H_L,participation_constraint_B_H_H_H]=participation_constraint_B(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2)

participation_constraint_B_L_L_L=conditional_expected_utility_B_revelation('Q_L','S_A_L','S_B_L',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_L_L_H=conditional_expected_utility_B_revelation('Q_L','S_A_L','S_B_H',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_L_H_L=conditional_expected_utility_B_revelation('Q_L','S_A_H','S_B_L',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_L_H_H=conditional_expected_utility_B_revelation('Q_L','S_A_H','S_B_H',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_H_L_L=conditional_expected_utility_B_revelation('Q_H','S_A_L','S_B_L',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_H_L_H=conditional_expected_utility_B_revelation('Q_H','S_A_L','S_B_H',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_H_H_L=conditional_expected_utility_B_revelation('Q_H','S_A_H','S_B_L',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_H_H_H=conditional_expected_utility_B_revelation('Q_H','S_A_H','S_B_H',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);

end

