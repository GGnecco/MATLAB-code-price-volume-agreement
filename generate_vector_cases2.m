function [vector_cases2,extra_linear_constraints]=generate_vector_cases2(k1,k2,k3,k4)

syms s_A_L p_A_L s_A_H p_A_H p_B_LLL p_B_LHL p_B_HLL p_B_HHL

extra_linear_constraints_temp={};

%cases2_a='p_B<s_A<=p_A'; k1=1
%cases2_b='s_A<=p_B<p_A'; k1=2
%cases2_c='s_A<=p_A<=p_B'; k1=3

if k1==1 %s_A_L p_A_L p_B_LLL
    cases2_obtained{1}='p_B<s_A<=p_A'; 
    extra_linear_constraints_temp{1}=s_A_L-p_B_LLL;
elseif k1==2
    cases2_obtained{1}='s_A<=p_A<=p_B';
    extra_linear_constraints_temp{1}=p_B_LLL-p_A_L;
elseif k1==3
    cases2_obtained{1}='s_A<=p_B<p_A';
    extra_linear_constraints_temp{1}=[p_B_LLL-s_A_L;p_A_L-p_B_LLL];
end

if k2==1 %s_A_H p_A_H p_B_LHL
    cases2_obtained{2}='p_B<s_A<=p_A'; 
    extra_linear_constraints_temp{2}=s_A_H-p_B_LHL;
elseif k2==2
    cases2_obtained{2}='s_A<=p_A<=p_B';
    extra_linear_constraints_temp{2}=p_B_LHL-p_A_H;
elseif k2==3
    cases2_obtained{2}='s_A<=p_B<p_A';
    extra_linear_constraints_temp{2}=[p_B_LHL-s_A_H;p_A_H-p_B_LHL];
end

if k3==1 %s_A_H p_A_H p_B_HHL
    cases2_obtained{3}='p_B<s_A<=p_A'; 
    extra_linear_constraints_temp{3}=s_A_H-p_B_HHL;
elseif k3==2
    cases2_obtained{3}='s_A<=p_A<=p_B';
    extra_linear_constraints_temp{3}=p_B_HHL-p_A_H;
elseif k3==3
    cases2_obtained{3}='s_A<=p_B<p_A';
    extra_linear_constraints_temp{3}=[p_B_HHL-s_A_H;p_A_H-p_B_HHL];
end

if k4==1 %s_A_L p_A_L p_B_HLL
    cases2_obtained{4}='p_B<s_A<=p_A'; 
    extra_linear_constraints_temp{4}=s_A_L-p_B_HLL;
elseif k4==2
    cases2_obtained{4}='s_A<=p_A<=p_B';
    extra_linear_constraints_temp{4}=p_B_HLL-p_A_L;
elseif k4==3
    cases2_obtained{4}='s_A<=p_B<p_A';
    extra_linear_constraints_temp{4}=[p_B_HLL-s_A_L;p_A_L-p_B_HLL];
end

extra_linear_constraints_temp{5}=p_A_L-s_A_L;
extra_linear_constraints_temp{6}=p_A_H-s_A_H;

extra_linear_constraints=[];
for index=1:6
    extra_linear_constraints=[extra_linear_constraints;extra_linear_constraints_temp{index}];
end

vector_cases2={cases2_obtained{1};
               cases2_obtained{1};
               cases2_obtained{2};
               cases2_obtained{2};
               cases2_obtained{1};
               cases2_obtained{1};
               cases2_obtained{2};
               cases2_obtained{2};
               cases2_obtained{4};
               cases2_obtained{4};
               cases2_obtained{3};
               cases2_obtained{3};
               cases2_obtained{4};
               cases2_obtained{4};
               cases2_obtained{3};
               cases2_obtained{3}};
    
%vector_cases2={'p_B_LLL<s_A_L<=p_A_L'; %LLLL %demand_first_period %demand_second_period %signal_A %signal_B 
%              'p_B_LLL<s_A_L<=p_A_L'; %LLLH
%              'p_B_LHL<s_A_H<=p_A_H'; %LLHL
%              'p_B_LHL<s_A_H<=p_A_H'; %LLHH
%              'p_B_LLL<s_A_L<=p_A_L'; %LHLL
%              'p_B_LLL<s_A_L<=p_A_L'; %LHLH
%              'p_B_LHL<s_A_H<=p_A_H'; %LHHL
%              'p_B_LHL<s_A_H<=p_A_H'; %LHHH
%              'p_B_HLL<s_A_L<=p_A_L'; %HLLL
%              'p_B_HLL<s_A_L<=p_A_L'; %HLLH
%              'p_B_HHL<s_A_H<=p_A_H'; %HLHL
%              'p_B_HHL<s_A_H<=p_A_H'; %HLHH
%              'p_B_HLL<s_A_L<=p_A_L'; %HHLL
%              'p_B_HLL<s_A_L<=p_A_L'; %HHLH
%              'p_B_HHL<s_A_H<=p_A_H'; %HHHL
%              'p_B_HHL<s_A_H<=p_A_H'}; %HHHH

end