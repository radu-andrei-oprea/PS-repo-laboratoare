N = 256;


bl = fir1(round(N)-1, 0.7, 'low');
[H, freq] = freqz(bl,1,N, fs);
figure;
plot(freq, abs(H));
xlabel('Frequency (Hz)');
ylabel('Frequency response');


bh = fir1(round(N)-1, 0.7, 'high');
[H, freq] = freqz(bh,1,N, fs);
figure;
plot(freq, abs(H));
xlabel('Frequency (Hz)' );
ylabel('Frequency response');


bp = fir1(round(N)-1, [0.3, 0.63], 'bandpass');
[H, freq] = freqz(bp,1,N, fs);
figure;
plot(freq, abs(H));
xlabel('Frequency (Hz)');
ylabel('Frequency response');


fs = 3000;

t = linspace(0, 1, N);
x(1:N) = sin (2 * pi * 3 * t);
figure;
plot(x);


y = filter(bl, 1, x);
figure; stem(real(y));

y = filter(bh, 1, x);
figure; stem(real(y));

y = filter(bp, 1, x);
figure; stem(real(y));