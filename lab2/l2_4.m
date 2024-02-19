N = 20;
f = zeros(1,N);
e = zeros(1,N);
x = ones(1, N) * 60;
t = (1:N);

f(1) = 7;

y = zeros(1,N);
y(1) = 7;
for i=1:N-1
  e(i) = x(i)-y(i);
  y(i+1) = S1(y(i), e(i));
end

plot(t, y, "-r");
hold on;
plot(t, e, "-b");