load trans_network.mat;
trans_network=trans_network-diag(diag(trans_network));
W=trans_network;
D=diag(sum(trans_network'));
L=D-W;
K=3; % true cluster number
[X,di]=eig(L);
[Xsort,Dsort]=eigsort(X,di);
Xuse=Xsort(:,end:-1:end-K+1);
save Dsort.mat Dsort;
save Xsort.mat Xsort;
Xsq=Xuse.*Xuse;
divmat=repmat(sqrt(sum(Xsq')'),1,K);
Y=Xuse./divmat;
[c,Dsum,z]=kmeans(Y,K);
kk=c;
save kk.mat kk;