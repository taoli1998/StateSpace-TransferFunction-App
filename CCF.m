function [A,B,C,D, ret] = CCF(num,denom)
    a = denom;
    b = num;
    
    if length(b)>length(a) || length(a) == 1
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        
        ret = 0;
        return;
    elseif length(b)<length(a)
        z = zeros(1,length(a)-length(b));
        b = [z b];
    end
    
    if a(1) ~= 1
        b = b./a(1);
        a = a./a(1);
    end
    
    A = zeros(length(a)-1);
    B = zeros(length(a)-1,1);
    C = zeros(1,length(a)-1);
    C (1,length(a)-1) = 1;
    D = 0;
    
    for i = 1:length(a)-1
        if i ~= 1
            A(i,i-1) = 1;
        end
        A(i,length(a)-1) = -a(length(a)+1-i);
        B(i,1) = b(length(b)+1-i);
    end
    A = A.';
    temp = B;
    B = C.';
    C = temp.';
    
    ret = 1;
end