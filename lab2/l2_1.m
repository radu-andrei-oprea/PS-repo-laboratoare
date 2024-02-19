%A1 = [1 2 3; 4 5 6; 7 8 9];
%A2 = [10 11 12; 13 14 15; 16 17 18];


f1 = 1600;
f2 = 1800;


T = 1/200;    %cmmdc 
t = [0: T/500: T];

%A1 = 1;
%A2 = 5;

A1 = 1*sin(2 * pi * f1 * t);
A2 = 5*sin(2 * pi * f2 * t);



%plot(A1, A2, "-b");

plot(t, A1, "-b");
hold on;
plot(t,A2,"-r");
hold on;

plot(t, (A1 + A2), "-g");