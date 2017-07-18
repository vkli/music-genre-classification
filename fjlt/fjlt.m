% Fast Johnson Lindenstrauss Transform

%% Part 1 (not timed)

%space: n=729 songs/vectors of d samples each, as columns of matrix X
%project down to k samples
%Euclidean distance distortion within k(1 +or- epsilon) w.p. >= 2/3

%epsilon=.1;
epsilon=.1; eta=.5;
epsilon=.5; eta=.5;

%choose k >= 8*ln(n*sqrt(2)/sqrt(eta))/epsilon^2
%k must be a power of 2 for optimal performance
%details see http://www.fftw.org/fftw3_doc/Real_002dto_002dReal-Transforms.html#Real_002dto_002dReal-Transforms

%k=8192; %2^13 >= 800*ln(20*729) = 7670
k=4096; %2^12 ~ 800*ln(2*729) = 5828
k=8192; %2^8 >= 32*ln(2*729) = 233

%load mfccs 20xjxn matrix
%j = 1653, d = 20j = 33060
load('../workspace.mat') 

%turn mfcc matrices into vectors, form dxn matrix X
n=size(mfccs,3);
j=size(mfccs,2);
d=size(mfccs,1)*j;

mfccs=permute(mfccs,[1 3 2]); %20xnxj matrix
X=cat(1,mfccs(:,:,1),mfccs(:,:,2));
for i=3:j
    X=cat(1,X,mfccs(:,:,i)); %dxn matrix
end

T=table(X);
writetable(T,'X.xlsx')

% Part 2

%calculate fjlt(X) in Python (see install fjlt tips) for various k
%save as fjltmfccvecsk.xlsx for each k

%% Part 3 (not timed)

%for each k, import fjltmfccvecsk.xlsx as kxn matrix fjltmfccvecsk
%whose columns are n songs/vectors of k samples each
%kvals=7670:900:15770;
kvals=[256 512 1024 2048 3000 4096];
%fjltmfccvecs7670=xlsread('fjltmfccvecs7670.xlsx');
%fjltmfccvecs8570=xlsread('fjltmfccvecs8570.xlsx');
%fjltmfccvecs9470=xlsread('fjltmfccvecs9470.xlsx');
%fjltmfccvecs10370=xlsread('fjltmfccvecs10370.xlsx');
%fjltmfccvecs11270=xlsread('fjltmfccvecs11270.xlsx');
%fjltmfccvecs12170=xlsread('fjltmfccvecs12170.xlsx');
%fjltmfccvecs13070=xlsread('fjltmfccvecs13070.xlsx');
%fjltmfccvecs13970=xlsread('fjltmfccvecs13970.xlsx');
%fjltmfccvecs14870=xlsread('fjltmfccvecs14870.xlsx');
%fjltmfccvecs15770=xlsread('fjltmfccvecs15770.xlsx');
fjltmfccvecs256=xlsread('fjltmfccvecs256.xlsx');
fjltmfccvecs512=xlsread('fjltmfccvecs512.xlsx');
fjltmfccvecs1024=xlsread('fjltmfccvecs1024.xlsx');
fjltmfccvecs2048=xlsread('fjltmfccvecs2048.xlsx');
fjltmfccvecs3000=xlsread('fjltmfccvecs3000.xlsx');
fjltmfccvecs4096=xlsread('fjltmfccvecs4096.xlsx');


%perform clustering of fjltmfccvecsk for each k