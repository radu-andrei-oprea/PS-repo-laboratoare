load("notes_signal_long.mat");
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



%sound(s);

t = 1:1:5;
news = ones(1);
for i = t
    news(i) = sin(392);
end
sound(news);


news_ = ones(1);
for i = t
    news_(i) = sin(440);
end
sound(news_);