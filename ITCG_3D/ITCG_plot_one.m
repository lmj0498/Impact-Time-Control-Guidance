close all; clear; clc;

%% Simulation parameters
N_range = 3;
M_range = 10;
k_range = 2;
t_d_range = 45;
linewidth = 2;
fontsize=16;


%% case 1 N
N = 3;
k = 2;
t_d = 45;
M=10;


fig1 = figure();
ax1 = axes('Parent',fig1,'XLim',[0 45],'YLim',[00 700],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig2 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig2,'position',[0.13 0.75 0.80 0.2],...
    'XLim',[0 45],'YLim',[-20 20],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig2,'position',[0.13 0.45 0.80 0.2],...
    'XLim',[0 45],'YLim',[-20 20],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig2,'position',[0.13 0.15 0.80 0.2],...
    'XLim',[0 45],'YLim',[-40 10],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig3 = figure();
ax6 = axes('Parent',fig3,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);

fig4 = figure();
ax7= axes('Parent',fig4,'position',[0.13 0.55 0.80 0.4],...
    'XLim',[0 600],'YLim',[-100 500],...
    'xgrid','on','ygrid','on',...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

ax8= axes('Parent',fig4,'position',[0.13 0.15 0.80 0.25],...
    'XLim',[0 45],'YLim',[-300 200],'xtick',0:5:45,...
    'xgrid','on','ygrid','on',...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

C_map = [0.00,0.45,0.74;
    0.85,0.33,0.10;
    0.93,0.69,0.13;
    0.49,0.18,0.56;
    0.47,0.67,0.19];

%지면추가
hold(ax6, 'on') 

x_ground = [-700, 700, 700, -700]; 
y_ground = [-700, -700, 700, 700];  
z_ground = [0, 0, 0, 0];         

patch('XData', x_ground, 'YData', y_ground, 'ZData', z_ground, ...
    'FaceColor', [0.6 0.3 0.1], 'FaceAlpha', 0.5, 'Parent', ax6);

for i = 1:length(N_range)
    N = N_range(i);
    filename = strcat('3Dresults_td',num2str(t_d),'_N',num2str(N),...
        '_M',num2str(M),'_k',num2str(k),'.mat');
    data = load(filename);
    t = data.ans(1,:);
    theta=data.ans(9,:)*180/pi;
    psi = data.ans(10,:)*180/pi;
    a_y_M = data.ans(11,:);
    a_z_M= data.ans(12, :);
    ksi_bar= data.ans(13, :);
    R=data.ans(14, :);
    x = data.ans(6,:);
    y= data.ans(7, :);
    z = data.ans(8, :);

    li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
        'color',C_map(i,:),'linewidth',4);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',4);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',4);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', ksi_bar,...
        'color', C_map(i,:), 'linewidth', 4);

    li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
        'color',C_map(i,:),'linewidth',linewidth);   

    li7(i) = line('parent',ax6,'xdata',0,'ydata',0,'zdata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram');  

    li8(i) = line('parent', ax7, 'xdata', x, 'ydata', y,...
        'color', C_map(i,:), 'linewidth', 4);

    li9(i) = line('parent', ax8, 'xdata', t, 'ydata', z,...
        'color', C_map(i,:), 'linewidth', 4);    

    li10(i) = line('parent',ax7,'xdata',0,'ydata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram');  

    li11(i) = line('parent',ax8,'xdata',45,'ydata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram');  

end
xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1)], {'N = 3, M=10, k=2, t_d=45'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'a_{yM} [m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
legend(ax2,[li1(1)], {'N = 3, M=10, k=2, t_d=45'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'a_{zM} [m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'impact time error [s]','fontsize',16,'FontWeight','bold', 'Position', [-3.5 -20 0])

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li7(1)], {'N = 3, M=10, k=2, t_d=45' 'Target'} );

xlabel(ax7,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax7,'Y [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax7,[li1(1) li7(1)], {'N = 3, M=10, k=2, t_d=45' 'Target'} );

xlabel(ax8,'time [s]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax8,'Z [m]','fontsize',fontsize,'FontWeight','bold')
