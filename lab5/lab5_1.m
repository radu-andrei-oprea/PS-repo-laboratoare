
N = 128;
t = linspace(0, 1, N);

frecv= 1;
frecv = 100;

x(1:length(t)) = sin(2 * pi * frecv * t);

y(1:length(t)) = 0;
%y(1) = d1;
%y(2) = 0.5 * (d1 + d2);
%y(3) = (d1 + d2 + d3) / 3;
%y(4) = 0.25 * (d1 + d2 + d3 + d4);
%y(5) = 0.2 * (d1 + d2 + d3 + d4 + d5);



for i = 5 : length(t)
    y(i) = mean(x(i-4:i));
end

figure;
plot(t,y,"--");
hold on;
plot(t,x);