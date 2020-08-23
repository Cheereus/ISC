function SA=SpearMatrix(A)
for i=1:size(A,2)
    for j=i:size(A,2)
        SA(i,j)=corr(A(:,i),A(:,j),'type','Spearman');
        SA(j,i)=SA(i,j);
    end
end