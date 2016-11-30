function [ fOut ] = filterSpeech(signal, Fs)
%filterSpeech Summary of this function goes here
%   Detailed explanation goes here


%% Design a bandpass filter that filters out between 700 to 12000 Hz
n = 7;
beginFreq = 700 / (Fs/2);
endFreq = 12000 / (Fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');

%% Filter the signal
fOut = filter(b, a, signal);

end

