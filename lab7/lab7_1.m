A1=1;
A2=0.5;
fs=8000;
%f1=1000;
f1 = 0;
%f2=2000;
f2 = 2500;
%f2=2000;
N=8; K = 64;

ts = 1 / fs;
n = 0 : N-1;

s1 = ones(N);
s2 = ones(N);
s = ones(N);

for i = 1 : N
    s1(i) = A1 * sin(2 * pi * f1 * i * ts);
    s2(i) = A2 * sin(2 * pi * f2 * i * ts);
    s(i) = s1(i) + s2(i); 
end

figure;
hold on;
plot(n, s);
plot(n, s1);
plot(n, s2);

dft = fft(s);

figure;
stem(abs(dft));

new_s = zeros(56);

for i = 1 : N
    new_s(i) = s(i);
end

    
new_dft = fft(new_s);

figure;
stem(abs(new_dft));
