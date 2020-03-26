function conditional_P_scenario_Q_1_S_A_S_B=conditional_scenario_probability_char_Q_1_S_A_S_B(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH)

events={'Q_L','Q_L','S_A_L','S_B_L','p_A_L','s_A_L','p_B_LLL';
        'Q_L','Q_L','S_A_L','S_B_H','p_A_L','s_A_L','p_B_LLH';
        'Q_L','Q_L','S_A_H','S_B_L','p_A_H','s_A_H','p_B_LHL';
        'Q_L','Q_L','S_A_H','S_B_H','p_A_H','s_A_H','p_B_LHH';
        'Q_L','Q_H','S_A_L','S_B_L','p_A_L','s_A_L','p_B_LLL';
        'Q_L','Q_H','S_A_L','S_B_H','p_A_L','s_A_L','p_B_LLH';
        'Q_L','Q_H','S_A_H','S_B_L','p_A_H','s_A_H','p_B_LHL';
        'Q_L','Q_H','S_A_H','S_B_H','p_A_H','s_A_H','p_B_LHH';
        'Q_H','Q_L','S_A_L','S_B_L','p_A_L','s_A_L','p_B_HLL';
        'Q_H','Q_L','S_A_L','S_B_H','p_A_L','s_A_L','p_B_HLH';
        'Q_H','Q_L','S_A_H','S_B_L','p_A_H','s_A_H','p_B_HHL';
        'Q_H','Q_L','S_A_H','S_B_H','p_A_H','s_A_H','p_B_HHH';
        'Q_H','Q_H','S_A_L','S_B_L','p_A_L','s_A_L','p_B_HLL';
        'Q_H','Q_H','S_A_L','S_B_H','p_A_L','s_A_L','p_B_HLH';
        'Q_H','Q_H','S_A_H','S_B_L','p_A_H','s_A_H','p_B_HHL';
        'Q_H','Q_H','S_A_H','S_B_H','p_A_H','s_A_H','p_B_HHH'};
    
%1)
if (strcmp(Q_1,'Q_L') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_L'))
    possible_events=[1 5];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_L';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_L';
        S_B_temp{k}='S_B_L';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%2)
elseif (strcmp(Q_1,'Q_L') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_H'))
    possible_events=[2 6];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_L';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_L';
        S_B_temp{k}='S_B_H';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%3)
elseif (strcmp(Q_1,'Q_L') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_L'))
    possible_events=[3 7];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_L';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_H';
        S_B_temp{k}='S_B_L';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%4)
elseif (strcmp(Q_1,'Q_L') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_H'))
    possible_events=[4 8];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_L';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_H';
        S_B_temp{k}='S_B_H';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%5)
elseif (strcmp(Q_1,'Q_H') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_L'))
    possible_events=[9 13];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_H';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_L';
        S_B_temp{k}='S_B_L';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%6)
elseif (strcmp(Q_1,'Q_H') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_H'))
    possible_events=[10 14];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_H';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_L';
        S_B_temp{k}='S_B_H';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%7)
elseif (strcmp(Q_1,'Q_H') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_L'))
    possible_events=[11 15];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_H';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_H';
        S_B_temp{k}='S_B_L';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
%8)
elseif (strcmp(Q_1,'Q_H') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_H'))
    possible_events=[12 16];
    P_scenario_num=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    P_scenario_den=sym(0);
    for k=1:size(possible_events,2)
        Q_1_temp{k}='Q_H';    
        Q_2_temp{k}=events{possible_events(k),2};
        S_A_temp{k}='S_A_H';
        S_B_temp{k}='S_B_H';
        P_scenario_den=P_scenario_den+scenario_probability_char(Q_1_temp{k},Q_2_temp{k},S_A_temp{k},S_B_temp{k},T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH);
    end
end

conditional_P_scenario_Q_1_S_A_S_B=P_scenario_num/P_scenario_den;

end