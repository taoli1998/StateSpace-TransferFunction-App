function [A,B,C,D, ret] = DCF(num,denom)
    if length(num)>length(denom) || length(denom) == 1
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        
        ret = 0;
        return;
    end
    
    a = denom;
    b = num;
    [r,p] = residue(b,a);
    r = sort(r);
    p = sort(p);
    for i=1:length(p)
        A(i,i) = p(i);
        B(i,1) = 1;
        C(1,i) = r(i);
    end
    D = 0;
    ret = 1;
end