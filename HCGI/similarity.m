function sim = similarity(H,C,W)
%calculate similarity of three point

W=W';
[m,n]=size(H);
for i=1:m
            k=1;
    for j=1:n
            if (H(i,j)==1)
                cc(i,k)=j;
                k=k+1;
            end
            j=j+1;
    end
end

[c, ia, ib] = intersect(cc,C,'rows');

sim=ones(size(C,1),1);
sim=sim/(2^10);
for i=1:size(ia)
        sim(ib(i)) = W(ia(i));
end
end
