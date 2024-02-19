img = imread('peppers.png');

img = double(rgb2gray(img))/255;

size(img)

S = fft2(img);

imagesc(log(abs(S)));

S1 = S;

for i = 1:30
    for j = 1:30
        S1(i,j) = 0;
    end
end

for i = 353:384
    for j = 1:30
        S1(i,j) = 0;
    end
end


for i = 1:30
    for j = 483:512
        S1(i,j) = 0;
    end
end

for i = 353:384
    for j = 483:512
        S1(i,j) = 0;
    end
end

figure;
imagesc(log(abs(S1)));

S2 = S;

for i = 31:352
    for j = 1:30
        S2(i,j) = 0;
    end
end

for i = 1:384
    for j = 31:482
        S2(i,j) = 0;
    end
end


for i = 31:352
    for j = 483:512
        S2(i,j) = 0;
    end
end

figure;
imagesc(log(abs(S2)));

figure;
imshow(real(ifft2(S1)))
title("high-pass")
figure;
imshow(real(ifft2(S2)))
title("low-pass")