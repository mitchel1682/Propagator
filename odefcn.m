function dydt = odefcn(t,dt,y)

%1. Establish Forces:
%a. gravity.
mu_e = 3.986004418.*(10.^14); %Standard Gravitational Parameter of Earth, in SI units.
msc = 50; %Mass of s/c, in Kilograms.

r = zeros(3,1);
r(1,1) = y(1,1);
r(2,1) = y(2,1);
r(3,1) = y(3,1);

Fg = -(((mu_e.*msc).*r)./(abs(norm(r))).^3);


%sum forces.
F = Fg;

%extract acceleration:\
a = F./msc;

%update velocity
vo = zeros(2,1);
vo(1,1) = y(4,1);
vo(2,1) = y(5,1);
vo(3,1) = y(6,1);

v = (a.*dt) + vo;

dydt = zeros(6,1);

dydt(1,1) = v(1,1);
dydt(2,1) = v(2,1);
dydt(3,1) = v(3,1);
dydt(4,1) = a(1,1);
dydt(5,1) = a(2,1);
dydt(6,1) = a(3,1);
end

