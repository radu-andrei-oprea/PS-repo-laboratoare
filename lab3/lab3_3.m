
ff = 50;

k = 1;
l = 2;
f1 = k * ff;
f2= l * ff;
    
T = 1/ff;
t = 0:T/ff:T;

ra = randi([0,3],1,10);

rez = [];

for j = 1:length(ra)
    if ra(j) == 0
        rez = [rez, zeros(1,length(t))];
    elseif ra(j) == 1
        rez = [rez, sin(2*pi*f1*t)];
    elseif ra(j) == 2
        rez = [rez,sin(2*pi*f2*t)];
    elseif ra(j) == 3
        rez = [rez, sin(2*pi*f1*t) + sin(2*pi*f2*t)];
    end
end

plot(rez);
hold on;
