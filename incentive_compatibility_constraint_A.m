function [incentive_compatibility_constraint_A_L,incentive_compatibility_constraint_A_H]=incentive_compatibility_constraint_A(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2)

temp_1=conditional_expected_utility_A_revelation('S_A_L',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
temp_2=conditional_expected_utility_A_cheat_A('S_A_L',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
incentive_compatibility_constraint_A_L=temp_1-temp_2;

temp_1=conditional_expected_utility_A_revelation('S_A_H',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
temp_2=conditional_expected_utility_A_cheat_A('S_A_H',T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
incentive_compatibility_constraint_A_H=temp_1-temp_2;

end

