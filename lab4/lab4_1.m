T = 100;
A = 3;

s = ones(100);

s(1:T/2) = A;
s(T/2:100) = -A;

t = 0:1:T-1;

%        semnalul original
%plot(t,s);
%ylim([-A-1, A+1])
hold on;

%        coeficientul
kmax = 81;
k = -kmax:kmax;
ck = zeros(1,100);

for i = 1 : length(k)
    if mod(k(i),2) == 1
        ck(i) = (2*A)/ (1j * pi * k(i));
    else
        ck(i) = 0;
    end
end

%stem(k, abs(ck));

%        theta si coeficientul nou
theta = T / 4;

ck_prim = zeros(1,100);

for i = 1 : length(k)
    ck_prim(i) = ck(i) * exp(-1j * (2*pi*k(i)*theta) / T);
end

%stem(k, abs(ck_prim));

%        rad2deg
r2d = zeros(1,100);

for i = 1 : length(k)
    r2d(i) = rad2deg(angle(ck_prim(i)))';
end

%plot(t, r2d);



%        reconstructie semnal
semnal = zeros(1,100);

for i = 1 : 100
    for j = 1 : length(k)
      semnal(i) = semnal(i) + ck(j) * exp((1j * 2 * pi * k(j) * i)/T);
    end
end

plot(t, semnal);

%        reconstructie semnal cu coef fourier

semnal = zeros(1,100);

for i = 1 : 100
    for j = 1 : length(k)
      semnal(i) = semnal(i) + ck_prim(j) * exp((1j * 2 * pi * k(j) * i)/T);
    end
end

plot(t, semnal);
ylim([-A-1, A+1])

