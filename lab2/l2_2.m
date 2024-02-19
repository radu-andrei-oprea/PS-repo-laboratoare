N = 200;
T = 100;
u = ustep(N);

x = 1:N;
s1 = ramp(N);
s2 = [zeros(1,T), -s1(1:N-T)];
s3 = [zeros(1,T), -T*u(1:N-T)];


sum = s1 + s2 + s3;


plot(x, s1, 'g-', 'LineWidth', 2); 
hold on;
plot(x, s2, 'b-', 'LineWidth', 2); 
hold on;
plot(x, s3, 'r-', 'LineWidth', 2);
hold on;
plot(x, sum, 'k-', 'LineWidth', 2); 