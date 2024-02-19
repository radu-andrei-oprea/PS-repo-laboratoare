%1
load('noisy_signal.mat');
N = 128;
fs = N; 

t = linspace(0, 1, N);

kmax = 9;
k = 1:N;

s_dft = zeros(1,N);

%plot(t,s);

for i = 1:N
    for j = 1:N
        s_dft(i) = s_dft(i) + noisy_signal(j) * exp(-1j * 2 * pi * (i-1) * (j-1) / N);
    end
end

figure;
stem(abs(s_dft), 'LineWidth',1);
title("dft signal");

figure;
spectrum = fft(noisy_signal);
shift_spectrum = fftshift(spectrum);
stem(abs(spectrum));
title("fft signal");


p_semnal = 0;
for i = 1:10
    p_semnal = p_semnal +  (abs(s_dft(i))) ^ 2;
end
for i = 120:128
    p_semnal = p_semnal +  (abs(s_dft(i))) ^ 2;
end
p_semnal = p_semnal / 19;

p_noise = 0;
for i = 1:N
    p_noise = p_noise + (abs(s_dft(i))) ^ 2;
end
p_noise = p_noise / 128;

%decibeli
snr = p_semnal / p_noise;

snr
10 * log10(snr)

clean_signal = zeros(1,128);        
for i = 1:10
    clean_signal(i) = spectrum(i);
end
for i = 119:128
    clean_signal(i) = spectrum(i);
end

figure;
stem(abs(clean_signal));
title("clean signal");

ifft_signal = ifft(clean_signal, N);
figure;
plot(t, ifft_signal);
title("ifft signal");

s_idft = zeros(1, N);

for i = 1:N
    for j = 1:N
        s_idft(i) = s_idft(i) + clean_signal(j) * exp(1j * 2 * pi * (i-1) * (j-1) / N);
    end
end

s_idft = s_idft / N;
figure;
plot(t, s_idft);
title("reconstructed signal");
