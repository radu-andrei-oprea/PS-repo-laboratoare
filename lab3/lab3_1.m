T = 100;
A = 3;

s = ones(100);

s(1:T/2) = A;
s(T/2:100) = -A;

t = 0:1:T-1;
%amp1 = 3; amp2 = -3;

%1
%plot(t,s);
%ylim([-A-1, A+1])
hold on;

%2
kmax = 100;
k = -kmax:kmax;
ck = zeros(1,3);


for i = 1 : length(k)
    if mod(k(i),2) == 1
        ck(i) = (2*A)/ (1j * pi * k(i));
    else
        ck(i) = 0;
    end
end

%stem(k, abs(ck));

%3
semnal = zeros(1,100);
for i = 1 : 100
    for j = 1 : length(k)
      semnal(i) = semnal(i) + ck(j) *    exp((1j * 2 * pi * k(j) * i)/T);
    end
end

plot(t, semnal);
ylim([-A-1, A+1])