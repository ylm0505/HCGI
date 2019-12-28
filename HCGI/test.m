clear
clc
% B=[1 2 3 4 5; 0 0 0 0 1;1 2 3 4 5;0 1 0 1 2];
% [row,col]=find(B~=0);
% ind=zeros(size(B,1),3);


% xx=[1 2 1 7 ;1 0 3 1;2 0 1 1];
% yy=[1];
% % [a b]=ismember(yy,xx)
% [i,j]=find(xx>0|xx<0) %列出所有非零元的坐标
% [i,j]=find(xx==1)
R=[1 2 1 1 2
    1 0 0 1 1
    4 1 1 0 1
    1 1 1 2 0
    5 1 1 1 0];
[m,n]=size(R);

for i=1:m
            k=1;
    for j=1:n
            if (R(i,j)==1)
                X(i,k)=j;
                k=k+1;
            end
            j=j+1;
    end
end