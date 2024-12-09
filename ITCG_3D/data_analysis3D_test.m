close all; clear; clc;

%% Simulation parameters
N_range = 3:1:5;
M_range = 8:2:12;
k_range = 2:1:5;
t_d_range = 35:10:55;
linewidth = 2;
fontsize=16;


% %% case 1 N
% N = 3:1:5;
% k = 2;
% t_d = 45;
% M=10;
% 
% 
% fig1 = figure();
% ax1 = axes('Parent',fig1,'XLim',[0 45],'YLim',[00 700],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',16,'fontname','Times New Roman','fontangle','italic');
% 
% fig2 = figure('position',[0 100 530 700]);
% ax2 = axes('Parent',fig2,'position',[0.13 0.74 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-10 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% ax3 = axes('Parent',fig2,'position',[0.13 0.415 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-10 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% ax4 = axes('Parent',fig2,'position',[0.13 0.09 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-40 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% fig3 = figure();
% ax6 = axes('Parent',fig3,...
%     'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
%     'xgrid','on','ygrid','on','zgrid', 'on',...
%     'fontsize',10,'fontname','Times New Roman','fontangle','italic');
% view(ax6, 3);
% 
% fig4 = figure();
% ax7= axes('Parent',fig4,'position',[0.13 0.55 0.80 0.4],...
%     'XLim',[0 600],'YLim',[-100 500],...
%     'xgrid','on','ygrid','on',...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% ax8= axes('Parent',fig4,'position',[0.13 0.15 0.80 0.25],...
%     'XLim',[0 45],'YLim',[-300 200],'xtick',0:5:45,...
%     'xgrid','on','ygrid','on',...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% C_map = [0.00,0.45,0.74;
%     0.85,0.33,0.10;
%     0.93,0.69,0.13;
%     0.49,0.18,0.56;
%     0.47,0.67,0.19];
% 
% % 지면추가
% hold(ax6, 'on') 
% 
% x_ground = [-700, 700, 700, -700]; 
% y_ground = [-700, -700, 700, 700];  
% z_ground = [0, 0, 0, 0];         
% 
% patch('XData', x_ground, 'YData', y_ground, 'ZData', z_ground, ...
%     'FaceColor', [0.6 0.3 0.1], 'FaceAlpha', 0.5, 'Parent', ax6);
% 
% for i = 1:length(N_range)
%     N = N_range(i);
%     filename = strcat('3Dresults_td',num2str(t_d),'_N',num2str(N),...
%         '_M',num2str(M),'_k',num2str(k),'.mat');
%     data = load(filename);
%     t = data.ans(1,:);
%     theta=data.ans(9,:)*180/pi;
%     psi = data.ans(10,:)*180/pi;
%     a_y_M = data.ans(11,:);
%     a_z_M= data.ans(12, :);
%     ksi_bar= data.ans(13, :);
%     R=data.ans(14, :);
%     x = data.ans(6,:);
%     y= data.ans(7, :);
%     z = data.ans(8, :);
% 
%     li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li4(i) = line('parent', ax4, 'xdata', t, 'ydata', ksi_bar,...
%         'color', C_map(i,:), 'linewidth', 4);
% 
%     li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
%         'color',C_map(i,:),'linewidth',linewidth);   
% 
%     li7(i) = line('parent',ax6,'xdata',0,'ydata',0,'zdata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram');  
% 
%     li8(i) = line('parent', ax7, 'xdata', x, 'ydata', y,...
%         'color', C_map(i,:), 'linewidth', 4);
% 
%     li9(i) = line('parent', ax8, 'xdata', t, 'ydata', z,...
%         'color', C_map(i,:), 'linewidth', 4);    
% 
%     li10(i) = line('parent',ax7,'xdata',0,'ydata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram');  
% 
%     li11(i) = line('parent',ax8,'xdata',45,'ydata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram');  
% 
% end
% xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
% legend(ax1,[li1(1) li1(2) li1(3)], {'N = 3' 'N = 4' 'N = 5'},'Location','NE')
% title(ax1, "Relative distance");
% 
% xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax2,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
% legend(ax2,[li1(1) li1(2) li1(3)], {'N = 3' 'N = 4' 'N = 5'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);
% title(ax2, "Lateral acceleration");
% 
% xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax3,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
% title(ax3, "Longitudinal acceleration")
% 
% xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax4,'[s]','fontsize',16,'FontWeight','bold', 'Position', [-3.5 -20 0])
% title(ax4, "Impact time error");
% 
% xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
% zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
% legend(ax6,[li1(1) li1(2) li1(3) li7(1)], {'N = 3' 'N = 4' 'N = 5' 'Target'} );
% title(ax6, "3D Trajectory");
% 
% xlabel(ax7,'X [m]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax7,'Y [m]','fontsize',fontsize,'FontWeight','bold')
% legend(ax7,[li1(1) li1(2) li1(3) li7(1)], {'N = 3' 'N = 4' 'N = 5' 'Target'} );
% 
% xlabel(ax8,'time [s]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax8,'Z[m]','fontsize',fontsize,'FontWeight','bold')

% %% case 2 k
% N = 3;
% k = 2:1:5;
% t_d = 45;
% M=10;
% 
% fig5 = figure();
% ax1 = axes('Parent',fig5,'XLim',[0 45],'YLim',[00 700],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',16,'fontname','Times New Roman','fontangle','italic');
% 
% fig6 = figure('position',[0 100 530 700]);
% ax2 = axes('Parent',fig6,'position',[0.13 0.74 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-10 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% ax3 = axes('Parent',fig6,'position',[0.13 0.415 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-10 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% ax4 = axes('Parent',fig6,'position',[0.13 0.09 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-40 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% fig7 = figure();
% ax6 = axes('Parent',fig7,...
%     'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
%     'xgrid','on','ygrid','on','zgrid', 'on',...
%     'fontsize',10,'fontname','Times New Roman','fontangle','italic');
% view(ax6, 3);
% 
% fig8 = figure();
% ax7= axes('Parent',fig8,'position',[0.13 0.55 0.80 0.4],...
%     'XLim',[0 600],'YLim',[-100 500],...
%     'xgrid','on','ygrid','on',...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% ax8= axes('Parent',fig8,'position',[0.13 0.15 0.80 0.25],...
%     'XLim',[0 45],'YLim',[-300 200],'xtick',0:5:45,...
%     'xgrid','on','ygrid','on',...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% C_map = [0.00,0.45,0.74;
%     0.85,0.33,0.10;
%     0.93,0.69,0.13;
%     0.49,0.18,0.56;
%     0.47,0.67,0.19];
% 
% %지면추가
% hold(ax6, 'on') 
% 
% x_ground = [-700, 700, 700, -700]; 
% y_ground = [-700, -700, 700, 700];   
% z_ground = [0, 0, 0, 0];         
% 
% patch('XData', x_ground, 'YData', y_ground, 'ZData', z_ground, ...
%     'FaceColor', [0.6 0.3 0.1], 'FaceAlpha', 0.5, 'Parent', ax6);
% 
% for i = 1:length(k_range)
%     k = k_range(i);
%     filename = strcat('3Dresults_td',num2str(t_d),'_N',num2str(N),...
%         '_M',num2str(M),'_k',num2str(k),'.mat');
%     data = load(filename);
%     t = data.ans(1,:);
%     theta=data.ans(9,:)*180/pi;
%     psi = data.ans(10,:)*180/pi;
%     a_y_M = data.ans(11,:);
%     a_z_M= data.ans(12, :);
%     ksi_bar= data.ans(13, :);
%     R=data.ans(14, :);
%     x = data.ans(6,:);
%     y= data.ans(7, :);
%     z = data.ans(8, :);
% 
%     li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li4(i) = line('parent', ax4, 'xdata', t, 'ydata', ksi_bar,...
%         'color', C_map(i,:), 'linewidth', 4);
% 
%     li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
%         'color',C_map(i,:),'linewidth',linewidth);
% 
%     li7(i) = line('parent',ax6,'xdata',0,'ydata',0,'zdata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 
% 
%     li8(i) = line('parent', ax7, 'xdata', x, 'ydata', y,...
%         'color', C_map(i,:), 'linewidth', 4);
% 
%     li9(i) = line('parent', ax8, 'xdata', t, 'ydata', z,...
%         'color', C_map(i,:), 'linewidth', 4);    
% 
%     li10(i) = line('parent',ax7,'xdata',0,'ydata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram');  
% 
%     li11(i) = line('parent',ax8,'xdata',45,'ydata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 
% end
% xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
% legend(ax1,[li1(1) li1(2) li1(3) li1(4)], {'k = 2' 'k = 3' 'k = 4' 'k = 5'},'Location','NE')
% 
% xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax2,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
% legend(ax2,[li1(1) li1(2) li1(3) li1(4)], {'k = 2' 'k = 3' 'k = 4' 'k = 5'},'Orientation', 'horizontal', 'Position',[0.575 0.91 0 0]);
% title(ax2, "Lateral acceleration");
% 
% xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax3,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
% title(ax3, "Longitudinal acceleration")
% 
% xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax4,'[s]','fontsize',16,'FontWeight','bold', 'Position', [-3.5 -20 0])
% title(ax4, "Impact time error");
% 
% xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
% zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
% legend(ax6,[li1(1) li1(2) li1(3) li1(4) li7(1)], {'k = 2' 'k = 3' 'k = 4' 'k = 5' 'Target'} );
% title(ax6, "3D Trajectory");
% 
% xlabel(ax7,'X [m]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax7,'Y [m]','fontsize',fontsize,'FontWeight','bold')
% legend(ax7,[li1(1) li1(2) li1(3) li1(4) li7(1)], {'k = 2' 'k = 3' 'k = 4' 'k = 5' 'Target'} );
% 
% xlabel(ax8,'time [s]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax8,'Z [m]','fontsize',fontsize,'FontWeight','bold')

%% case 3 t_d
N = 3;
k = 2;
t_d = 35:10:55;
M=10;

fig9 = figure();
ax1 = axes('Parent',fig9,'XLim',[0 55],'YLim',[0 700],...
    'xgrid','on','ygrid','on','xtick',0:5:55,...
    'fontsize',16,'fontname','Times New Roman','fontangle','italic');

fig10 = figure('position',[0 100 530 700]);
ax2 = axes('Parent',fig10,'position',[0.13 0.74 0.80 0.2],...
    'XLim',[0 45],'YLim',[-10 10],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax3 = axes('Parent',fig10,'position',[0.13 0.415 0.80 0.2],...
    'XLim',[0 45],'YLim',[-10 10],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');
ax4 = axes('Parent',fig10,'position',[0.13 0.09 0.80 0.2],...
    'XLim',[0 45],'YLim',[-40 10],...
    'xgrid','on','ygrid','on','xtick',0:5:45,...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

fig11 = figure();
ax6 = axes('Parent',fig11,...
    'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
    'xgrid','on','ygrid','on','zgrid', 'on',...
    'fontsize',10,'fontname','Times New Roman','fontangle','italic');
view(ax6, 3);

fig12 = figure();
ax7= axes('Parent',fig12,'position',[0.13 0.55 0.80 0.4],...
    'XLim',[0 600],'YLim',[-100 500],...
    'xgrid','on','ygrid','on',...
    'fontsize',15,'fontname','Times New Roman','fontangle','italic');

ax8= axes('Parent',fig12,'position',[0.13 0.15 0.80 0.25],...
    'XLim',[0 55],'YLim',[-500 200],'xtick',0:5:55,...
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

for i = 1:length(t_d_range)
    t_d = t_d_range(i);
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

    li11(i) = line('parent',ax8,'xdata',35,'ydata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 

    li11(i) = line('parent',ax8,'xdata',45,'ydata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 

    li11(i) = line('parent',ax8,'xdata',55,'ydata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 
end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1) li1(2) li1(3)], {'t_d = 35' 't_d = 45' 't_d = 55'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
legend(ax2,[li1(1) li1(2) li1(3)], {'t_d = 35' 't_d = 45' 't_d = 55'},'Orientation', 'horizontal', 'Position',[0.605 0.91 0 0]);
title(ax2, "Lateral acceleration");

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
title(ax3, "Longitudinal acceleration")

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'[s]','fontsize',16,'FontWeight','bold', 'Position', [-3.5 -20 0])
title(ax4, "Impact time error");

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li1(2) li1(3) li7(1)], {'t_d = 35' 't_d = 45' 't_d = 55' 'Target'} );
title(ax6, "3D Trajectory");

xlabel(ax7,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax7,'Y [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax7,[li1(1) li1(2) li1(3) li7(1)], {'t_d = 35' 't_d = 45' 't_d = 55' 'Target'} );

xlabel(ax8,'time [s]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax8,'Z [m]','fontsize',fontsize,'FontWeight','bold')

% %% case 4 M 
% N = 3;
% k = 2;
% t_d = 45;
% M=8:2:12;
% 
% fig13= figure();
% ax1 = axes('Parent',fig13,'XLim',[0 45],'YLim',[0 700],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',16,'fontname','Times New Roman','fontangle','italic');
% 
% fig14= figure('position',[0 100 530 700]);
% ax2 = axes('Parent',fig14,'position',[0.13 0.74 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-10 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% ax3 = axes('Parent',fig14,'position',[0.13 0.415 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-10 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% ax4 = axes('Parent',fig14,'position',[0.13 0.09 0.80 0.2],...
%     'XLim',[0 45],'YLim',[-40 10],...
%     'xgrid','on','ygrid','on','xtick',0:5:45,...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% fig15 = figure();
% ax6 = axes('Parent',fig15,...
%     'XLim',[-100 100],'YLim',[-100 100], 'ZLim', [0, 200],...
%     'xgrid','on','ygrid','on','zgrid', 'on',...
%     'fontsize',10,'fontname','Times New Roman','fontangle','italic');
% view(ax6, 3);
% 
% fig16 = figure();
% ax7= axes('Parent',fig16,'position',[0.13 0.55 0.80 0.4],...
%     'XLim',[0 600],'YLim',[-100 500],...
%     'xgrid','on','ygrid','on',...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% ax8= axes('Parent',fig16,'position',[0.13 0.15 0.80 0.25],...
%     'XLim',[0 45],'YLim',[-300 200],'xtick',0:5:45,...
%     'xgrid','on','ygrid','on',...
%     'fontsize',15,'fontname','Times New Roman','fontangle','italic');
% 
% C_map = [0.00,0.45,0.74;
%     0.85,0.33,0.10;
%     0.93,0.69,0.13;
%     0.49,0.18,0.56;
%     0.47,0.67,0.19];
% 
% %지면추가
% hold(ax6, 'on') 
% 
% x_ground = [-700, 700, 700, -700]; 
% y_ground = [-700, -700, 700, 700];   
% z_ground = [0, 0, 0, 0];         
% 
% patch('XData', x_ground, 'YData', y_ground, 'ZData', z_ground, ...
%     'FaceColor', [0.6 0.3 0.1], 'FaceAlpha', 0.5, 'Parent', ax6);
% 
% for i = 1:length(M_range)
%     M = M_range(i);
%     filename = strcat('3Dresults_td',num2str(t_d),'_N',num2str(N),...
%         '_M',num2str(M),'_k',num2str(k),'.mat');
%     data = load(filename);
%     t = data.ans(1,:);
%     theta=data.ans(9,:)*180/pi;
%     psi = data.ans(10,:)*180/pi;
%     a_y_M = data.ans(11,:);
%     a_z_M= data.ans(12, :);
%     ksi_bar= data.ans(13, :);
%     R=data.ans(14, :);
%     x = data.ans(6,:);
%     y= data.ans(7, :);
%     z = data.ans(8, :);
% 
%     li1(i) = line('parent',ax1,'xdata',t,'ydata', R,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
%         'color',C_map(i,:),'linewidth',4);
% 
%     li4(i) = line('parent', ax4, 'xdata', t, 'ydata', ksi_bar,...
%         'color', C_map(i,:), 'linewidth', 4);
%     li6(i) = line('parent',ax6,'xdata',x,'ydata',y,'zdata',z,...
%         'color',C_map(i,:),'linewidth',linewidth);
%     li7(i) = line('parent',ax6,'xdata',0,'ydata',0,'zdata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 
% 
%     li8(i) = line('parent', ax7, 'xdata', x, 'ydata', y,...
%         'color', C_map(i,:), 'linewidth', 4);
% 
%     li9(i) = line('parent', ax8, 'xdata', t, 'ydata', z,...
%         'color', C_map(i,:), 'linewidth', 4);    
% 
%     li10(i) = line('parent',ax7,'xdata',0,'ydata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram');  
% 
%     li11(i) = line('parent',ax8,'xdata',45,'ydata',0,...
%         'color','red','linewidth',linewidth, 'Marker', 'pentagram'); 
% end
% 
% xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
% legend(ax1,[li1(1) li1(2) li1(3) ], {'M = 8' 'M = 10' 'M = 12'},'Location','NE')
% 
% xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax2,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
% legend(ax2,[li1(1) li1(2) li1(3) ], {'M = 8' 'M = 10' 'M = 12'},'Orientation', 'horizontal', 'Position',[0.625 0.91 0 0]);
% title(ax2, "Lateral acceleration");
% 
% xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax3,'[m/s^2]','fontsize',16,'FontWeight','bold', 'Position', [-2 2.5 0])
% title(ax3, "Longitudinal acceleration")
% 
% xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
% ylabel(ax4,'[s]','fontsize',16,'FontWeight','bold', 'Position', [-3.5 -20 0])
% title(ax4, "Impact time error");
% 
% xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
% zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
% legend(ax6,[li1(1) li1(2) li1(3) li7(1)], {'M = 8' 'M = 10' 'M = 12' 'Target'} )
% title(ax6, "3D Trajectory");
% 
% xlabel(ax7,'X [m]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax7,'Y [m]','fontsize',fontsize,'FontWeight','bold')
% legend(ax7,[li1(1) li1(2) li1(3) li7(1)], {'M = 8' 'M = 10' 'M = 12' 'Target'} );
% 
% xlabel(ax8,'time [s]','fontsize',fontsize,'FontWeight','bold')
% ylabel(ax8,'Z [m]','fontsize',fontsize,'FontWeight','bold')

% 
% %% kinetic energy
% clear('N','k','td','i_N','i')
% 
% for i_N = 1:length(N_range)
%     for i_k = 1:length(k_range)
%         for i_td = 1:length(t_d_range)
%             N = N_range(i_N);
%             k = k_range(i_k);
%             td = t_d_range(i_td);
%             filename = strcat('3Dresults_td',num2str(td),'_N',num2str(N),...
%                 '_M',num2str(M),'_k',num2str(k),'.mat');
%             data = load(filename);
%             t = data.ans(1,:);
%             V0 = data.ans(2,:);
%             a_y_M = data.ans(11, :);
%             a_z_M = data.ans(12, :);
%             V_y(1) = 0;
%             V_z(1) = 0;
%             E_y(1) = 0;
%             E_z(1) = 0;
%             V_in(1) = 0;
%             for i_E = 1:length(t)-1
%                 dt = t(i_E + 1) - t(i_E);
%                 V_y(i_E + 1) = abs(a_y_M(i_E))*dt;
%                 V_z(i_E + 1) = abs(a_z_M(i_E))*dt;
%                 V_in(i_E + 1) = V_in(i_E) + abs(a_y_M(i_E))*dt+abs(a_z_M(i_E))*dt;
% 
%             end
%             E_tot{i_N}(i_k,i_td) = 1/2*(V_in(end))^2;
%             clear('V_y','V_in','V_z')
%         end
%     end
% end

% print(gcf, 'wind.png', '-dpng', '-r400'); 