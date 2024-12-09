close all; clear; clc;

if exist('results') == 0
    mkdir results\
end

%% Simulation parameters
N_range = 3:1:5;
M_range = 10;
k_range = 1.5:0.5:3;
t_d_range = 25:10:45;
% 
% N_range = 5;
% M_range = 10;
% k_range = 3;
% t_d_range = 45;
tic
for i = N_range
    for j = M_range
        for g = k_range
            for l = t_d_range
                N = i;
                M = j;
                k = g;
                t_d = l;
                filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
                    '_M',num2str(M),'_k',num2str(k),'.mat');
                set_param('ITCG_2D_simulation/To File','FileName',filename)
                sim("ITCG_2D_simulation");
                disp(['File saved: ', filename]);
                
            end
        end
    end
end

movefile results_*  results