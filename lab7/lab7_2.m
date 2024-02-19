load("notes_signal.mat");
figure;
plot(notes_signal);

N = length(notes_signal);
fx = zeros(1, N);
fidx = (fs/N) * linspace(0,N-1,N);

spectrum = fft(notes_signal, N);
figure;
stem(fidx, abs(spectrum));

ts=1/fs;

h = hamming(length(notes_signal));
h = h';
%figure;
%plot(h);

s = notes_signal .* h;
figure;
plot(s);    

spectrum = fft(s, N);
figure;
stem(fidx, abs(spectrum));



