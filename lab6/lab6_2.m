S = load('noisy_sound.mat');
s = S.noisy_sound;
fs = S.fs;

N = 500;
t = 1:1:fs;
figure;
fft_s = fft(noisy_sound);
stem(abs(fft_s));


p_semnal = 0;
for i = 1:500
    p_semnal = p_semnal +  abs(fft_s(i)) ^ 2;
end
for i = 7501:8000
    p_semnal = p_semnal +  abs(fft_s(i)) ^ 2;
end
p_semnal = p_semnal / 500;

p_noise = 0;
for i = 1:fs
    p_noise = p_noise + abs(noisy_sound(i)) ^ 2;
end
p_noise = p_noise / fs;

snr = p_semnal / p_noise;


%{
clean_signal = zeros(1,fs);
for i = 1:500
    clean_signal(i) = ;
end
for i = 7501:8000
    clean_signal(i) = fft_s(i) * fs / N;
end
%}

K = N * length(fft_s) / fs;
clean_signal = fft_s;

for i = K : (length(fft_s) - K)
    clean_signal(i) = 0;
end

figure;
stem(abs(clean_signal));

ifft_signal = ifft(clean_signal);
figure;
plot(real(ifft_signal));
title("ifft signal");


sound(real(ifft_signal));