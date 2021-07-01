load('figure1.mat','cost_B');
load('figure1.mat','optimal_cost_figure');
optimal_cost_figure1=optimal_cost_figure;
load('figure2.mat','optimal_cost_figure');
optimal_cost_figure2=optimal_cost_figure;

figure(1);
hold on
plot(cost_B,optimal_cost_figure1/10^6,'-','LineWidth',2,'Color','blue');
plot(cost_B,optimal_cost_figure2/10^6,'--','LineWidth',2,'Color','red');
xlabel('$c_B$ (EUR/unit)', 'interpreter', 'latex', 'Fontsize', 20);
ylabel('$C_S^\circ$ (m EUR)', 'interpreter', 'latex', 'Fontsize', 20, 'rotation', 90);
%set(get(gca,'ylabel'),'rotation',0);

leg1=legend('price-volume agreements for $m_A$','single-price contracts for $m_A$');
set(leg1,'Interpreter','latex','Location','southeast');
set(leg1,'FontSize',17);
%set(get(gca,'ylabel'),'rotation',0);

save figure1_final.mat;