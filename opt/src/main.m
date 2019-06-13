% Code passed in MATLAB R2018b, utf8 encoding
points = ...
    [-1.3904879241231081, -1.5733889192776624;
      4.30326790995819  ,  4.8475923234202147;
      6.1533697410402279,  4.01853689653627  ;
     10.984538866507542 , 10.09964185884601  ;
     10.312702115012735 , 13.269212882613733 ;
     14.770713079101785 , 16.474778821454038];

% 扭矩平衡法需要指定初始theta
% 取"按点点顺次连线所得反射面辐角"为初始theta
theta = conv([0;angle(diff(points(:,1)+           ...
    sqrt(-1)*points(:,2)));0],[1;1]/2,'valid') +  ...
    randn(size(points,1),1);
% 扭矩平衡法
theta = torque_balance(points,theta);
show_path(points,theta)

% pso
theta = pso_track(points);
show_path(points,theta)