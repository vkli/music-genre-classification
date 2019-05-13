# music-genre-classification
Music Information Retrieval: Genre Classification

Due to space constraints, I have only included 4 music files from ISMIR 2004 in Data/tracks.

To calculate the MFCCs of the included music files, run mfcc.m.

To run the rest of the code, first make sure there are a total of 729 .wav files in Data/tracks numbered 1.wav, 2.wav, ..., 729.wav and change n=4 to n=729 in mfcc.m.

Then run the Fast Johnson Lindenstrauss Transform in fjlt. The result is fjlt/workspace2.mat which I have included for your convenience.

Then run GraphLaplacian2 in spectral clustering. It will output the cross-validation matrices (AvC256, sC256, etc.) for various FJLT dimensions (256, etc.) and graph the average accuracy for each.
