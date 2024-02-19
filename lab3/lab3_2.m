T = 100;
A = 1;

%1
s = ones(100);

s(1:T/2) = A;
s(T/2:100) = -A;

plot(t,s);
ylim([-A-1, A+1])
hold on;


%2
k = 0:500
ck = zeros(1,500);


for i = 1 : length(k)
    if mod(k(i),2) == 1
        ck(i) = (2*A)/ (1j * pi * k(i));
    else
        ck(i) = 0;
    end
end

%stem(k, abs(ck));