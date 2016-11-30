function [formants] = getFormantsMatrix(filename, dtPart)

%% Formant Estimation with LPC Coefficients
% This example shows how to estimate vowel formant frequencies using linear
% predictive coding (LPC). The formant frequencies are obtained by finding
% the roots of the prediction polynomial.
%
% This example uses the speech sample mtlb.mat, which is part of Signal
% Processing Toolbox(TM). The speech is lowpass-filtered. Because of the
% low sampling frequency, this speech sample is not optimal for this
% example. The low sampling frequency limits the order of the
% autoregressive model you can fit to the data. In spite of this
% limitation, the example illustrates the technique for using LPC
% coefficients to determine vowel formants.

%%
% Load the speech signal. The recording is a woman saying "MATLAB". The
% sampling frequency is 7418 Hz.
%load mtlb
[word, Fs] = audioread(filename);

%%
% The MAT file contains the speech waveform, mtlb, and the sampling
% frequency, |Fs|.
%
% Use the |spectrogram| function to identify a voiced segment for analysis.

% segmentlen = 100;
% noverlap = 90;
% NFFT = 128;

%spectrogram(mtlb,segmentlen,noverlap,NFFT,Fs,'yaxis')
%title('Signal Spectrogram')

%%
% Extract the segment from 0.1 to 0.25 seconds for analysis. The extracted
% segment corresponds roughly to the first vowel, /ae/, in "MATLAB".
dt = 1/Fs;


%% Calculation for 10ms parts
I0 = 1;
totalSampleCount = length(word);

samplePartCount = round(Fs*dtPart);

i=1;
formants = [];
%% Loop
while (I0 + samplePartCount <= totalSampleCount)
Iend = I0 + samplePartCount;
signal = word(I0:Iend);

formants(:,i) = calcFormants(signal, Fs);

I0 = Iend;
i = i+1;
end
