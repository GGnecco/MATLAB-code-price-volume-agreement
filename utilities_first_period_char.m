function [utility_A_first_period,utility_B_first_period,utility_S_first_period]=utilities_first_period_char(Q,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases1,revelead_typeA)

if strcmp(cases1,'s_A<=p_A')
    if strcmp(Q,'Q_L')
        utility_A_first_period=(p_A-c_A)*Q_L;
        utility_B_first_period=0;
        utility_S_first_period=-p_A*(1+lambda)*Q_L;
    elseif strcmp(Q,'Q_H')
        if strcmp(revelead_typeA,'L')
            utility_A_first_period=(p_A-c_A)*Q_TL+(s_A-c_A)*(Q_H-Q_TL);
            utility_B_first_period=0;
            utility_S_first_period=-p_A*Q_TL-s_A*(Q_H-Q_TL)-lambda*p_A*Q_H;
        elseif strcmp(revelead_typeA,'H')
            utility_A_first_period=(p_A-c_A)*Q_TH+(s_A-c_A)*(Q_H-Q_TH);
            utility_B_first_period=0;
            utility_S_first_period=-p_A*Q_TH-s_A*(Q_H-Q_TH)-lambda*p_A*Q_H;
        end
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

