close all; clear; clc;

%% Simulation parameters
N_range = 3:1:5;
M = 10;
k_range = 1.5:0.5:3;
% k_range = 1.5;
td_range = 25:10:45;

% addpath('results\');

% case 1
k = 1.5;
td = 25;

fig1 = figure('position',[10 10 560 420]);
ax11 = axes('Parent',fig1,'XLim',[-350 350],'YLim',[-50 700], 'xtick', -350:150:350, 'ytick', -50:150:700,...
    'xgrid','on','ygrid','on','xminorgrid','on','yminorgrid','on','minorgridlinestyle','-',...
    'xminortick','on','yminortick', 'on',...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');
fig2 = figure('position',[570 10 560 420]);
ax12 = copyobj(ax11,fig2);
set(ax12,'XLim',[0 25],'YLim',[-5 1]);

fig3 = figure('position',[1130 10 560 420]);
ax13 = copyobj(ax11,fig3);
set(ax13,'XLim',[0 25],'YLim',[-10 10]);

C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

for i_N = 1:length(N_range)
    N = N_range(i_N);
    filename = strcat('results_td',num2str(td),'_N',num2str(N),...
        '_M',num2str(M),'_k',num2str(k),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    pos_X = data.ans(5,:);
    pos_Y = data.ans(6,:);
    psi = data.ans(7,:)*180/pi;
    acc = data.ans(8,:);
    ksi = data.ans(13,:);

    li11(i_N) = line('parent',ax11,'xdata',pos_X,'ydata',pos_Y,...
        'color',C_map(i_N,:),'linewidth',4);

    li12(i_N) = line('parent',ax12,'xdata',t,'ydata',ksi,...
        'color',C_map(i_N,:),'linewidth',4);

    li13(i_N) = line('parent',ax13,'xdata',t,'ydata',acc,...
        'color',C_map(i_N,:),'linewidth',4);
end
xlabel(ax11,'East [m]','fontsize',20,'FontWeight','bold')
ylabel(ax11,'North [m]','fontsize',20,'FontWeight','bold')
legend(ax11,[li11(1) li11(2) li11(3)], {'N = 3' 'N = 4' 'N = 5'},'Location','NW')
title(ax11, "2D Trajectory", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

xlabel(ax12,'time [s]','fontsize',20,'FontWeight','bold')
ylabel(ax12,'[s]','fontsize',20,'FontWeight','bold')
legend(ax12,[li12(1) li12(2) li12(3)], {'N = 3' 'N = 4' 'N = 5'},'Location','SE')
title(ax12, "Impact time error", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

xlabel(ax13,'time [s]','fontsize',20,'FontWeight','bold')
ylabel(ax13,'[m/s^2]','fontsize',20,'FontWeight','bold')
legend(ax13,[li13(1) li13(2) li13(3)], {'N = 3' 'N = 4' 'N = 5'},'Location','NE')
title(ax13, "Acceleration of ITCG", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

% case 2
clear('N','k','td','i_N')
N = 3;
k = 1.5:0.5:3;
t_d = 25;

fig4 = figure();
ax21 = axes('Parent',fig4,'XLim',[-350 350],'YLim',[-50 700],...
    'xgrid','on','ygrid','on','xminorgrid','on','yminorgrid','on','minorgridlinestyle','-',...
    'minorgridlinewidthmode','auto','fontsize',16,'fontname','Times New Roman','fontangle','italic');
fig5 = figure();
ax22 = copyobj(ax21,fig5);
set(ax22,'XLim',[0 25],'YLim',[-5 1]);

fig6 = figure();
ax23 = copyobj(ax21,fig6);
set(ax23, 'XLim',[0 25],'YLim',[-10 10]);

for i = 1:length(k_range)
    k = k_range(i);
    filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
        '_M',num2str(M),'_k',num2str(k),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    pos_X = data.ans(5,:);
    pos_Y = data.ans(6,:);
    psi = data.ans(7,:)*180/pi;
    acc = data.ans(8,:);
    ksi = data.ans(13,:);

    li21(i) = line('parent',ax21,'xdata',pos_X,'ydata',pos_Y,...
        'color',C_map(i,:),'linewidth',4);

    li22(i) = line('parent',ax22,'xdata',t,'ydata',ksi,...
        'color',C_map(i,:),'linewidth',4);

    li23(i) = line('parent',ax23,'xdata',t,'ydata',acc,...
        'color',C_map(i,:),'linewidth',4);

end
xlabel(ax21,'East [m]','fontsize',20,'FontWeight','bold')
ylabel(ax21,'North [m]','fontsize',20,'FontWeight','bold')
legend(ax21,[li21(1) li21(2) li21(3) li21(4)], {'k = 1.5' 'k = 2' 'k = 2.5' 'k = 3'},'Location','NW')
title(ax21, "2D Trajectory", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

xlabel(ax22,'time [s]','fontsize',20,'FontWeight','bold')
ylabel(ax22,'[s]','fontsize',20,'FontWeight','bold')
legend(ax22,[li22(1) li22(2) li22(3) li22(4)], {'k = 1.5' 'k = 2' 'k = 2.5' 'k = 3'},'Location','SE')
title(ax22, "Impact time error", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

xlabel(ax23,'time [s]','fontsize',20,'FontWeight','bold')
ylabel(ax23,'[m/s^2]','fontsize',20,'FontWeight','bold')
legend(ax23,[li23(1) li23(2) li23(3) li23(4)], {'k = 1.5' 'k = 2' 'k = 2.5' 'k = 3'},'Location','NE')
title(ax23, "Acceleration of ITCG", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

% case 3
clear('N','k','td','i_N','i')

N = 3;
k = 1.5;
t_d = 25:5:45;

fig7 = figure();
ax31 = axes('Parent',fig7,'XLim',[-350 350],'YLim',[-50 700],...
    'xgrid','on','ygrid','on','xminorgrid','on','yminorgrid','on','minorgridlinestyle','-',...
    'minorgridlinewidthmode','auto','fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig8 = figure();
ax32 = copyobj(ax31,fig8);
set(ax32,'XLim',[0 45],'YLim',[-25 2],'xtick',0:5:45);

fig9 = figure();
ax33 = copyobj(ax31,fig9);
set(ax33,'XLim',[0 45],'YLim',[-10 10],'xtick',0:5:45);

for i = 1:length(td_range)
    t_d = td_range(i);
    filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
        '_M',num2str(M),'_k',num2str(k),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    pos_X = data.ans(5,:);
    pos_Y = data.ans(6,:);
    psi = data.ans(7,:)*180/pi;
    acc = data.ans(8,:);
    ksi = data.ans(13,:);
    % t_go = data.ans(13,:);

    li31(i) = line('parent',ax31,'xdata',pos_X,'ydata',pos_Y,...
        'color',C_map(i,:),'linewidth',4);

    li32(i) = line('parent',ax32,'xdata',t,'ydata',ksi,...
        'color',C_map(i,:),'linewidth',4);

    li33(i) = line('parent',ax33,'xdata',t,'ydata',acc,...
        'color',C_map(i,:),'linewidth',4);

end
xlabel(ax31,'East [m]','fontsize',20,'FontWeight','bold')
ylabel(ax31,'North [m]','fontsize',20,'FontWeight','bold')
legend(ax31,[li31(1) li31(2) li31(3)], {'t_d = 25' 't_d = 35' 't_d = 45'},'Location','SE')
title(ax31, "2D Trajectory", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

xlabel(ax32,'time [s]','fontsize',20,'FontWeight','bold')
ylabel(ax32,'[s]','fontsize',20,'FontWeight','bold')
legend(ax32,[li32(1) li32(2) li32(3)], {'t_d = 25' 't_d = 35' 't_d = 45'},'Location','SE')
title(ax32, "Impact time error", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

xlabel(ax33,'time [s]','fontsize',20,'FontWeight','bold')
ylabel(ax33,'[m/s^2]','fontsize',20,'FontWeight','bold')
legend(ax33,[li33(1) li33(2) li33(3)], {'t_d = 25' 't_d = 35' 't_d = 45'},'Location','NE')
title(ax33, "Acceleration of ITCG", 'fontsize',16,'fontname','Times New Roman','fontangle','italic')

% % Kinetic Energy
% clear('N','k','td','i_N','i')
% 
% for i_N = 1:length(N_range)
%     for i_k = 1:length(k_range)
%         for i_td = 1:length(td_range)
%             N = N_range(i_N);
%             k = k_range(i_k);
%             td = td_range(i_td);
%             filename = strcat('results_td',num2str(td),'_N',num2str(N),...
%                 '_M',num2str(M),'_k',num2str(k),'.mat');
%             data = load(filename);
%             t = data.ans(1,:);
%             V0 = data.ans(2,:);
%             acc = data.ans(8,:);
%             V(1) = 0;
%             E(1) = 0;
%             V_in(1) = 0;
%             for i_E = 1:length(t)-1
%                 dt = t(i_E + 1) - t(i_E);
%                 V(i_E + 1) = abs(acc(i_E))*dt;
%                 V_in(i_E + 1) = V_in(i_E) + abs(acc(i_E))*dt;
%             end
%             E_tot{i_N}(i_k,i_td) = 1/2*(V_in(end))^2;
%             clear('V','V_in')
%         end
%     end
% end
