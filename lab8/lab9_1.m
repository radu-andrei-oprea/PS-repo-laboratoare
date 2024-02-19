clear; clc;



%2
x = [1,3,5,7,5,4,2];
h = [0.1, 0.3, 0.1];

y = conv_(x, h, 5);


%3
N = 64;
f = 3;
fs = 64;

t = linspace(0, N /fs, N);
x(1:N) = sin (2 * pi * f * t);

figure;
plot(x);

h = [0.1, 0.2, 0.2, 0.2, 0.1];

y = conv_(x,h,N);

figure; stem(x);
figure; stem(y);


%4
x = [0, 0, 0, 0, 1, 0, 0, 0, 0];
h = [0.1, 0.2, 0.2, 0.2, 0.1];
y = conv_(x, h, 9);

figure; stem(y);

%5
y = conv(x,h);
figure; stem(y);




function y = conv_(x, h, n)
    h = flip(h);
    M = length(h);
    y = zeros(n,1);
    
    s = 0;
    
    for i = 1 : n - M + 1
        for j = 1 : M
          s = s + h(j) * x(i + j - 1);  
        end
        y(i) = s;
        s = 0;
    end
end
