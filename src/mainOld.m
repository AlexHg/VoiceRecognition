clear all

%%
[word, Fs] = audioread('data/slowo.wav');
[wholeSignal, Fs2] = audioread('data/calosc.wav');
%[anotherSignal, Fs2] = audioread('data/inne.wav');


%%
%plot(y);
% Y = fft(y(1:1000),100);
% plot((1:100),Y);
subplot(4,1,1);
plot(word);

subplot(4,1,2);
plot(wholeSignal);

[mainCor, lag] = xcorr(wholeSignal,word);
subplot(4,1,3);
plot(lag/Fs, mainCor);

%%
wordLeng = length(word);
[~, i] = max(abs(mainCor));
sampleDiff = lag(i);

wordFromSignal = wholeSignal(sampleDiff : sampleDiff + wordLeng);
subplot(4,1,4);
plot(wordFromSignal);
sound(wordFromSignal*10, Fs);
%%
% subplot(4,1,4);
% rw = xcorr(word,anotherSignal);
% plot(rw);