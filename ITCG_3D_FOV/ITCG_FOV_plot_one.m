close all; clear; clc;

%% Simulation parameters
N_range = 3;
n_range = 5;
K_range = 8;
t_d_range = 30;
sigma_max_range = 45;
linewidth = 2;
fontsize=16;

% case 1
N = 3;
K = 8;
t_d = 30;
sigma_max = 45;
n = 5;

fig1 = figure();
ax1 = axes('Parent', fig1, 'XLim', [0 23], 'YLim', [0 700], ...
    'xgrid', 'on', 'ygrid', 'on', 'xtick', 0:5:45, ...
    'fontsize', 16, 'fontname', 'Times New Roman', 'fontangle', 'italic');

fig3 = figure();
ax6 = axes('Parent', fig3, ...
    'XLim', [-700 700], 'YLIM', [-700 700], ...
    'xgrid', 'on', 'ygrid', 'on', 'zgrid', 'on', ...
    'fontsize', 10, 'fontname', 'Times New Roman', 'fontangle', 'italic');
view(ax6, 3);

fig4 = figure();
ax7 = axes('Parent', fig4, 'position', [0.13 0.55 0.80 0.4], ...
    'XLim', [0 600], 'YLim', [-100 500], ...
    'xgrid', 'on', 'ygrid', 'on', ...
    'fontsize', 15, 'fontname', 'Times New Roman', 'fontangle', 'italic');
ax8 = axes('Parent', fig4, 'position', [0.13 0.15 0.80 0.25], ...
    'XLim', [0 45], 'YLim', [-300 200], 'xtick', 0:5:45, ...
    'xgrid', 'on', 'ygrid', 'on', ...
    'fontsize', 15, 'fontname', 'Times New Roman', 'fontangle', 'italic');

fig5 = figure('position', [100, 100, 530, 400]);
ax2 = axes('Parent', fig5, 'position', [0.13 0.65 0.80 0.25], ...
    'XLim', [0 t_d], ...
    'xgrid', 'on', 'ygrid', 'on', 'xtick', 0:5:45, ...
    'fontsize', 15, 'fontname', 'Times New Roman', 'fontangle', 'italic');
ax3 = axes('Parent', fig5, 'position', [0.13 0.15 0.80 0.25], ...
    'XLim', [0 t_d], ...
    'xgrid', 'on', 'ygrid', 'on', 'xtick', 0:5:45, ...
    'fontsize', 15, 'fontname', 'Times New Roman', 'fontangle', 'italic');

fig6 = figure('position', [640, 100, 530, 400]);
ax4 = axes('Parent', fig6, 'position', [0.13 0.65 0.80 0.25], ...
    'XLim', [0 t_d], ...
    'xgrid', 'on', 'ygrid', 'on', 'xtick', 0:5:45, ...
    'fontsize', 15, 'fontname', 'Times New Roman', 'fontangle', 'italic');
ax5 = axes('Parent', fig6, 'position', [0.13 0.15 0.80 0.25], ...
    'XLim', [0 t_d], ...
    'xgrid', 'on', 'ygrid', 'on', 'xtick', 0:5:45, ...
    'fontsize', 15, 'fontname', 'Times New Roman', 'fontangle', 'italic');


x_ground = [-700, 700, 700, -700]; 
y_ground = [-700, -700, 700, 700];  
z_ground = [0, 0, 0, 0];         

patch('XData', x_ground, 'YData', y_ground, 'ZData', z_ground, ...
    'FaceColor', [0.6 0.3 0.1], 'FaceAlpha', 0.5, 'Parent', ax6);

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
        'color',C_map(i,:),'linewidth',2);

    li2(i) = line('parent',ax2,'xdata',t,'ydata',a_y_M,...
        'color',C_map(i,:),'linewidth',2);

    li3(i) = line('parent',ax3,'xdata',t,'ydata',a_z_M,...
        'color',C_map(i,:),'linewidth',2);

    li4(i) = line('parent', ax4, 'xdata', t, 'ydata', epsilon_t,...
        'color', C_map(i,:), 'linewidth', 2);

    li5(i) = line('parent', ax5, 'xdata', t, 'ydata', sigma,...
        'color', C_map(i,:), 'linewidth', 2); 

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

    li11(i) = line('parent',ax8,'xdata',t_d,'ydata',0,...
        'color','red','linewidth',linewidth, 'Marker', 'pentagram');
end

xlabel(ax1,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax1,'R [m]','fontsize',16,'FontWeight','bold')
legend(ax1,[li1(1)], {'N = 3, K = 8, n = 5, t_d=30, /sigma_max=45'},'Location','NE')

xlabel(ax2,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax2,'[m/s^2]','fontsize',16,'FontWeight','bold')
legend(ax2,[li1(1)], {'N = 3, K = 8, n = 5, t_d=30, /sigma_max=45'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);
title(ax2, 'Lateral acceleration');

xlabel(ax3,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax3,'[m/s^2]','fontsize',16,'FontWeight','bold')
title(ax3, 'Longitudinal acceleration');

xlabel(ax4,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax4,'[s]','fontsize',16,'FontWeight','bold')
legend(ax4,[li1(1)], {'N = 3, K = 8, n = 5, t_d=30, /sigma_max=45'},'Orientation', 'horizontal', 'Position',[0.655 0.91 0 0]);
title(ax4, 'Impact time error');

xlabel(ax5,'time [s]','fontsize',16,'FontWeight','bold')
ylabel(ax5,'[deg]','fontsize',16,'FontWeight','bold')
title(ax5, 'Field of View');

xlabel(ax6,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax6,'Y [m]','fontsize',fontsize,'FontWeight','bold')
zlabel(ax6,'Z [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax6,[li1(1) li7(1)], {'N = 3, K = 8, n = 5, t_d=30, \sigma_{max}=45' 'Target'} );

xlabel(ax7,'X [m]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax7,'Y [m]','fontsize',fontsize,'FontWeight','bold')
legend(ax7,[li1(1) li7(1)], {'N = 3, K = 8, n = 5, t_d=30, \sigma_{max}=45' 'Target'}, 'FontSize', 10);

xlabel(ax8,'time [s]','fontsize',fontsize,'FontWeight','bold')
ylabel(ax8,'Z [m]','fontsize',fontsize,'FontWeight','bold')