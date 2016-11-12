clear all

[y, Fs] = audioread('data/sl.wav');
[x, Fs2] = audioread('data/calosc.wav');
[z, Fs2] = audioread('data/inne.wav');

%plot(y);
% Y = fft(y(1:1000),100);
% plot((1:100),Y);
subplot(4,1,1);
plot(y);
subplot(4,1,2);

plot(x);
subplot(4,1,3);
r = xcorr(x,y);

plot(r);
subplot(4,1,4);
rw = xcorr(y,z);
plot(rw);