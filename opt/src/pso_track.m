function [gbest,gvalue] = pso_track(point)

pnum = size(point,1);                 % 粒子维数
gsize = 300;                          % 粒子群规模
Vmax = 0.02;                          % 最大速度限制
K = 0.729; c1 = 2.05; c2 = 2.05;      % 超参
gen = 200;                            % 迭代次数
theta = 2*pi*rand(pnum,gsize)-pi;     % 粒子群初始化
v = Vmax*(2*rand(pnum,gsize)-1);      % 粒子群初速度

%% 初始化
%  粒子最优位置pbest, 最优值pvalue
%  种群最优位置gbest, 最优值gvalue
pbest = theta;
pvalue = zeros(1,gsize);
parfor idx = 1:gsize
    Pose = [point,theta(:,idx)];
    pvalue(idx) = track_length(                ...
        connect(robotics.DubinsConnection,     ...
        Pose(1:end-1,:),Pose(2:end,:)));
end
[~,idx] = min(pvalue);
gbest = pbest(:,idx);

%% PSO迭代
while gen > 0
    
    % 两步迭代
    v = K*(v +                                 ...
        c1*repmat(rand(1,gsize),pnum,1).*      ...
        (pbest-theta) +                        ...
        c2*repmat(rand(1,gsize),pnum,1).*      ...
        (repmat(gbest,1,gsize)-theta));
    theta = theta + v;
    
    % 更新pbest,pvalue,gbest,gvalue
    parfor idx = 1:gsize
        Pose = [point,theta(:,idx)];
        value(idx) = track_length(             ...
            connect(robotics.DubinsConnection, ...
            Pose(1:end-1,:),Pose(2:end,:)));
    end
    IDX = value < pvalue;
    pvalue(IDX) = value(IDX);
    pbest(:,IDX) = theta(:,IDX);
    [gvalue,idx] = min(pvalue);
    gbest = pbest(:,idx);
    
    gen = gen-1;
end