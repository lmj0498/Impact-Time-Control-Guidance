close all; clear; clc;

%% Simulation parameters
N_range = 3:1:5;
n_range = 1:2:5;
K_range = 8:2:12;
t_d_range = 23:4:31;
sigma_max_range = 45:10:65;
linewidth = 2;
fontsize=16;

% case 1
N = 3:1:5;
K = 8;
t_d = 23;
sigma_max = 45;
n = 5;

fig1 = figure();
ax1 = axes('Parent',fig1,'XLim',[0 23],'YLim',[00 700],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig2 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig2,'position',[0.13 0.80 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig2,'position',[0.13 0.57 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig2,'position',[0.13 0.34 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax5 = axes('Parent',fig2,'position',[0.13 0.11 0.80 0.15],...
    'XLim',[0 23],'YLim',[-10 sigma_max+5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig3 = figure();
ax6 = axes('Parent',fig3,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);


C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

for i = 1:length(N_range)
    N = N_range(i);
                filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
                    '_n',num2str(n),'_K',num2str(K),'_sigma_max',num2str(sigma_max),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    theta=data.ans(7,:)*180/pi;
    psi = data.ans(6,:)*180/pi;
    a_y_M = data.ans(8,:);
    a_z_M= data.ans(9, :);
    epsilon_t= data.ans(12, :);
    sigma = data.ans(11, :)*180/pi;
    phi_x = data.ans(13,:);
    R=data.ans(10, :);
    x = data.ans(3,:);
    y= data.ans(4, :);
    z = data.ans(5, :);

    li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
        'color',C_map(i,:),'linewidth',4);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',4);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',4);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', epsilon_t,...
        'color', C_map(i,:), 'linewidth', 4);

    li5(i) = line('parent', ax5, 'xdata', t, 'ydata', sigma,...
        'color', C_map(i,:), 'linewidth', 4); 

    li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
        'color',C_map(i,:),'linewidth',linewidth);
end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1) li1(2) li1(3)], {'N = 3' 'N = 4' 'N = 5'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'a_{yM} [m/s^2]','fontsize',16,'FontWeight','bold')
legend(ax2,[li1(1) li1(2) li1(3)], {'N = 3' 'N = 4' 'N = 5'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'a_{zM} [m/s^2]','fontsize',16,'FontWeight','bold')

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'impact time error [s]','fontsize',16,'FontWeight','bold')

xlabel(ax5,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax5,'\sigma [deg]','fontsize',16,'FontWeight','bold')

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li1(2) li1(3)], {'N = 3' 'N = 4' 'N = 5'} );

% case 2
N = 3;
K = 8:2:12;
t_d = 23;
sigma_max = 45;
n = 5;


fig4 = figure();
ax1 = axes('Parent',fig4,'XLim',[0 23],'YLim',[00 700],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig5 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig5,'position',[0.13 0.80 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig5,'position',[0.13 0.57 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig5,'position',[0.13 0.34 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax5 = axes('Parent',fig5,'position',[0.13 0.11 0.80 0.15],...
    'XLim',[0 23],'YLim',[-10 sigma_max+5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig6 = figure();
ax6 = axes('Parent',fig6,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);

C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

for i = 1:length(K_range)
    K = K_range(i);
    filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
    '_n',num2str(n),'_K',num2str(K),'_sigma_max',num2str(z),'.mat');
    t = data.ans(1,:);
    theta=data.ans(7,:)*180/pi;
    psi = data.ans(6,:)*180/pi;
    a_y_M = data.ans(8,:);
    a_z_M= data.ans(9, :);
    epsilon_t= data.ans(12, :);
    sigma = data.ans(11, :)*180/pi;
    phi_x = data.ans(13,:);
    R=data.ans(10, :);
    x = data.ans(3,:);
    y= data.ans(4, :);
    z = data.ans(5, :);

    li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
        'color',C_map(i,:),'linewidth',4);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',4);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',4);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', epsilon_t,...
        'color', C_map(i,:), 'linewidth', 4);

    li5(i) = line('parent', ax5, 'xdata', t, 'ydata', sigma,...
        'color', C_map(i,:), 'linewidth', 4); 

    li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
        'color',C_map(i,:),'linewidth',linewidth);
end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1) li1(2) li1(3)], {'K = 8' 'K = 2' 'K = 12'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'a_{yM} [m/s^2]','fontsize',16,'FontWeight','bold')
legend(ax2,[li1(1) li1(2) li1(3)], {'K = 8' 'K = 2' 'K = 12'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'a_{zM} [m/s^2]','fontsize',16,'FontWeight','bold')

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'impact time error [s]','fontsize',16,'FontWeight','bold')

xlabel(ax5,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax5,'\sigma [deg]','fontsize',16,'FontWeight','bold')

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li1(2) li1(3)], {'K = 8' 'K = 2' 'K = 12'} );

% case 3
N = 3;
K = 8;
t_d = 23;
sigma_max = 45;
n = 1:2:5;

fig7 = figure();
ax1 = axes('Parent',fig7,'XLim',[0 23],'YLim',[00 700],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig8 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig8,'position',[0.13 0.80 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig8,'position',[0.13 0.57 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig8,'position',[0.13 0.34 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax5 = axes('Parent',fig8,'position',[0.13 0.11 0.80 0.15],...
    'XLim',[0 23],'YLim',[-10 sigma_max+5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig9 = figure();
ax6 = axes('Parent',fig9,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);


C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

for i = 1:length(n_range)
    n = n_range(i);
    filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
    '_n',num2str(n),'_K',num2str(K),'_sigma_max',num2str(sigma_max),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    theta=data.ans(7,:)*180/pi;
    psi = data.ans(6,:)*180/pi;
    a_y_M = data.ans(8,:);
    a_z_M= data.ans(9, :);
    epsilon_t= data.ans(12, :);
    sigma = data.ans(11, :)*180/pi;
    phi_x = data.ans(13,:);
    R=data.ans(10, :);
    x = data.ans(3,:);
    y= data.ans(4, :);
    z = data.ans(5, :);

    li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
        'color',C_map(i,:),'linewidth',4);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',4);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',4);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', epsilon_t,...
        'color', C_map(i,:), 'linewidth', 4);

    li5(i) = line('parent', ax5, 'xdata', t, 'ydata', sigma,...
        'color', C_map(i,:), 'linewidth', 4); 

    li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
        'color',C_map(i,:),'linewidth',linewidth);

end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1) li1(2) li1(3)], {'n = 1' 'n = 3' 'n = 5'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'a_{yM} [m/s^2]','fontsize',16,'FontWeight','bold')
legend(ax2,[li1(1) li1(2) li1(3)], {'n = 1' 'n = 3' 'n = 5'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'a_{zM} [m/s^2]','fontsize',16,'FontWeight','bold')

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'impact time error [s]','fontsize',16,'FontWeight','bold')

xlabel(ax5,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax5,'\sigma [deg]','fontsize',16,'FontWeight','bold')

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li1(2) li1(3)], {'n = 1' 'n = 3' 'n = 5'} );

% case 4
N = 3;
K = 8;
t_d = 23:4:31;
sigma_max = 45;
n = 5;

fig10 = figure();
ax1 = axes('Parent',fig10,'XLim',[0 31],'YLim',[00 700],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig11 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig11,'position',[0.13 0.80 0.80 0.15],...
    'XLim',[0 31],'YLim',[-5 100],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig11,'position',[0.13 0.57 0.80 0.15],...
    'XLim',[0 31],'YLim',[-5 100],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig11,'position',[0.13 0.34 0.80 0.15],...
    'XLim',[0 31],'YLim',[-5 10],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax5 = axes('Parent',fig11,'position',[0.13 0.11 0.80 0.15],...
    'XLim',[0 31],'YLim',[-10 sigma_max+5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig12 = figure();
ax6 = axes('Parent',fig12,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);


C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

for i = 1:length(t_d_range)
    t_d = t_d_range(i);
    filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
    '_n',num2str(n),'_K',num2str(K),'_sigma_max',num2str(sigma_max),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    theta=data.ans(7,:)*180/pi;
    psi = data.ans(6,:)*180/pi;
    a_y_M = data.ans(8,:);
    a_z_M= data.ans(9, :);
    epsilon_t= data.ans(12, :);
    sigma = data.ans(11, :)*180/pi;
    phi_x = data.ans(13,:);
    R=data.ans(10, :);
    x = data.ans(3,:);
    y= data.ans(4, :);
    z = data.ans(5, :);

    li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
        'color',C_map(i,:),'linewidth',4);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',4);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',4);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', epsilon_t,...
        'color', C_map(i,:), 'linewidth', 4);

    li5(i) = line('parent', ax5, 'xdata', t, 'ydata', sigma,...
        'color', C_map(i,:), 'linewidth', 4); 

    li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
        'color',C_map(i,:),'linewidth',linewidth);

end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1) li1(2) li1(3)], {'t_d = 23' 't_d = 27' 't_d = 31'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'a_{yM} [m/s^2]','fontsize',16,'FontWeight','bold')
legend(ax2,[li1(1) li1(2) li1(3)], {'t_d = 23' 't_d = 27' 't_d = 31'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'a_{zM} [m/s^2]','fontsize',16,'FontWeight','bold')

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'impact time error [s]','fontsize',16,'FontWeight','bold')

xlabel(ax5,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax5,'\sigma [deg]','fontsize',16,'FontWeight','bold')

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li1(2) li1(3)], {'t_d = 23' 't_d = 27' 't_d = 31'} );

% case 5
N = 3;
K = 8;
t_d = 23;
sigma_max = 45:10:65;
n = 5;

fig13 = figure();
ax1 = axes('Parent',fig13,'XLim',[0 23],'YLim',[00 700],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig14 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig14,'position',[0.13 0.80 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig14,'position',[0.13 0.57 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 15],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig14,'position',[0.13 0.34 0.80 0.15],...
    'XLim',[0 23],'YLim',[-5 5],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax5 = axes('Parent',fig14,'position',[0.13 0.11 0.80 0.15],...
    'XLim',[0 23],'YLim',[-10 65],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig15 = figure();
ax6 = axes('Parent',fig15,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);


C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

for i = 1:length(sigma_max_range)
    sigma_max = sigma_max_range(i);
    filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
    '_n',num2str(n),'_K',num2str(K),'_sigma_max',num2str(sigma_max),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    theta=data.ans(7,:)*180/pi;
    psi = data.ans(6,:)*180/pi;
    a_y_M = data.ans(8,:);
    a_z_M= data.ans(9, :);
    epsilon_t= data.ans(12, :);
    sigma = data.ans(11, :)*180/pi;
    phi_x = data.ans(13,:);
    R=data.ans(10, :);
    x = data.ans(3,:);
    y= data.ans(4, :);
    z = data.ans(5, :);

    li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
        'color',C_map(i,:),'linewidth',4);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',4);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',4);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', epsilon_t,...
        'color', C_map(i,:), 'linewidth', 4);

    li5(i) = line('parent', ax5, 'xdata', t, 'ydata', sigma,...
        'color', C_map(i,:), 'linewidth', 4); 

    li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
        'color',C_map(i,:),'linewidth',linewidth);

end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1) li1(2) li1(3)], {'sigma_{max} = 45' 'sigma_{max} = 55' 'sigma_{max} = 65'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'a_{yM} [m/s^2]','fontsize',16,'FontWeight','bold')
legend(ax2,[li1(1) li1(2) li1(3)], {'sigma_{max} = 45' 'sigma_{max} = 55' 'sigma_{max} = 65'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'a_{zM} [m/s^2]','fontsize',16,'FontWeight','bold')

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'impact time error [s]','fontsize',16,'FontWeight','bold')

xlabel(ax5,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax5,'\sigma [deg]','fontsize',16,'FontWeight','bold')

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li1(2) li1(3)], {'\sigma_{max} = 45' '\sigma_{max} = 55' '\sigma_{max} = 65'} );