clear all;
close all;
clc;

syms p_A s_A p_B
syms Q_L Q_H Q_TL Q_TH
syms c_A c_B

syms lambda
syms beta

syms U_A_first_period U_A_second_period U_A
syms U_B_second_period U_B
syms U_s_first_period U_s_second_period U_s

syms Q_first_period Q_second_period
syms S_A_first_period S_B_second_period

syms P_L P_H P_LL P_LH P_HL P_HH T_P_LL T_P_HL
syms S_A_LL S_A_LH S_A_HL S_A_HH
syms S_B_LL S_B_LH S_B_HL S_B_HH
syms Q_L Q_H S_A_L S_A_H S_B_L S_B_H
syms F_C_A

syms p_A_L s_A_L
syms p_A_H s_A_H
syms p_B_LLL p_B_LLH p_B_LHL p_B_LHH p_B_HLL p_B_HLH p_B_HHL p_B_HHH
%meaning: first index: Q_1
%         second index: A's choice
%         third index: B's signal

T = sym('T%d%d', [2 2]);
T(1,1)=P_LL;
T(1,2)=P_LH;
T(2,1)=P_HL;
T(2,2)=P_HH;

cases1='s_A<=p_A';
            
tic

counter=1;

for k1=1:2 %1:1 %relationship between s_A_L,p_A_L and p_B_LLL
    for k2=1:2 %1:1 %relationship between s_A_H,p_A_H and p_B_LHL
        for k3=1:2 %1:1 %relationship between s_A_H,p_A_H  and p_B_H_H_L
            for k4=1:2 %1:1 %relationship between s_A_L,p_A_L and p_B_H_L_L
                [vector_cases2,extra_linear_constraints]=generate_vector_cases2_mod(k1,k2,k3,k4);
     
%first_simplification: insert probability constraints;
%second_simplification: same information for S and B;
%third_simplification: perfect information for A;

%%%%%%%%
[expected_utility_objective_A,expected_utility_objective_B,expected_utility_objective_S]=expected_utilities_objective_revelation(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
expected_utility_objective_S_simplified=simplify(subs(expected_utility_objective_S,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
expected_utility_objective_S_simplified_2=simplify(subs(expected_utility_objective_S_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
expected_utility_objective_S_simplified_3=simplify(subs(expected_utility_objective_S_simplified_2,{S_A_LL,S_A_HL},{1,0}));
%%%%%%%%

%%%%%%%%
[participation_constraint_A_L,participation_constraint_A_H]=participation_constraint_A(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_A_L_simplified=simplify(subs(participation_constraint_A_L,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
participation_constraint_A_L_simplified_2=simplify(subs(participation_constraint_A_L_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
participation_constraint_A_L_simplified_3=simplify(subs(participation_constraint_A_L_simplified_2,{S_A_LL,S_A_HL},{1,0}));

participation_constraint_A_H_simplified=simplify(subs(participation_constraint_A_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
participation_constraint_A_H_simplified_2=simplify(subs(participation_constraint_A_H_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
participation_constraint_A_H_simplified_3=simplify(subs(participation_constraint_A_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));
%%%%%%%%%%%%%%%%

%%%%%%%%
[participation_constraint_B_L_L_L,participation_constraint_B_L_L_H,participation_constraint_B_L_H_L,participation_constraint_B_L_H_H,participation_constraint_B_H_L_L,participation_constraint_B_H_L_H,participation_constraint_B_H_H_L,participation_constraint_B_H_H_H]=participation_constraint_B(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
participation_constraint_B_L_L_L_simplified=simplify(subs(participation_constraint_B_L_L_L,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
participation_constraint_B_L_L_L_simplified_2=simplify(subs(participation_constraint_B_L_L_L_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
participation_constraint_B_L_L_L_simplified_3=simplify(subs(participation_constraint_B_L_L_L_simplified_2,{S_A_LL,S_A_HL},{1,0}));

%participation_constraint_B_L_L_H_simplified=simplify(subs(participation_constraint_B_L_L_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
%participation_constraint_B_L_L_H_simplified_2=simplify(subs(participation_constraint_B_L_L_H_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
%participation_constraint_B_L_L_H_simplified_3=simplify(subs(participation_constraint_B_L_L_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));

participation_constraint_B_L_H_L_simplified=simplify(subs(participation_constraint_B_L_H_L,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
participation_constraint_B_L_H_L_simplified_2=simplify(subs(participation_constraint_B_L_H_L_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
participation_constraint_B_L_H_L_simplified_3=simplify(subs(participation_constraint_B_L_H_L_simplified_2,{S_A_LL,S_A_HL},{1,0}));

% participation_constraint_B_L_H_H_simplified=simplify(subs(participation_constraint_B_L_H_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
% participation_constraint_B_L_H_H_simplified_2=simplify(subs(participation_constraint_B_L_H_H_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
% participation_constraint_B_L_H_H_simplified_3=simplify(subs(participation_constraint_B_L_H_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));

participation_constraint_B_H_L_L_simplified=simplify(subs(participation_constraint_B_H_L_L,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
participation_constraint_B_H_L_L_simplified_2=simplify(subs(participation_constraint_B_H_L_L_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
participation_constraint_B_H_L_L_simplified_3=simplify(subs(participation_constraint_B_H_L_L_simplified_2,{S_A_LL,S_A_HL},{1,0}));

%participation_constraint_B_H_L_H_simplified=simplify(subs(participation_constraint_B_H_L_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
%participation_constraint_B_H_L_H_simplified_2=simplify(subs(participation_constraint_B_H_L_H_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
%participation_constraint_B_H_L_H_simplified_3=simplify(subs(participation_constraint_B_H_L_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));

participation_constraint_B_H_H_L_simplified=simplify(subs(participation_constraint_B_H_H_L,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
participation_constraint_B_H_H_L_simplified_2=simplify(subs(participation_constraint_B_H_H_L_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
participation_constraint_B_H_H_L_simplified_3=simplify(subs(participation_constraint_B_H_H_L_simplified_2,{S_A_LL,S_A_HL},{1,0}));

% participation_constraint_B_H_H_H_simplified=simplify(subs(participation_constraint_B_H_H_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
% participation_constraint_B_H_H_H_simplified_2=simplify(subs(participation_constraint_B_H_H_H_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
% participation_constraint_B_H_H_H_simplified_3=simplify(subs(participation_constraint_B_H_H_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));
%%%%%%%%

%%%%%%%%
[incentive_compatibility_constraint_A_L,incentive_compatibility_constraint_A_H]=incentive_compatibility_constraint_A(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_TL,Q_TH,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
incentive_compatibility_constraint_A_L_simplified=simplify(subs(incentive_compatibility_constraint_A_L,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
incentive_compatibility_constraint_A_L_simplified_2=simplify(subs(incentive_compatibility_constraint_A_L_simplified,{S_B_LL,S_B_LH,S_B_HL,S_B_HH,p_B_LLH,p_B_LHL,p_B_HLH,p_B_HHL},{1/2,1/2,1/2,1/2,p_B_LLL,p_B_LHH,p_B_HLL,p_B_HHH}));
incentive_compatibility_constraint_A_L_simplified_3=simplify(subs(incentive_compatibility_constraint_A_L_simplified_2,{S_A_LL,S_A_HL},{1,0}));

incentive_compatibility_constraint_A_H_simplified=simplify(subs(incentive_compatibility_constraint_A_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
incentive_compatibility_constraint_A_H_simplified_2=simplify(subs(incentive_compatibility_constraint_A_H_simplified,{S_B_LL,S_B_LH,S_B_HL,S_B_HH,p_B_LLH,p_B_LHL,p_B_HLH,p_B_HHL},{1/2,1/2,1/2,1/2,p_B_LLL,p_B_LHH,p_B_HLL,p_B_HHH}));
incentive_compatibility_constraint_A_H_simplified_3=simplify(subs(incentive_compatibility_constraint_A_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));

extra_linear_constraints;
% %%%%%%%%

[coefficients_objective,costs_objective]=find_coefficients_linear_function_column(expected_utility_objective_S_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_participation_constraint_A_L,costs_participation_constraint_A_L]=find_coefficients_linear_function_row(participation_constraint_A_L_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_participation_constraint_A_H,costs_participation_constraint_A_H]=find_coefficients_linear_function_row(participation_constraint_A_H_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_participation_constraint_B_L_L_L,costs_participation_constraint_B_L_L_L]=find_coefficients_linear_function_row(participation_constraint_B_L_L_L_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_participation_constraint_B_L_H_L,costs_participation_constraint_B_L_H_L]=find_coefficients_linear_function_row(participation_constraint_B_L_H_L_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_participation_constraint_B_H_L_L,costs_participation_constraint_B_H_L_L]=find_coefficients_linear_function_row(participation_constraint_B_H_L_L_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_participation_constraint_B_H_H_L,costs_participation_constraint_B_H_H_L]=find_coefficients_linear_function_row(participation_constraint_B_H_H_L_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_incentive_compatibility_constraint_A_L,costs_incentive_compatibility_constraint_A_L]=find_coefficients_linear_function_row(incentive_compatibility_constraint_A_L_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
[coefficients_incentive_compatibility_constraint_A_H,costs_incentive_compatibility_constraint_A_H]=find_coefficients_linear_function_row(incentive_compatibility_constraint_A_H_simplified_3,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
clear coefficients_extra_linear_constraints;
clear costs_extra_linear_constraints;
for index=1:size(extra_linear_constraints,1)
    [coefficients_extra_linear_constraints(index,:),costs_extra_linear_constraints(index,:)]=find_coefficients_linear_function_row(extra_linear_constraints(index),s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL,c_A,c_B);
end

f{counter}=-coefficients_objective;
A{counter}=-[coefficients_participation_constraint_A_L; %Ax+b >=0; Ax >=-b; -Ax<=b;
   coefficients_participation_constraint_A_H;
   coefficients_participation_constraint_B_L_L_L;
   coefficients_participation_constraint_B_L_H_L;
   coefficients_participation_constraint_B_H_L_L;
   coefficients_participation_constraint_B_H_H_L;
   coefficients_incentive_compatibility_constraint_A_L;
   coefficients_incentive_compatibility_constraint_A_H;
   coefficients_extra_linear_constraints];
b{counter}=[costs_participation_constraint_A_L;
   costs_participation_constraint_A_H;
   costs_participation_constraint_B_L_L_L;
   costs_participation_constraint_B_L_H_L;
   costs_participation_constraint_B_H_L_L;
   costs_participation_constraint_B_H_H_L;
   costs_incentive_compatibility_constraint_A_L;
   costs_incentive_compatibility_constraint_A_H;
   costs_extra_linear_constraints];
b{counter}=b{counter}*[c_A;
     c_B];
b{counter}(1,1)=b{counter}(1,1)-F_C_A;
b{counter}(2,1)=b{counter}(2,1)-F_C_A;
Aeq=[];
beq=[];
lb=zeros(8,1);
ub=[];

f_temp_1=subs(f{counter},{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)});
A_temp_1=subs(A{counter},{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)});
b_temp_1=subs(b{counter},{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)});

f_temp=subs(f_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});
A_temp=subs(A_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});
b_temp=subs(b_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});

f_num=eval(subs(f_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,10}));
A_num=eval(subs(A_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,10}));
b_num=eval(subs(b_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,10}));

[x,fval]=linprog(f_num,A_num,b_num,Aeq,beq,lb,ub);
if size(x,1)>0
    solution(counter,:)=x';
    cost(counter,1)=fval;
    objective=-fval;
else
    solution(counter,:)=nan(1,8);
    cost(counter,1)=NaN;
    objective=-NaN;
end
counter=counter+1;

end
end
end
end

toc

[I,J]=min(cost);
optimal_solution=solution(J,:)
optimal_cost=cost(J,:)

save workspace_simulations_price_volume_agreement_mod.mat

%%%%

tic

for counter=1:size(A,2)
    
    f_temp_1=subs(f{counter},{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)});
    A_temp_1=subs(A{counter},{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)});
    b_temp_1=subs(b{counter},{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)});

    f_temp=subs(f_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});
    A_temp=subs(A_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});
    b_temp=subs(b_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});

    f_num=eval(subs(f_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}));
    A_num=eval(subs(A_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}));
    b_num=eval(subs(b_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}));

    [x,fval]=linprog(f_num,A_num,b_num,Aeq,beq,lb,ub);
    if size(x,1)>0
        solution(counter,:)=x';
        cost(counter,1)=fval;
        objective=-fval;
    else
        solution(counter,:)=nan(1,8);
        cost(counter,1)=NaN;
        objective=-NaN;
    end
    
end

    toc

[I,J]=min(cost);
optimal_solution=solution(J,:)
optimal_cost=cost(J,:)

tolerance=10^(-7);
alternative_indices=find(cost<=(optimal_cost+tolerance));
solution(alternative_indices,:)

optimal_participation_constraint_A_L_temp_1=eval(subs(-A{J}(1,:)*optimal_solution'+b{J}(1,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_participation_constraint_A_H_temp_1=eval(subs(-A{J}(2,:)*optimal_solution'+b{J}(2,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_participation_constraint_B_L_L_L_temp_1=eval(subs(-A{J}(3,:)*optimal_solution'+b{J}(3,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_participation_constraint_B_L_H_L_temp_1=eval(subs(-A{J}(4,:)*optimal_solution'+b{J}(4,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_participation_constraint_B_H_L_L_temp_1=eval(subs(-A{J}(5,:)*optimal_solution'+b{J}(5,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_participation_constraint_B_H_H_L_temp_1=eval(subs(-A{J}(6,:)*optimal_solution'+b{J}(6,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_incentive_compatibility_constraint_A_L_temp_1=eval(subs(-A{J}(7,:)*optimal_solution'+b{J}(7,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));
optimal_incentive_compatibility_constraint_A_H_temp_1=eval(subs(-A{J}(8,:)*optimal_solution'+b{J}(8,:),{Q_TL,Q_TH},{(1*Q_L+beta*(P_LL*Q_L+(1-P_LL)*Q_H))/(1+beta),(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)}));

optimal_participation_constraint_A_L_temp=eval(subs(optimal_participation_constraint_A_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_A_H_temp=eval(subs(optimal_participation_constraint_A_H_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_L_L_L_temp=eval(subs(optimal_participation_constraint_B_L_L_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_L_H_L_temp=eval(subs(optimal_participation_constraint_B_L_H_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_H_L_L_temp=eval(subs(optimal_participation_constraint_B_H_L_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_H_H_L_temp=eval(subs(optimal_participation_constraint_B_H_H_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_incentive_compatibility_constraint_A_L_temp=eval(subs(optimal_incentive_compatibility_constraint_A_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_incentive_compatibility_constraint_A_H_temp=eval(subs(optimal_incentive_compatibility_constraint_A_H_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));

optimal_participation_constraint_A_L=eval(subs(optimal_participation_constraint_A_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_participation_constraint_A_H=eval(subs(optimal_participation_constraint_A_H_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_participation_constraint_B_L_L_L=eval(subs(beta*optimal_participation_constraint_B_L_L_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_participation_constraint_B_L_H_L=eval(subs(beta*optimal_participation_constraint_B_L_H_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_participation_constraint_B_H_L_L=eval(subs(beta*optimal_participation_constraint_B_H_L_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_participation_constraint_B_H_H_L=eval(subs(beta*optimal_participation_constraint_B_H_H_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_incentive_compatibility_constraint_A_L=eval(subs(beta*optimal_incentive_compatibility_constraint_A_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))
optimal_incentive_compatibility_constraint_A_H=eval(subs(beta*optimal_incentive_compatibility_constraint_A_H_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1}))

optimal_participation_constraint_A=eval(subs(optimal_participation_constraint_A_L*P_L+optimal_participation_constraint_A_H*(1-P_L),P_L,0.5))
optimal_participation_constraint_B=eval(subs(optimal_participation_constraint_B_L_L_L*P_L+optimal_participation_constraint_B_H_H_L*(1-P_L),P_L,0.5))

syms Q_T

average_price_A_L_1=optimal_solution(2)
average_price_A_H_1_temp=eval(subs((optimal_solution(4)*Q_T+optimal_solution(3)*(Q_H-Q_T))/Q_H,Q_T,(1*Q_H+beta*(P_HL*Q_L+(1-P_HL)*Q_H))/(1+beta)))
average_price_A_H_1=eval(subs(average_price_A_H_1_temp,{beta,P_HL,Q_L,Q_H,P_L},{0.8,0.3,2,5,0.5}))