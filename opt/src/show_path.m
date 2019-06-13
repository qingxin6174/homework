function show_path(Points,theta)
% 显示路径
Pose = [Points,theta];
pathSegObj = connect(robotics.DubinsConnection,   ...
                     Pose(1:end-1,:),Pose(2:end,:));
figure;
for idx = 1:length(pathSegObj)
    show(pathSegObj{idx}); hold on;
end
title(['Length = ',num2str(track_length(pathSegObj))]);
legend off; hold off;