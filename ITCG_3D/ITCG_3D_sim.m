close all; clear; clc;

if exist('results') == 0
    mkdir results\
end

%% Simulation parameters

for i = 3:1:5
    for j = 8:2:12
        for g = 2:1:5
            for l=35:10:55
                N = i;
                M = j;
                k = g;
                t_d = l;
                filename = strcat('3Dresults_td',num2str(t_d),'_N',num2str(N),...
                    '_M',num2str(M),'_k',num2str(k),'.mat');
                set_param('ITCG_3D_simulation/To File','FileName',filename)
                sim("ITCG_3D_simulation");
                 disp(['File saved: ', filename]);
                %저장 완료 메시지 출력
            end
        end
    end
end
