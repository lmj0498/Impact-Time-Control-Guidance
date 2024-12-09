close all; clear; clc;

if exist('results') == 0
    mkdir results\
end

%% Simulation parameters

for i = 3
    for j = 8
        for g = 5
            for l=30
                for s = 45
                N = i;
                K = j;
                n = g;
                t_d = l;
                sigma_max = s;
                filename = strcat('results_td',num2str(t_d),'_N',num2str(N),...
                    '_n',num2str(n),'_K',num2str(K),'_sigma_max',num2str(s),'.mat');
                set_param('ITCG_3D_FOV_simulation/To File','FileName',filename)
                sim("ITCG_3D_FOV_simulation");
                 disp(['File saved: ', filename]);
                %저장 완료 메시지 출력
                end
            end
        end
    end
end
    