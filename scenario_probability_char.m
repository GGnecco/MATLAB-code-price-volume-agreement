function P_scenario=scenario_probability_char(Q_1,Q_2,S_A,S_B,T,P_L,P_H,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH)

%1)
if (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_L'))
    P_scenario=P_L*T(1,1)*S_A_LL*S_B_LL;
%2)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_H'))
    P_scenario=P_L*T(1,1)*S_A_LL*S_B_LH;
%3)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_L'))
    P_scenario=P_L*T(1,1)*S_A_LH*S_B_LL;
%4)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_H'))
    P_scenario=P_L*T(1,1)*S_A_LH*S_B_LH;
%5)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_L'))
    P_scenario=P_L*T(1,2)*S_A_LL*S_B_HL;
%6)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_H'))
    P_scenario=P_L*T(1,2)*S_A_LL*S_B_HH;
%7)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_L'))
    P_scenario=P_L*T(1,2)*S_A_LH*S_B_HL;
%8)
elseif (strcmp(Q_1,'Q_L') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_H'))
    P_scenario=P_L*T(1,2)*S_A_LH*S_B_HH;
%9)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_L'))
    P_scenario=P_H*T(2,1)*S_A_HL*S_B_LL;
%10)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_H'))
    P_scenario=P_H*T(2,1)*S_A_HL*S_B_LH;
%11)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_L'))
    P_scenario=P_H*T(2,1)*S_A_HH*S_B_LL;
%12)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_L') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_H'))
    P_scenario=P_H*T(2,1)*S_A_HH*S_B_LH;
%13)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_L'))
    P_scenario=P_H*T(2,2)*S_A_HL*S_B_HL;
%14)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_L') && strcmp(S_B,'S_B_H'))
    P_scenario=P_H*T(2,2)*S_A_HL*S_B_HH;
%15)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_L'))
    P_scenario=P_H*T(2,2)*S_A_HH*S_B_HL;
%16)
elseif (strcmp(Q_1,'Q_H') && strcmp(Q_2,'Q_H') && strcmp(S_A,'S_A_H') && strcmp(S_B,'S_B_H'))
    P_scenario=P_H*T(2,2)*S_A_HH*S_B_HH;
end