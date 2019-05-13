%Graph Laplacian: 5-Fold Cross-Validation 10 Times
%NOTE: if error, just run it again

%load('../fjlt/workspace.mat') 
load('../fjlt/workspace2.mat')

%% confusion matrices

%true labels
[num,txt]=xlsread('../ground_truth.xlsx');
labels = txt(:,2);
genrelabels=num(:,2);

b = [1 321 435 461 506 608 730]; %genre markers, b(i) is index of 1st song of ith genre
sub = [64;22;5;9;20;24]; %partition size, # of songs from each genre in test set
q=1; %q=1:50
for n = 1:10 %10 times
    S =[]; %song index array, scramble songs within each genre
   for j = 1:6
       l = length(b(j):b(j+1)-1); % number of songs in jth genre
       SS = b(j):b(j+1)-1; %indices of songs in jth genre
       gen = randperm(l);
       S = [S SS(gen)];
   end
   
   for t = 1:5 %5-fold
   test_set = []; %indices of test songs
   train_set=1:729;%indices of training songs, initializing the array with all songs
       for i=1:6
           G = S(b(i):b(i+1)-1);%scrambled indices of songs in ith genre
           test_set = [test_set G(sub(i)*(t-1)+1:sub(i)*t)]; %tth 1/5th of G
       end
       train_set(test_set)=[]; %remove the test set
       %X7670 = fjltmfccvecs7670(:,train_set); %training data
       %X8570 = fjltmfccvecs8570(:,train_set); %training data
       %X9470 = fjltmfccvecs9470(:,train_set); %training data
       %X10370 = fjltmfccvecs10370(:,train_set); %training data
       %X11270 = fjltmfccvecs11270(:,train_set); %training data
       %X12170 = fjltmfccvecs12170(:,train_set); %training data
       %X13070 = fjltmfccvecs13070(:,train_set); %training data
       %X13970 = fjltmfccvecs13970(:,train_set); %training data
       %X14870 = fjltmfccvecs14870(:,train_set); %training data
       %X15770 = fjltmfccvecs15770(:,train_set); %training data
       X256 = fjltmfccvecs256(:,train_set); %training data
       X512 = fjltmfccvecs512(:,train_set); %training data
       X1024 = fjltmfccvecs1024(:,train_set); %training data
       X2048 = fjltmfccvecs2048(:,train_set); %training data
       X3000 = fjltmfccvecs3000(:,train_set); %training data
       X4096 = fjltmfccvecs4096(:,train_set); %training data
       Y = genrelabels(train_set);
       %newX7670 = fjltmfccvecs7670(:,test_set); %testing data
       %newX8570 = fjltmfccvecs8570(:,test_set); %testing data
       %newX9470 = fjltmfccvecs9470(:,test_set); %testing data
       %newX10370 = fjltmfccvecs10370(:,test_set); %testing data
       %newX11270 = fjltmfccvecs11270(:,test_set); %testing data
       %newX12170 = fjltmfccvecs12170(:,test_set); %testing data
       %newX13070 = fjltmfccvecs13070(:,test_set); %testing data
       %newX13970 = fjltmfccvecs13970(:,test_set); %testing data
       %newX14870 = fjltmfccvecs14870(:,test_set); %testing data
       %newX15770 = fjltmfccvecs15770(:,test_set); %testing data
       newX256 = fjltmfccvecs256(:,test_set); %testing data
       newX512 = fjltmfccvecs512(:,test_set); %testing data
       newX1024 = fjltmfccvecs1024(:,test_set); %testing data
       newX2048 = fjltmfccvecs2048(:,test_set); %testing data
       newX3000 = fjltmfccvecs3000(:,test_set); %testing data
       newX4096 = fjltmfccvecs4096(:,test_set); %testing data
       %pgenrelabels7670 = GraphLaplacian(X7670,newX7670); %predicted labels
       %pgenrelabels8570 = GraphLaplacian(X8570,newX8570); %predicted labels
       %pgenrelabels9470 = GraphLaplacian(X9470,newX9470); %predicted labels
       %pgenrelabels10370 = GraphLaplacian(X10370,newX10370); %predicted labels
       %pgenrelabels11270 = GraphLaplacian(X11270,newX11270); %predicted labels
       %pgenrelabels12170 = GraphLaplacian(X12170,newX12170); %predicted labels
       %pgenrelabels13070 = GraphLaplacian(X13070,newX13070); %predicted labels
       %pgenrelabels13970 = GraphLaplacian(X13970,newX13970); %predicted labels
       %pgenrelabels14870 = GraphLaplacian(X14870,newX14870); %predicted labels
       %pgenrelabels15770 = GraphLaplacian(X15770,newX15770); %predicted labels
       pgenrelabels256 = GraphLaplacian(X256,newX256); %predicted labels
       pgenrelabels512 = GraphLaplacian(X512,newX512); %predicted labels
       pgenrelabels1024 = GraphLaplacian(X1024,newX1024); %predicted labels
       pgenrelabels2048 = GraphLaplacian(X2048,newX2048); %predicted labels
       pgenrelabels3000 = GraphLaplacian(X3000,newX3000); %predicted labels
       pgenrelabels4096 = GraphLaplacian(X4096,newX4096); %predicted
       m=length(test_set);
       true_genrelabels=genrelabels(test_set);  
       %[c7670,order] = confusionmat(true_genrelabels,pgenrelabels7670); %confusion matrix, order{i}=ith genre=ith row/column
       %[c8570] = confusionmat(true_genrelabels,pgenrelabels8570); %confusion matrix, order{i}=ith genre=ith row/column
       %[c9470] = confusionmat(true_genrelabels,pgenrelabels9470); %confusion matrix, order{i}=ith genre=ith row/column
       %[c10370] = confusionmat(true_genrelabels,pgenrelabels10370); %confusion matrix, order{i}=ith genre=ith row/column
       %[c11270] = confusionmat(true_genrelabels,pgenrelabels11270); %confusion matrix, order{i}=ith genre=ith row/column
       %[c12170] = confusionmat(true_genrelabels,pgenrelabels12170); %confusion matrix, order{i}=ith genre=ith row/column
       %[c13070] = confusionmat(true_genrelabels,pgenrelabels13070); %confusion matrix, order{i}=ith genre=ith row/column
       %[c13970] = confusionmat(true_genrelabels,pgenrelabels13970); %confusion matrix, order{i}=ith genre=ith row/column
       %[c14870] = confusionmat(true_genrelabels,pgenrelabels14870); %confusion matrix, order{i}=ith genre=ith row/column
       %[c15770] = confusionmat(true_genrelabels,pgenrelabels15770); %confusion matrix, order{i}=ith genre=ith row/column
       [c256,order] = confusionmat(true_genrelabels,pgenrelabels256); %confusion matrix, order{i}=ith genre=ith row/column
       [c512] = confusionmat(true_genrelabels,pgenrelabels512); %confusion matrix, order{i}=ith genre=ith row/column
       [c1024] = confusionmat(true_genrelabels,pgenrelabels1024); %confusion matrix, order{i}=ith genre=ith row/column
       [c2048] = confusionmat(true_genrelabels,pgenrelabels2048); %confusion matrix, order{i}=ith genre=ith row/column
       [c3000] = confusionmat(true_genrelabels,pgenrelabels3000); %confusion matrix, order{i}=ith genre=ith row/column
       [c4096] = confusionmat(true_genrelabels,pgenrelabels4096); %confusion matrix, order{i}=ith genre=ith row/column
       %C7670{q} = c7670./sum(c7670,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C8570{q} = c8570./sum(c8570,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C9470{q} = c9470./sum(c9470,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C10370{q} = c10370./sum(c10370,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C11270{q} = c11270./sum(c11270,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C12170{q} = c12170./sum(c12170,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C13070{q} = c13070./sum(c13070,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C13970{q} = c13970./sum(c13970,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C14870{q} = c14870./sum(c14870,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       %C15770{q} = c15770./sum(c15770,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       C256{q} = c256./sum(c256,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       C512{q} = c512./sum(c512,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       C1024{q} = c1024./sum(c1024,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       C2048{q} = c2048./sum(c2048,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       C3000{q} = c3000./sum(c3000,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       C4096{q} = c4096./sum(c4096,2); %edit new cell structure, C{q} = qth confusion matrix with rows normalized
       q=q+1;
   end       
end  
 
%AA7670 = cat(3,C7670{:}); %AA(i,j,q)=C{q}(i,j)
%AA8570 = cat(3,C8570{:}); %AA(i,j,q)=C{q}(i,j)
%AA9470 = cat(3,C9470{:}); %AA(i,j,q)=C{q}(i,j)
%AA10370 = cat(3,C10370{:}); %AA(i,j,q)=C{q}(i,j)
%AA11270 = cat(3,C11270{:}); %AA(i,j,q)=C{q}(i,j)
%AA12170 = cat(3,C12170{:}); %AA(i,j,q)=C{q}(i,j)
%AA13070 = cat(3,C13070{:}); %AA(i,j,q)=C{q}(i,j)
%AA13970 = cat(3,C13970{:}); %AA(i,j,q)=C{q}(i,j)
%AA14870 = cat(3,C14870{:}); %AA(i,j,q)=C{q}(i,j)
%AA15770 = cat(3,C15770{:}); %AA(i,j,q)=C{q}(i,j)
AA256 = cat(3,C256{:}); %AA(i,j,q)=C{q}(i,j)
AA512 = cat(3,C512{:}); %AA(i,j,q)=C{q}(i,j)
AA1024 = cat(3,C1024{:}); %AA(i,j,q)=C{q}(i,j)
AA2048 = cat(3,C2048{:}); %AA(i,j,q)=C{q}(i,j)
AA3000 = cat(3,C3000{:}); %AA(i,j,q)=C{q}(i,j)
AA4096 = cat(3,C4096{:}); %AA(i,j,q)=C{q}(i,j)

%AvC7670 = mean(AA7670,3); %average confusion matrix over all 5 cross-validations
%AvC8570 = mean(AA8570,3); %average confusion matrix over all 5 cross-validations
%AvC9470 = mean(AA9470,3); %average confusion matrix over all 5 cross-validations
%AvC10370 = mean(AA10370,3); %average confusion matrix over all 5 cross-validations
%AvC11270 = mean(AA11270,3); %average confusion matrix over all 5 cross-validations
%AvC12170 = mean(AA12170,3); %average confusion matrix over all 5 cross-validations
%AvC13070 = mean(AA13070,3); %average confusion matrix over all 5 cross-validations
%AvC13970 = mean(AA13970,3); %average confusion matrix over all 5 cross-validations
%AvC14870 = mean(AA14870,3); %average confusion matrix over all 5 cross-validations
%AvC15770 = mean(AA15770,3); %average confusion matrix over all 5 cross-validations
AvC256 = mean(AA256,3); %average confusion matrix over all 5 cross-validations
AvC512 = mean(AA512,3); %average confusion matrix over all 5 cross-validations
AvC1024 = mean(AA1024,3); %average confusion matrix over all 5 cross-validations
AvC2048 = mean(AA2048,3); %average confusion matrix over all 5 cross-validations
AvC3000 = mean(AA3000,3); %average confusion matrix over all 5 cross-validations
AvC4096 = mean(AA4096,3); %average confusion matrix over all 5 cross-validations
%sC7670 = std(AA7670,[],3); %std confusion matrix over all 5 cross-validations
%sC8570 = std(AA8570,[],3); %std confusion matrix over all 5 cross-validations
%sC9470 = std(AA9470,[],3); %std confusion matrix over all 5 cross-validations
%sC10370 = std(AA10370,[],3); %std confusion matrix over all 5 cross-validations
%sC11270 = std(AA11270,[],3); %std confusion matrix over all 5 cross-validations
%sC12170 = std(AA12170,[],3); %std confusion matrix over all 5 cross-validations
%sC13070 = std(AA13070,[],3); %std confusion matrix over all 5 cross-validations
%sC13970 = std(AA13970,[],3); %std confusion matrix over all 5 cross-validations
%sC14870 = std(AA14870,[],3); %std confusion matrix over all 5 cross-validations
%sC15770 = std(AA15770,[],3); %std confusion matrix over all 5 cross-validations
sC256 = std(AA256,[],3); %std confusion matrix over all 5 cross-validations
sC512 = std(AA512,[],3); %std confusion matrix over all 5 cross-validations
sC1024 = std(AA1024,[],3); %std confusion matrix over all 5 cross-validations
sC2048 = std(AA2048,[],3); %std confusion matrix over all 5 cross-validations
sC3000 = std(AA3000,[],3); %std confusion matrix over all 5 cross-validations
sC4096 = std(AA4096,[],3); %std confusion matrix over all 5 cross-validations
%save('GraphLaplacian','order','AvC7670','sC7670','AvC8570','sC8570','AvC9470','sC9470','AvC10370','sC10370','AvC11270','sC11270','AvC12170','sC12170','AvC13070','sC13070','AvC13970','sC13970','AvC14870','sC14870','AvC15770','sC15770')
save('GraphLaplacian','order','AvC256','sC256','AvC512','sC512','AvC1024','sC1024','AvC2048','sC2048','AvC3000','sC3000','AvC4096','sC4096')

%% plot average accuracy (average of accuracies for each class) vs. k

%kvals=7670:900:15770
%accs=zero(1,10);
kvals=[256 512 1024 2048 3000 4096];
accs=zeros(1,6);
%there are 64 classical and 81 non-classical in test set
%accs(1)=mean([AvC7670(1,1) AvC7670(2,2)]);
%accs(2)=mean([AvC8570(1,1) AvC8570(2,2)]);
%accs(3)=mean([AvC9470(1,1) AvC9470(2,2)]);
%accs(4)=mean([AvC10370(1,1) AvC10370(2,2)]);
%accs(5)=mean([AvC11270(1,1) AvC11270(2,2)]);
%accs(6)=mean([AvC12170(1,1) AvC12170(2,2)]);
%accs(7)=mean([AvC13070(1,1) AvC13070(2,2)]);
%accs(8)=mean([AvC13970(1,1) AvC13970(2,2)]);
%accs(9)=mean([AvC14870(1,1) AvC14870(2,2)]);
%accs(10)=mean([AvC15770(1,1) AvC15770(2,2)]);
accs(1)=mean([AvC256(1,1) AvC256(2,2)]);
accs(2)=mean([AvC512(1,1) AvC512(2,2)]);
accs(3)=mean([AvC1024(1,1) AvC1024(2,2)]);
accs(4)=mean([AvC2048(1,1) AvC2048(2,2)]);
accs(5)=mean([AvC3000(1,1) AvC3000(2,2)]);
accs(6)=mean([AvC4096(1,1) AvC4096(2,2)]);
figure
plot(kvals,accs,'.','MarkerSize',40)
set(gca,'FontSize',14)
title('Accuracy vs. Post-FJLT Dimension k')
xlabel('k')
ylabel({'Average Accuracy';'(Average of Accuracies for Each Class)'})
