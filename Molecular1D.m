% Tyler Armstrong
% 101009324

x0 = [-2 -1 0 1 2]*1E-9; % Initial positions of particles, m
x = [-2.2 -0.7 0.1 0.9 1.9]*1E-9; % Current positions of particles, m
x1 = x0; % New positions of particles, m
y = zeros(size(x0));
dt = 1E-6; % Time step, s
m = 1.67E-27; % Particle mass, kg
k = 1E-15; % Spring constant, N/m
T = 10000;
plot(x0, y, 'ro');
for t = 1:T % Run for T time steps
    % xn = x(n-1) + (x(n-1)-x0)(F/m)(dt^2)/2
    for i = 1:5 % Calculate new positions
       if i==1 % On left end
          x1(i) = x(i)-k*(x(i+1)-x0(i+1))/m*dt*dt/2; 
       elseif i == 5 % On right end
          x1(i) = x(i)-k*(x(i-1)-x0(i-1))/m*dt*dt/2; 
       else % In middle
          x1(i) = x(i)-k*(x(i-1)-x0(i-1))/m*dt*dt/2-k*(x(i+1)-x0(i+1))/m*dt*dt/2;
       end
    end
    x = x1; % Update positions
    plot(x, y, 'ro', 'markerfacecolor', 'r');
    pause(0.1);
end
