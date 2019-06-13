dx = 0.06; dt = 0.03; % dt = 0.03;
x = (-2:dx:2)'; t = 0:dt:4;
U = [max(1-abs(x),0), ...
     zeros(length(x),length(t)-1)];
U(1,2:end) = NaN; % U(1,2:end) = 1;
v = [1-dt/dx, dt/dx];
for idx = 2:length(t)
    U(2:end,idx) = conv(U(:,idx-1),v,'valid');
end
heatmap(flipud(U),'FontSize',6,'FontName','Consolas')