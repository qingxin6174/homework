r = 1.4; e = 1e-14;
f = @(rho,u,c,Lambda) [ ...     % Steger-Waiming分裂法通用f函数
    [2*(r-1),1,1]*Lambda.*rho/2/r;                          ...
    (2*(r-1)*Lambda(1,:).*u+(u-c).*Lambda(2,:)+             ...
        (u+c).*Lambda(3,:)).*rho/2/r;                       ...
    (2*(r-1)^2*Lambda(1,:).*u.^2+                           ...
        (2*c.^2-2*(r-1)*c.*u+(r-1)*u.^2).*Lambda(2,:)+      ...
        (2*c.^2+2*(r-1)*c.*u+(r-1)*u.^2).*Lambda(3,:)).*rho/4/r/(r-1)];
dx=1e-3; dt=1e-4; x = -5:dx:5; t = 0:dt:2;     % 初值(隐含边值)
U = [(x<0)+(x>=0)*0.125;0*x;((x<0)+(x>=0)*0.1)/(r-1)];
for idx = 1:length(t)-1                          % 按图依次计算
    u = U(2,:)./U(1,:);
    c = sqrt(r*(r-1)*(U(3,:)./U(1,:)-u.^2/2));
    Lambda = [u;u-c;u+c];
    fp = f(U(1,:),u,c,(Lambda+sqrt(Lambda.^2+e))/2);
    fm = f(U(1,:),u,c,(Lambda-sqrt(Lambda.^2+e))/2);
    U(:,2:end-1)=U(:,2:end-1)-dt/dx*(fp(:,2:end-1)-fp(:,1:end-2)+...
                                     fm(:,3:end)-fm(:,2:end-1));
end
u = U(2,:)./U(1,:);
plot(x,[U(1,:);u;(r-1)*(U(3,:)-U(1,:).*u.^2/2)])