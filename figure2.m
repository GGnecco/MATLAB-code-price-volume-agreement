load workspace_simulations_price_volume_agreement_mod.mat

%%%%

price_B=[0:0.01:2];

optimal_cost_figure=zeros(size(price_B));

for index_price_B=1:size(price_B,2)

    tic

for counter=1:size(A,2)
    
    f_temp_1=subs(f{counter},Q_T,P_L*Q_L+(1-P_L)*Q_H);
    A_temp_1=subs(A{counter},Q_T,P_L*Q_L+(1-P_L)*Q_H);
    b_temp_1=subs(b{counter},Q_T,P_L*Q_L+(1-P_L)*Q_H);

    f_temp=subs(f_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});
    A_temp=subs(A_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});
    b_temp=subs(b_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL});

    f_num=eval(subs(f_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}));
    A_num=eval(subs(A_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}));
    b_num=eval(subs(b_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}));

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

optimal_cost_figure(index_price_B)=optimal_cost;
optimal_solution_figure(index_price_B,:)=optimal_solution;

%tolerance=10^(-7);
%alternative_indices=find(cost<=(optimal_cost+tolerance));

optimal_participation_constraint_A_L_temp_1=eval(subs(-A{J}(1,:)*optimal_solution'+b{J}(1,:),Q_T,P_L*Q_L+(1-P_L)*Q_H));
optimal_participation_constraint_A_H_temp_1=eval(subs(-A{J}(2,:)*optimal_solution'+b{J}(2,:),Q_T,P_L*Q_L+(1-P_L)*Q_H));
optimal_participation_constraint_B_L_L_L_temp_1=eval(subs(-A{J}(3,:)*optimal_solution'+b{J}(3,:),Q_T,P_L*Q_L+(1-P_L)*Q_H));
optimal_participation_constraint_B_L_H_L_temp_1=eval(subs(-A{J}(4,:)*optimal_solution'+b{J}(4,:),Q_T,P_L*Q_L+(1-P_L)*Q_H));
optimal_participation_constraint_B_H_L_L_temp_1=eval(subs(-A{J}(5,:)*optimal_solution'+b{J}(5,:),Q_T,P_L*Q_L+(1-P_L)*Q_H));
optimal_participation_constraint_B_H_H_L_temp_1=eval(subs(-A{J}(6,:)*optimal_solution'+b{J}(6,:),Q_T,P_L*Q_L+(1-P_L)*Q_H));

optimal_participation_constraint_A_L_temp=eval(subs(optimal_participation_constraint_A_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_A_H_temp=eval(subs(optimal_participation_constraint_A_H_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_L_L_L_temp=eval(subs(optimal_participation_constraint_B_L_L_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_L_H_L_temp=eval(subs(optimal_participation_constraint_B_L_H_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_H_L_L_temp=eval(subs(optimal_participation_constraint_B_H_L_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));
optimal_participation_constraint_B_H_H_L_temp=eval(subs(optimal_participation_constraint_B_H_H_L_temp_1,{P_LL,P_HL},{T_P_LL,T_P_HL}));

optimal_participation_constraint_A_L=eval(subs(optimal_participation_constraint_A_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}))
optimal_participation_constraint_A_H=eval(subs(optimal_participation_constraint_A_H_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}))
optimal_participation_constraint_B_L_L_L=eval(subs(beta*optimal_participation_constraint_B_L_L_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}))
optimal_participation_constraint_B_L_H_L=eval(subs(beta*optimal_participation_constraint_B_L_H_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}))
optimal_participation_constraint_B_H_L_L=eval(subs(beta*optimal_participation_constraint_B_H_L_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}))
optimal_participation_constraint_B_H_H_L=eval(subs(beta*optimal_participation_constraint_B_H_H_L_temp,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B},{0,0.8,2,5,0.5,0.7,0.3,1,1,price_B(index_price_B)}))

optimal_participation_constraint_A=eval(subs(optimal_participation_constraint_A_L*P_L+optimal_participation_constraint_A_H*(1-P_L),P_L,0.5))
optimal_participation_constraint_B=eval(subs(optimal_participation_constraint_B_L_L_L*P_L+optimal_participation_constraint_B_H_H_L*(1-P_L),P_L,0.5))

average_price_A_L_1=optimal_solution(2)
average_price_A_H_1_temp=eval(subs((optimal_solution(4)*Q_T+optimal_solution(3)*(Q_H-Q_T))/Q_H,Q_T,P_L*Q_L+(1-P_L)*Q_H))
average_price_A_H_1=eval(subs(average_price_A_H_1_temp,{Q_L,Q_H,P_L},{2,5,0.5}))

end

%%%%% check
% 
% counter=1;
% 
% for k1=1:3 %1:1 %relationship between s_A_L,p_A_L and p_B_LLL
%     for k2=1:3 %1:1 %relationship between s_A_H,p_A_H and p_B_LHL
%         for k3=1:3 %1:1 %relationship between s_A_H,p_A_H  and p_B_H_H_L
%             for k4=1:3 %1:1 %relationship between s_A_L,p_A_L and p_B_H_L_L
%                 
%                [vector_cases2,extra_linear_constraints]=generate_vector_cases2(k1,k2,k3,k4);
%      [expected_utility_objective_A,expected_utility_objective_B,expected_utility_objective_S]=expected_utilities_objective_revelation(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
% [participation_constraint_A_L,participation_constraint_A_H]=participation_constraint_A(T,P_L,P_H,P_LL,P_LH,P_HL,P_HH,S_A_LL,S_A_LH,S_A_HL,S_A_HH,S_B_LL,S_B_LH,S_B_HL,S_B_HH,Q_L,Q_H,Q_T,p_A,s_A,c_A,p_B,c_B,lambda,beta,cases1,vector_cases2);
% 
% trial_solution=solution(counter,:);
% 
% participation_constraint_A_H_simplified=simplify(subs(participation_constraint_A_H,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
% participation_constraint_A_H_simplified_2=simplify(subs(participation_constraint_A_H_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
% participation_constraint_A_H_simplified_3=simplify(subs(participation_constraint_A_H_simplified_2,{S_A_LL,S_A_HL},{1,0}));
% participation_constraint_A_H_simplified_4=subs(participation_constraint_A_H_simplified_3,Q_T,P_L*Q_L+(1-P_L)*Q_H);
% participation_constraint_A_H_simplified_5=subs(participation_constraint_A_H_simplified_4,{P_LL,P_HL},{T_P_LL,T_P_HL});
% 
% subs(participation_constraint_A_H_simplified_5,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1,trial_solution(1),trial_solution(2),trial_solution(3),trial_solution(4),trial_solution(5),trial_solution(6),trial_solution(7),trial_solution(8)})
% 
% expected_utility_objective_B_simplified=simplify(subs(expected_utility_objective_B,{P_H,P_LH,P_HH,S_A_LH,S_A_HH,S_B_LH,S_B_HH},{1-P_L,1-P_LL,1-P_HL,1-S_A_LL,1-S_A_HL,1-S_B_LL,1-S_B_HL}));
% expected_utility_objective_B_simplified_2=simplify(subs(expected_utility_objective_B_simplified,{S_B_LL,S_B_HL,p_B_LLH,p_B_LHH,p_B_HLH,p_B_HHH},{0.5,0.5,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL}));
% expected_utility_objective_B_simplified_3=simplify(subs(expected_utility_objective_B_simplified_2,{S_A_LL,S_A_HL},{1,0}));
% expected_utility_objective_B_simplified_4=subs(expected_utility_objective_B_simplified_3,Q_T,P_L*Q_L+(1-P_L)*Q_H);
% expected_utility_objective_B_simplified_5=subs(expected_utility_objective_B_simplified_4,{P_LL,P_HL},{T_P_LL,T_P_HL});
% 
% subs(expected_utility_objective_B_simplified_5,{lambda,beta,Q_L,Q_H,P_L,T_P_LL,T_P_HL,F_C_A,c_A,c_B,s_A_L,p_A_L,s_A_H,p_A_H,p_B_LLL,p_B_LHL,p_B_HLL,p_B_HHL},{0,0.8,2,5,0.5,0.7,0.3,1,1,0.1,trial_solution(1),trial_solution(2),trial_solution(3),trial_solution(4),trial_solution(5),trial_solution(6),trial_solution(7),trial_solution(8)})
% 
% counter=counter+1;
%             end
%         end
%     end
% end
% 

figure(1);
hold on
plot(price_B,optimal_cost_figure,'--','LineWidth',2,'Color','blue');
xlabel('$c_B$', 'interpreter', 'latex', 'Fontsize', 20);
ylabel('$C_S^\circ$', 'interpreter', 'latex', 'Fontsize', 20);
set(get(gca,'ylabel'),'rotation',0);

save figure2.mat

%figure(2);
%hold on
%plot(price_B,optimal_solution_figure(:,1)','-','LineWidth',2,'Color','yellow');
%plot(price_B,optimal_solution_figure(:,2)','-','LineWidth',2,'Color','green');
%plot(price_B,optimal_solution_figure(:,3)','-','LineWidth',2,'Color','blue');
%plot(price_B,optimal_solution_figure(:,4)','-','LineWidth',2,'Color','red');
%xlabel('$c_B$', 'interpreter', 'latex', 'Fontsize', 20);
%ylabel('m$_A$''s optimal prices', 'interpreter', 'latex', 'Fontsize', 20);
%leg1=legend('$s_{A_L}^\circ$','$p_{A_L}^\circ$','$s_{A_H}^\circ$','$p_{A_H}^\circ$');
%set(leg1,'Interpreter','latex','Location','east');
%set(leg1,'FontSize',17);
%%set(get(gca,'ylabel'),'rotation',0);

%figure(3);
%hold on
%plot(price_B,optimal_solution_figure(:,5)','-','LineWidth',2,'Color','yellow');
%plot(price_B,optimal_solution_figure(:,6)','-','LineWidth',2,'Color','green');
%plot(price_B,optimal_solution_figure(:,7)','-','LineWidth',2,'Color','blue');
%plot(price_B,optimal_solution_figure(:,8)','-','LineWidth',2,'Color','red');
%xlabel('$c_B$', 'interpreter', 'latex', 'Fontsize', 20);
%ylabel('m$_B$''s optimal prices', 'interpreter', 'latex', 'Fontsize', 20);
%leg2=legend('$P_{B_{LL}}^\circ$','$P_{B_{LH}}^\circ$','$P_{B_{HL}}^\circ$','$P_{B_{HH}}^\circ$');
%set(leg2,'Interpreter','latex','Location','east');
%set(leg2,'FontSize',20);
%%set(get(gca,'ylabel'),'rotation',0);