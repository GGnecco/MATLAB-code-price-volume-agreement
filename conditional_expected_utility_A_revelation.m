function conditional_expected_utility_A=conditional_expected_utility_A_revelation(S_A,T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2)

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

events={'Q_L','Q_L','S_A_L','S_B_L','p_A_L','s_A_L','p_B_LLL','L';
        'Q_L','Q_L','S_A_L','S_B_H','p_A_L','s_A_L','p_B_LLH','L';
        'Q_L','Q_L','S_A_H','S_B_L','p_A_H','s_A_H','p_B_LHL','H';
        'Q_L','Q_L','S_A_H','S_B_H','p_A_H','s_A_H','p_B_LHH','H';
        'Q_L','Q_H','S_A_L','S_B_L','p_A_L','s_A_L','p_B_LLL','L';
        'Q_L','Q_H','S_A_L','S_B_H','p_A_L','s_A_L','p_B_LLH','L';
        'Q_L','Q_H','S_A_H','S_B_L','p_A_H','s_A_H','p_B_LHL','H';
        'Q_L','Q_H','S_A_H','S_B_H','p_A_H','s_A_H','p_B_LHH','H';
        'Q_H','Q_L','S_A_L','S_B_L','p_A_L','s_A_L','p_B_HLL','L';
        'Q_H','Q_L','S_A_L','S_B_H','p_A_L','s_A_L','p_B_HLH','L';
        'Q_H','Q_L','S_A_H','S_B_L','p_A_H','s_A_H','p_B_HHL','H';
        'Q_H','Q_L','S_A_H','S_B_H','p_A_H','s_A_H','p_B_HHH','H';
        'Q_H','Q_H','S_A_L','S_B_L','p_A_L','s_A_L','p_B_HLL','L';
        'Q_H','Q_H','S_A_L','S_B_H','p_A_L','s_A_L','p_B_HLH','L';
        'Q_H','Q_H','S_A_H','S_B_L','p_A_H','s_A_H','p_B_HHL','H';
        'Q_H','Q_H','S_A_H','S_B_H','p_A_H','s_A_H','p_B_HHH','H'};

%1)
if strcmp(S_A,'S_A_L')
    possible_events=[1 2 5 6 9 10 13 14];
    for k=1:size(possible_events,2)
        Q_1_temp{k}=events{possible_events(k),1};    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_L';
        S_B_temp{k}=events{possible_events(k),4};
        revealedtypeA_temp{k}=events{possible_events(k),8};
        cases2{k}=vector_cases2{possible_events(k)};
        conditional_P_scenario_S_A{k}=conditional_scenario_probability_char_S_A(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
        [utility_A_first_period{k},utility_B_first_period{k},utility_S_first_period{k}]=utilities_first_period_char(Q_1_temp{k},Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases1,revealedtypeA_temp{k});
        utility_A_first_period{k}=subs(utility_A_first_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_B_first_period{k}=subs(utility_B_first_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_S_first_period{k}=subs(utility_S_first_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        [utility_A_second_period{k},utility_B_second_period{k},utility_S_second_period{k}]=utilities_second_period_char(Q_2_temp{k},Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases2{k},revealedtypeA_temp{k});
        utility_A_second_period{k}=subs(utility_A_second_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_B_second_period{k}=subs(utility_B_second_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_S_second_period{k}=subs(utility_S_second_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        [utility_A{k},utility_B{k},utility_S{k}]=discounted_total_utilities(utility_A_first_period{k},utility_B_first_period{k},utility_S_first_period{k},utility_A_second_period{k},utility_B_second_period{k},utility_S_second_period{k},beta);
    end

    conditional_expected_utility_objective_A=0;
    conditional_expected_utility_objective_B=0;
    conditional_expected_utility_objective_S=0;
    for k=1:size(possible_events,2)
        conditional_expected_utility_objective_A=conditional_expected_utility_objective_A+conditional_P_scenario_S_A{k}*utility_A{k};
        conditional_expected_utility_objective_B=conditional_expected_utility_objective_B+conditional_P_scenario_S_A{k}*utility_B{k};
        conditional_expected_utility_objective_S=conditional_expected_utility_objective_S+conditional_P_scenario_S_A{k}*utility_S{k};
    end
%2)
elseif strcmp(S_A,'S_A_H')
    possible_events=[3 4 7 8 11 12 15 16];
    for k=1:size(possible_events,2)
        Q_1_temp{k}=events{possible_events(k),1};    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_H';
        S_B_temp{k}=events{possible_events(k),4};
        revealedtypeA_temp{k}=events{possible_events(k),8};
        cases2{k}=vector_cases2{possible_events(k)};
        conditional_P_scenario_S_A{k}=conditional_scenario_probability_char_S_A(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
        [utility_A_first_period{k},utility_B_first_period{k},utility_S_first_period{k}]=utilities_first_period_char(Q_1_temp{k},Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases1,revealedtypeA_temp{k});
        utility_A_first_period{k}=subs(utility_A_first_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_B_first_period{k}=subs(utility_B_first_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_S_first_period{k}=subs(utility_S_first_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        [utility_A_second_period{k},utility_B_second_period{k},utility_S_second_period{k}]=utilities_second_period_char(Q_2_temp{k},Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases2{k},revealedtypeA_temp{k});
        utility_A_second_period{k}=subs(utility_A_second_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_B_second_period{k}=subs(utility_B_second_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        utility_S_second_period{k}=subs(utility_S_second_period{k},{p_A,s_A,p_B},{events{possible_events(k),5},events{possible_events(k),6},events{possible_events(k),7}});
        [utility_A{k},utility_B{k},utility_S{k}]=discounted_total_utilities(utility_A_first_period{k},utility_B_first_period{k},utility_S_first_period{k},utility_A_second_period{k},utility_B_second_period{k},utility_S_second_period{k},beta);
    end

    conditional_expected_utility_objective_A=0;
    conditional_expected_utility_objective_B=0;
    conditional_expected_utility_objective_S=0;
    for k=1:size(possible_events,2)
        conditional_expected_utility_objective_A=conditional_expected_utility_objective_A+conditional_P_scenario_S_A{k}*utility_A{k};
        conditional_expected_utility_objective_B=conditional_expected_utility_objective_B+conditional_P_scenario_S_A{k}*utility_B{k};
        conditional_expected_utility_objective_S=conditional_expected_utility_objective_S+conditional_P_scenario_S_A{k}*utility_S{k};
    end
end

conditional_expected_utility_A=conditional_expected_utility_objective_A;

end

