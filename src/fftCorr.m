clear all
clear figure

[word, Fs] = audioread('data/slowo.wav');
%[wholeSignal, Fs2] = audioread('data/calosc.wav');
%[wholeSignal, Fs2] = audioread('data/joanna.wav');
[wholeSignal, Fs2] = audioread('data/bezSlowa.wav');
%sound(wholeSignal*10, Fs);

%% Bandpass filter
% sound(word*10, Fs);
% word = filterSpeech(word, Fs);
% sound(word*10, Fs);
% wholeSignal = filterSpeech(wholeSignal, Fs);

%% Word FFT
fftN = 10;
period = 0.1;
wordFftCol = floor (length(word)/(Fs*period));
for i = 1:wordFftCol
    wordPart = word(((i-1)*Fs*period) + 1 : i*Fs*period);
%    wordFft(:, i) = abs(fft(wordPart, fftN));
    wordFft(:, i) = pyulear(wordPart,12,fftN,Fs);
end

%% WholeSignal FFT

wholeFftCol = floor (length(wholeSignal)/(Fs*period));
for i = 1:wholeFftCol
    wholePart = wholeSignal(((i-1)*Fs*period) + 1 : i*Fs*period);
    %wholePartsFft(:, i) = abs (fft(wholePart, fftN));
    wholePartsFft(:, i) = pyulear(wholePart,12,fftN,Fs);
end

%% Correlation Coefficients

matrixesFromWholeCount = wholeFftCol - wordFftCol - 1;
for j = 1:matrixesFromWholeCount
    matrixFromWhole = wholePartsFft(:, j : wordFftCol+(j-1));
    cc = corr2(matrixFromWhole, wordFft);
    corCoefs(j) = cc;
end
plot(corCoefs);

%%
% corrLength=length(wordPart)+length(wholeSignal)-1;
% 
% c=fftshift(ifft(fft(wholeSignal,corrLength).*conj(fft(wordPart,corrLength))));
% subplot(i,1,j);
% plot(c);


