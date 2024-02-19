N_analog = 5000;
t = linspace(0, 5, N_analog); 

frecv = 1;

s_analog = sin(2 * pi * frecv * t);

figure;
plot(t,s_analog);
hold on;

N_digital = N_analog / 100;
s_digital = zeros(1,N_analog);

for i = 1:N_digital
    s_digital(i*100) = s_analog(i * 100);
end

stem(t, s_digital);

%N_continuu = N_analog;
%s_continuu = zeros(1, N_continuu);

s_cont = s_digital;
f_s = 10;

N_sinc = N_analog;
t_sinc = linspace(-0.2, 0.2, N_sinc/10);
sincvec = sinc(f_s*t_sinc);
s_cont_filtered = conv(s_cont, sincvec);

figure;
plot(t_sinc, sincvec);
figure;
plot(s_cont_filtered);