%number songs from 1 to n=# of songs as in ground_truth.csv
%save ground_truth.csv as ground_truth.xlsx

addpath ./Data/software/ma
n=4;%729; %number of songs
p=struct('fs',11025,'visu',0); %visu=1 include plots, visu=0 don't include
i=1;
song=loadwav(['./Data/tracks/',num2str(i),'.wav']);
mfccvals=ma_mfcc(song,p);
j=size(mfccvals,2); %number of time frames (min of all songs)

%for uniformity, take the first j= 1653 frames from the middle 2 minutes of
%each song
for i=2:n
    song=loadwav(['./Data/tracks/',num2str(i),'.wav']);
    mfccvals=ma_mfcc(song,p);
    j2=size(mfccvals,2);
    if j2<j
        j=j2;
    end
end

j

%mfccs(w,x,y) = wth mfcc of xth frame of yth song
mfccs=zeros(20,j,n);
for i=1:n
    song=loadwav(['./Data/tracks/',num2str(i),'.wav']);
    mfccvals=ma_mfcc(song,p);
    mfccs(:,:,i)=mfccvals(:,1:j);
end

[num,txt]=xlsread('./ground_truth.xlsx');
Name=txt(:,1);
TrackName=cell(20*n,1);
TrackNumber=cell(20*n,1);
MFCCNumber=zeros(20*n,1);
Frame=zeros(20*n,j);
for k=1:n
    TrackName(20*(k-1)+1,1)=Name(k,1);
    TrackNumber(20*(k-1)+1,1)={num2str(k)};
    MFCCNumber(20*(k-1)+1:20*(k-1)+20)=[1:20]';
    Frame(20*(k-1)+1:20*(k-1)+20,:)=mfccs(:,:,k);
end
T=table(TrackName,TrackNumber,MFCCNumber,Frame);
writetable(T,'mfccs.xlsx')
