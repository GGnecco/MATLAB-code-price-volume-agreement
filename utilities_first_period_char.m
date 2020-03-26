function [utility_A_first_period,utility_B_first_period,utility_S_first_period]=utilities_first_period_char(Q,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,cases1)

if strcmp(cases1,'s_A<=p_A')
    if strcmp(Q,'Q_L')
        utility_A_first_period=(p_A-c_A)*Q_L;
        utility_B_first_period=0;
        utility_S_first_period=-p_A*(1+lambda)*Q_L;
    elseif strcmp(Q,'Q_H')
        utility_A_first_period=(p_A-c_A)*Q_T+(s_A-c_A)*(Q_H-Q_T);
        utility_B_first_period=0;
        utility_S_first_period=-p_A*Q_T-s_A*(Q_H-Q_T)-lambda*p_A*Q_H;
    else
        utility_A_first_period=NaN;
        utility_B_first_period=NaN; 
        utility_S_first_period=NaN;
    end
else
    utility_A_first_period=NaN;
    utility_B_first_period=NaN; 
    utility_S_first_period=NaN;
end

end

