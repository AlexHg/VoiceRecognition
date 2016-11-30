function [formants] = calcFormants(signal, Fs)

%%
% Two common preprocessing steps applied to speech waveforms before linear
% predictive coding are windowing and pre-emphasis (highpass) filtering.
%
% Window the speech segment using a Hamming window.

signalH = signal.*hamming(length(signal));

%%
% Apply a pre-emphasis filter. The pre-emphasis filter is a highpass
% all-pole (AR(1)) filter.

preemph = [1 0.63];
signalH = filter(1,preemph,signalH);

%%
% Obtain the linear prediction coefficients. To specify the model order,
% use the general rule that the order is two times the expected number of
% formants plus 2. In the frequency range, [0,|Fs|/2], you expect three
% formants. Therefore, set the model order equal to 8. Find the roots of
% the prediction polynomial returned by |lpc|.

A = lpc(signalH,8);
%rts = roots(A);

%%
% Because the LPC coefficients are real-valued, the roots occur in complex
% conjugate pairs. Retain only the roots with one sign for the imaginary
% part and determine the angles corresponding to the roots.

%rts = rts(imag(rts)>=0);
%angz = atan2(imag(rts),real(rts));

%%
% Convert the angular frequencies in rad/sample represented by the
% angles to Hz and calculate the bandwidths of the formants.
%
% The bandwidths of the formants are represented by the distance of the
% prediction polynomial zeros from the unit circle.

%[frqs,indices] = sort(angz.*(Fs/(2*pi)));
%bw = -1/2*(Fs/(2*pi))*log(abs(rts(indices)));

%%
% Use the criterion that formant frequencies should be greater than 90 Hz
% with bandwidths less than 400 Hz to determine the formants.
formants = zeros([1 9]);
% 
% nn = 1;
% for kk = 1:length(frqs)
%     if (frqs(kk) > 90 && bw(kk) <400)
%         formants(nn) = frqs(kk);
%         nn = nn+1;
%     end
% end


formants = A(1:9);