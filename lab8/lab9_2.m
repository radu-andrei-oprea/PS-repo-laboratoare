N = 256;
fs = N;
t = linspace(0,1,N);
fc = fs/16;

HK = ones(1,N);

HK(17:N - 16) = 0;
plot(t, HK);


hk = ifftshift(ifft(HK));

figure;
plot(real(hk));


L = 65;
[N, M] = max(hk);

trunc = hk(M - 32: M + 32);

figure;
stem(trunc);

dft = fft(trunc);
figure;
plot(linspace(0,1,L), real(dft));


b = trunc .* blackman(L)';
plot(real(b));

N = 64;
f = 3;
fs = 64;
t = linspace(0,1,N);
x(1:N) = sin (2 * pi * f * t);


r = conv(x, real(b));

figure;
stem(r);
