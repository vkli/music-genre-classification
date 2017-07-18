% Spectral Clustering with Graph Laplacian
%NOTE: if error, just run it again

function y=GraphLaplacian(mfccs,testmfccs)
%training data mfccs=matrix with columns formed by songs/vectors of k dimensions each
%glabels(i)=genre # of ith song of training data: 1 classical, 2
%electronic, 3 jazz/blues, 4 metal/punk, 5 rock/pop, 6 world
%y0{i}=predicted genre of ith song of training data
%y(i)=predicted genre # of ith song of test data: 1 classical, 2
%non-classical

n=size(mfccs,2); %number of training songs

W=zeros(n,n);
for i=1:n
    for j=i+1:n
        distance=norm(mfccs(:,i)-mfccs(:,j));
        w=1/(1+distance);
        W(i,j)=w;
        W(j,i)=w;
    end
end

D=zeros(n,n);
for i=1:n
    D(i,i)=sum(W(i,:));
end

invrootD=zeros(n,n);
for i=1:n
    invrootD(i,i)=D(i,i)^(-1/2);
end

Lsym=eye(n)-invrootD*W*invrootD;

[U,S,V]=svd(Lsym); %Lsym has eigenvalues S(1,1)>=S(2,2)>=...>=S(n,n)
%eigenvectors of Lsym form columns of V
rootD=zeros(n,n);
for i=1:n
    rootD(i,i)=1/invrootD(i,i);
end

V=rootD*V; %Lrw has eigenvalues S(1,1)>=S(2,2)>=...>=S(n,n)
%eigenvectors of Lrw form columns of V

%cluster rows of V into 2 clusters using k-means:
idx=kmeans(V(:,1:2),2); %idx(i)= cluster # of V(i,:)= cluster # of ith song

%classification: classical (cluster 1) vs. non-classical (cluster 2) 
%(check confusion matrix to ensure optimal labels)

%classify test data
nn=size(testmfccs,2); %number of test songs
y=zeros(nn,1);
mfccsg1=mfccs(:,idx==1); %genre1 vectors
m1=size(mfccsg1,2);
mfccsg2=mfccs(:,idx~=1); %genre2 vectors
m2=size(mfccsg2,2);
for j=1:nn
    testvec=testmfccs(:,j); %test song
    d1s=zeros(1,m1);
    d2s=zeros(1,m2);
    for i=1:m1
        d1s(i)=norm(testvec-mfccsg1(:,i));
    end
    d1=mean(d1s); %average distance from cluster 1
    for i=1:m2
        d2s(i)=norm(testvec-mfccsg2(:,i));
    end
    d2=mean(d2s); %average distance from cluster 2
    ds=[d1 d2];
    [m,cl]=min(ds); %cl=cluster # of test song
    if cl==1
        y(j)=1;
    else
        y(j)=2;
    end
end