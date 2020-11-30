function [utility_A_second_period,utility_B_second_period,utility_S_second_period]=utilities_second_period_char(Q,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,cases2,revelead_typeA)

if strcmp(cases2,'p_B<s_A<=p_A')
    if strcmp(Q,'Q_L')
        utility_A_second_period=0;
        utility_B_second_period=(p_B-c_B)*Q_L;
        utility_S_second_period=-p_B*Q_L;
    elseif strcmp(Q,'Q_H')
        if strcmp(revelead_typeA,'L')
            utility_A_second_period=0;
            utility_B_second_period=(p_B-c_B)*Q_H;
            utility_S_second_period=-p_B*Q_H;
        elseif strcmp(revelead_typeA,'H')
            utility_A_second_period=0;
            utility_B_second_period=(p_B-c_B)*Q_H;
            utility_S_second_period=-p_B*Q_H;
        end
    else
        utility_A_second_period=NaN;
        utility_B_second_period=NaN; 
        utility_S_second_period=NaN;
    end
elseif strcmp(cases2,'s_A<=p_B<p_A')
    if strcmp(Q,'Q_L')
        utility_A_second_period=0;
        utility_B_second_period=(p_B-c_B)*Q_L;
        utility_S_second_period=-p_B*Q_L;
    elseif strcmp(Q,'Q_H')
        if strcmp(revelead_typeA,'L')
            utility_A_second_period=(s_A-c_A)*(Q_H-Q_TL);
            utility_B_second_period=(p_B-c_B)*Q_TL;
            utility_S_second_period=-p_B*Q_TL-s_A*(Q_H-Q_TL)-lambda*p_A*Q_TL;
        elseif strcmp(revelead_typeA,'H')
            utility_A_second_period=(s_A-c_A)*(Q_H-Q_TH);
            utility_B_second_period=(p_B-c_B)*Q_TH;
            utility_S_second_period=-p_B*Q_TH-s_A*(Q_H-Q_TH)-lambda*p_A*Q_TH;
        end 
    else
        utility_A_second_period=NaN;
        utility_B_second_period=NaN; 
        utility_S_second_period=NaN;
    end
elseif strcmp(cases2,'s_A<=p_A<=p_B')
    if strcmp(Q,'Q_L')
        utility_A_second_period=(p_A-c_A)*Q_L;
        utility_B_second_period=0;
        utility_S_second_period=-p_A*(1+lambda)*Q_L;
    elseif strcmp(Q,'Q_H')
        if strcmp(revelead_typeA,'L')
            utility_A_second_period=(p_A-c_A)*Q_TL+(s_A-c_A)*(Q_H-Q_TL);
            utility_B_second_period=0;
            utility_S_second_period=-p_A*(1+lambda)*Q_TL-s_A*(Q_H-Q_TL)-lambda*p_A*(Q_H-Q_TL);
        elseif strcmp(revelead_typeA,'H')
            utility_A_second_period=(p_A-c_A)*Q_TH+(s_A-c_A)*(Q_H-Q_TH);
            utility_B_second_period=0;
            utility_S_second_period=-p_A*(1+lambda)*Q_TH-s_A*(Q_H-Q_TH)-lambda*p_A*(Q_H-Q_TH);
        end
    else
        utility_A_second_period=NaN;
        utility_B_second_period=NaN; 
        utility_S_second_period=NaN;
    end
else
    utility_A_second_period=NaN;
    utility_B_second_period=NaN; 
    utility_S_second_period=NaN;
end

end

