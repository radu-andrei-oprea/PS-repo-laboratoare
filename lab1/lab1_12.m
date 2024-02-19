%image(IR);
%image(R1);
%image(R2);
%new = (IR - R1 * 0.3 - R2 * 0.3) / 0.3;
%image(new)


m13a = randi(50,1000);
m13b = randi(50,1000);

%tic

%for i = 1 : length(1000)
%    for j = 1 : width(1000)
%        m13a(i,j) = m13a(i,j) * m13b(i,j);
%    end
%end

tic
for j = 1 : length(1000)
    for i = 1 : width(1000)
        m13a(i,j) = m13a(i,j) * m13b(i,j);
    end
end
toc
%toc

%tic 
%m13 = m13a .* m13b;
%toc