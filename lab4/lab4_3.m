alpha = 0.05;
u = 1;
s = zeros(1, 128);
T = 128;
fc = 20 / T;

t = 1:T;

for i = 1 : T
    s(i) = exp(-alpha * i) * u;
end

plot(t,s);
hold on;

x = zeros(1, 128);

for i = 1 : T
    x(i) = (1 + s(i)) * cos(2 * pi * fc * i);
end

plot(t,x);
hold on;

% s
h = figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(s);
stem(fx, abs(fftshift(fs)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before amplitude modulation');
print(h, '-dpng', 'coefficients_before_amod.png'); % doar daca vreti sa salvati ca png graficull


% x

h = figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(x);
stem(fx, abs(fftshift(fs)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before amplitude modulation');
print(h, '-dpng', 'coefficients_before_amod.png'); % doar daca vreti sa salvati ca png graficull

