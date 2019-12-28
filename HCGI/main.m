
clear; clc;
bodysite = importdata('test.txt');
for n = 1:length(bodysite),
    file_interaction = strcat('...\H_',bodysite(n),'_interaction_new.txt');
    if (exist(file_interaction{1}) )
        a=importdata(file_interaction{1});
        file_H = strcat('...\H_',bodysite(n),'_interaction_H.txt');
        b=importdata(file_H{1});
        W = a.data;
        
        %                 W = a;
        WW=W;
        labels = b.textdata;
        %labels = labels(2:end,1);
        H = b.data;
        H(find(H~=0))=1;
        e_num=size(H,1);
        %         %%%%%%%%scatter matrix weighting%%%%%
        W=diag(W);
        W1=H'*W;
        We=zeros(e_num,e_num);
        
        miu=1;
        for k1=1:e_num
            a1=W1(:,k1);
            b1=find(a1);
            X=(W1(b1,:));
            %             mean(X,1)
            mean1=mean(X)/3;
            bbb=repmat(mean1,3,1);
            X = X - bbb;
            S = X*X';
            We(k1,k1)=1/(trace(exp(S)/miu));
        end
        W=We;
        W=We(find(We));
        [A]= Clique_A(W,H,e_num);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % calculate weight of graph
        N = size(H,2);%calculate the size of data
        XX=zeros(1,N);
        %N/2:because only half data are in one line
        C = nchoosek(1:N,3);%find eage of hypergraph:every 3 points own an eage
        L = size(C,1);
        sim = similarity(H,C,W);
        %     end
        %% clustering
        T = Gametheory_cluster(XX, 0.005, sim, C);%
        %% black point in a cluster
        S = T>0.00001;
        hold on
        for i = 1:N
            if(S(i) >  0)
                i
            end
        end
        
    end
    
end
% save result_i.mat Q_max cluster_num cluster1%neurons conductance

