A = 1 ;
T = 100;
delta = T / 5;


%         generare semnal
s = zeros(100);
s(1:delta) = A;
s(delta:100) = 0;

t = 0:1:T-1;

%plot(t,s);
%ylim([-delta-1, delta+1]);
hold on;



%         coeficienti
k = 0:30;

ck = zeros(1,100);

for i = 1 : length(k)
    ck(i) = A * exp(-1j * pi * k(i) * delta / T) * sinc(pi * k(i) * delta / T);
end


%        semnal nefiltrat

semnal = zeros(1,100);
for i = 1 : 100
    for j = 1 : length(k)
      semnal(i) = semnal(i) + ck(j) * exp((1j * 2 * pi * k(j) * i)/T);
    end
end

plot(t, semnal);
%ylim([-A-1, A+1]);


%stem(k, abs(ck));

%         coeficienti fourier

fc = 0.1 / T;
fc = 1 / T;
fc = 10 / T;

RC = 1 / (2 * pi * fc);

ck_y = zeros(1,100);

for i = 1 : length(k)
    ck_y(i) = (1 / (1 + 1j * 2 * pi * RC * k(i) / T)) * ck(i);
end

%stem(k, abs(ck_y));


%         reconstructie semnal


semnal = zeros(1,100);
for i = 1 : 100
    for j = 1 : length(k)
      semnal(i) = semnal(i) + ck_y(j) * exp((1j * 2 * pi * k(j) * i)/T);
    end
end

plot(t, semnal);
%ylim([-A-1, A+1]);

