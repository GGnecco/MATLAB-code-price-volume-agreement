load('figure1.mat','price_B');
load('figure1.mat','optimal_cost_figure');
optimal_cost_figure1=optimal_cost_figure;
load('figure2.mat','optimal_cost_figure');
optimal_cost_figure2=optimal_cost_figure;

figure(1);
hold on
plot(price_B,optimal_cost_figure1,'-','LineWidth',2,'Color','blue');
plot(price_B,optimal_cost_figure2,'--','LineWidth',2,'Color','red');
xlabel('$c_B$', 'interpreter', 'latex', 'Fontsize', 20);
ylabel('$C_S^\circ$', 'interpreter', 'latex', 'Fontsize', 20);
set(get(gca,'ylabel'),'rotation',0);

leg1=legend('price-volume agreement for m$_A$','single-price contracts for m$_A$');
set(leg1,'Interpreter','latex','Location','southeast');
set(leg1,'FontSize',17);
%set(get(gca,'ylabel'),'rotation',0);

save figure1_final.mat;