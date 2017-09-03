clear all; clc;

%2D Runge Kutta Solution of Newtonian Motion 
%Mitchel McDonald

%% Establish Initial Conditions
%To be changed.

re = 6.371.*(10.^6); % radius of the earth, meters
alt = 400.*(10.^3); % altitude of s/c, meters

ro = [(re+alt); 0; 0]; %initial position, meters
vo = [0; 7660.0; 0;]; %initial velocity, m/s

y = zeros(4,1);
y(1,1) = ro(1,1);
y(2,1) = ro(2,1);
y(3,1) = ro(3,1);
y(4,1) = vo(1,1);
y(5,1) = vo(2,1);
y(6,1) = vo(3,1);

t = 0;
h = .1; %time stepsize.

t_end = 86400; %timespan of simulation (integer values only).

%setup datasets:
r_eci = zeros((t_end/h),3);
v_eci = zeros((t_end/h),3);

for i = 1:(t_end/h)
    k1 = odefcn(t,h,y);
    k2 = odefcn((t+(h./2)),h,(y+(h./2).*k1));
    k3 = odefcn((t+(h./2)),h,(y+(h./2).*k2));
    k4 = odefcn((t+h),h,(y+(h.*k3)));

    y = y + (h./6).*(k1 + 2.*k2 + 2.*k3 + k4);
    t = t + h;
    
    %recording data for analysis:
    r_eci(i,1) = y(1,1);
    r_eci(i,2) = y(2,1);
    r_eci(i,3) = y(3,1);
    
    v_eci(i,1) = y(4,1);
    v_eci(i,2) = y(5,1);
    v_eci(i,3) = y(6,1);
end


%analysis 
plot3(r_eci(:,1),r_eci(:,2),r_eci(:,3));

    
