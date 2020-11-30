function [expected_utility_objective_A_cheat_A,expected_utility_objective_B_cheat_A,expected_utility_objective_S_cheat_A]=expected_utilities_objective_cheat_A(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2)

%change this part later
%cases1='s_A<=p_A';
%cases2='p_B<s_A<=p_A';
%vector_cases2={'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A';
%               'p_B<s_A<=p_A'}

events={'Q_L','Q_L','S_A_L','S_B_L','p_A_H','s_A_H','p_B_LLL','H';
        'Q_L','Q_L','S_A_L','S_B_H','p_A_H','s_A_H','p_B_LLH','H';
        'Q_L','Q_L','S_A_H','S_B_L','p_A_L','s_A_L','p_B_LHL','L';
        'Q_L','Q_L','S_A_H','S_B_H','p_A_L','s_A_L','p_B_LHH','L';
        'Q_L','Q_H','S_A_L','S_B_L','p_A_H','s_A_H','p_B_LLL','H';
        'Q_L','Q_H','S_A_L','S_B_H','p_A_H','s_A_H','p_B_LLH','H';
        'Q_L','Q_H','S_A_H','S_B_L','p_A_L','s_A_L','p_B_LHL','L';
        'Q_L','Q_H','S_A_H','S_B_H','p_A_L','s_A_L','p_B_LHH','L';
        'Q_H','Q_L','S_A_L','S_B_L','p_A_H','s_A_H','p_B_HLL','H';
        'Q_H','Q_L','S_A_L','S_B_H','p_A_H','s_A_H','p_B_HLH','H';
        'Q_H','Q_L','S_A_H','S_B_L','p_A_L','s_A_L','p_B_HHL','L';
        'Q_H','Q_L','S_A_H','S_B_H','p_A_L','s_A_L','p_B_HHH','L';
        'Q_H','Q_H','S_A_L','S_B_L','p_A_H','s_A_H','p_B_HLL','H';
        'Q_H','Q_H','S_A_L','S_B_H','p_A_H','s_A_H','p_B_HLH','H';
        'Q_H','Q_H','S_A_H','S_B_L','p_A_L','s_A_L','p_B_HHL','L';
        'Q_H','Q_H','S_A_H','S_B_H','p_A_L','s_A_L','p_B_HHH','L'};

for k=1:size(events,1)
    Q_1{k}=events{k,1};    
    Q_2{k}=events{k,2};
    S_A{k}=events{k,3};
    S_B{k}=events{k,4};
    revealedtypeA{k}=events{k,8};
    cases2{k}=vector_cases2{k};
    P_scenario{k}=scenario_probability_char(Q_1{k},Q_2{k},S_A{k},S_B{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    [utility_A_first_period{k},utility_B_first_period{k},utility_S_first_period{k}]=utilities_first_period_char(Q_1{k},Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases1,revealedtypeA{k});
    utility_A_first_period{k}=subs(utility_A_first_period{k},{p_A,s_A,p_B},{events{k,5},events{k,6},events{k,7}});
    utility_B_first_period{k}=subs(utility_B_first_period{k},{p_A,s_A,p_B},{events{k,5},events{k,6},events{k,7}});
    utility_S_first_period{k}=subs(utility_S_first_period{k},{p_A,s_A,p_B},{events{k,5},events{k,6},events{k,7}});
    [utility_A_second_period{k},utility_B_second_period{k},utility_S_second_period{k}]=utilities_second_period_char(Q_2{k},Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases2{k},revealedtypeA{k});
    utility_A_second_period{k}=subs(utility_A_second_period{k},{p_A,s_A,p_B},{events{k,5},events{k,6},events{k,7}});
    utility_B_second_period{k}=subs(utility_B_second_period{k},{p_A,s_A,p_B},{events{k,5},events{k,6},events{k,7}});
    utility_S_second_period{k}=subs(utility_S_second_period{k},{p_A,s_A,p_B},{events{k,5},events{k,6},events{k,7}});
    [utility_A{k},utility_B{k},utility_S{k}]=discounted_total_utilities(utility_A_first_period{k},utility_B_first_period{k},utility_S_first_period{k},utility_A_second_period{k},utility_B_second_period{k},utility_S_second_period{k},beta);
end

expected_utility_objective_A_cheat_A=0;
expected_utility_objective_B_cheat_A=0;
expected_utility_objective_S_cheat_A=0;
for k=1:size(events,1)
    expected_utility_objective_A_cheat_A=expected_utility_objective_A_cheat_A+P_scenario{k}*utility_A{k};
    expected_utility_objective_B_cheat_A=expected_utility_objective_B_cheat_A+P_scenario{k}*utility_B{k};
    expected_utility_objective_S_cheat_A=expected_utility_objective_S_cheat_A+P_scenario{k}*utility_S{k};
end

end

