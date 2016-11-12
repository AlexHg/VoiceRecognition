clear all

[y, Fs] = audioread('data/inne.wav');
r = xcorr(y,y);
plot(r,r);