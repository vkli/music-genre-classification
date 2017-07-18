function wav=loadwav(filename)

%load 2 minutes from the center of a wav file into matlab

[data fs]=audioread(filename);

% data = sound wave = amplitude vs. time
%fs=11025; %sampling frequency 11025 Hz
%x=1:70000;
%data=sin(x);
%sound(data,fs) %play sound, ~6 sec

%sampling rate fs = 11025 Hz:
%info=audioinfo('~/Desktop/Project/Data/tracks/artist_1_album_1_track_1.wav')

if fs~=11025,
    error([filename,':fs is not 11025(',num2str(fs),')'])
end

%extract middle 2 minutes
siz=size(data);
if siz(1)>fs*120,
    x0=ceil(siz(1)/2-fs*60);
    x1=floor(siz(1)/2+fs*60);
else
    x0=1;
    x1=siz(1);
end

% audioread returns values = sound wave = wav in the range -1 to 1
wav=audioread(filename,[x0 x1]);