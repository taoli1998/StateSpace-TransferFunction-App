function [A,B,C,D, ret] = PVF(num,denom)
    if length(num)>length(denom) || length(denom) == 1
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        
        ret = 0;
        return;
    end
    
    H = tf(num, denom);
    rg = order(H);
    a = denom;
    b = num;
    [Ac, Bc, Cc, Dc] = tf2ss(b, a);
    V = fliplr(eye(rg));
    A = inv(V)*Ac*V;
    B = inv(V)*Bc;
    C = Cc*V;
    D = Dc;
    ret = 1;
end