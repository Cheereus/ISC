clc;
clear all;
load norm_515_data.mat;
A=SpearMatrix(norm_515_data);
save  A.mat A;
C=zeros(198,9);   %198=length(NN)*length(alfa)
k=0;
for NN=[5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90]
for alfa=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]
knn=A;  %k near neighbour
kfn=A;  %k far neighbour
B=sort(A,2);
for i=1:size(A,1)
    for j=1:size(A,2)
        if A(i,j)<B(i,size(A,2)-NN)   %incidence matrix based on similarities
            knn(i,j)=0;
        end
       %if A(i,j)>B(i,NN)
        if A(i,j)>B(i,floor(NN/2))   % incidence matrix based on dissimilarities
            kfn(i,j)=0;
        end
    end
end
for i=1:size(knn,1)
    for j=1:size(knn,2)
        if knn(i,j)~=0
            knn(j,i)=knn(i,j);
        end
         if kfn(i,j)~=0
            kfn(j,i)=kfn(i,j);
         end
    end
end
knn=knn-eye(size(knn,1));
save knn.mat knn;
save kfn.mat kfn;
trans_network=(1-alfa)*knn+alfa*kfn; %incorporating similarity matrix  with dissimilarity matrix
save trans_network.mat trans_network;
spectral_clustering;
evaluate;
k=k+1;
%C(k,:)=[NN,NN,alfa,val,AR,RI,MI,HI,score];
C(k,:)=[NN,NN/2,alfa,val,AR,RI,MI,HI,score];
end
end
        
