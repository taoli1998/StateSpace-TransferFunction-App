function [A,B,C,D,ret] = JCF(num,denom)
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

    r = flip(r);
    p = flip(p);
    A = zeros(length(p));
    B = zeros(length(p),1);
    C = zeros(1,length(p));
    for i=1:length(p)
        if i~= length(p)
            if p(i) == p(i+1)
                A(i,i+1) = 1;
            else
                B(i,1)=1;
            end
        else
            B(i,1)=1;
        end
        A(i,i) = p(i);
        C(1,i) = r(i);
    end
    D = 0;
    ret = 1;

%     a = denom;
%     b = num;
%     [r,p] = residue(b,a);
%     r = flip(r);
%     p = flip(p);
%     A = zeros(length(p));
%     B = zeros(length(p),1);
%     C = zeros(1,length(p));
%     for i=1:length(p)
%         A(i,i) = p(i);
%         B(i,1) = 0;
%         C(1,i) = r(i);
%     end
%     D = 0;
%     for i=1:length(p)-1
%         if A(i,i) == A(i+1,i+1)
%             A(i,i+1)=1;
%         else
%             B(i,1) = 1;
%             
%         end
%     end
%     B(length(p),1)=1;
 
end