function S = S1(y, e)
    if(e > 10)
        S = y + 5;
    elseif (e > 0)
        S = y + 1;
    elseif(y == 0)
        S = y;
    end
end