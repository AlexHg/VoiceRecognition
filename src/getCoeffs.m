function [coeffs] = getCoeffs(filename, dtPart)

[signal, Fs] = audioread(filename);


%% Divide signal into parts
I0 = 1;
totalSampleCount = length(signal);
samplePartCount = round(Fs*dtPart)-1;

i=1;
coeffs = [];
%% Loop
while (I0 + samplePartCount <= totalSampleCount)
    Iend = I0 + samplePartCount;
    part = signal(I0:Iend);
    L  = length(part);
    %% Fourier analysys    
    fftResult = fft(part);
    
    P2 = abs(fftResult)/20;
    P1 = P2(1:L/2+1);
    P1(2:end-1) = P1(2:end-1);
    samplesFreq = Fs*(0:(L/2))/L;
    plot(samplesFreq,P1);
    
    %% Bank filtrów - 8-12 filtrów, w czêstotliwoœciach mowy (5-8kHz - do sprawdzenia)
    coeffs(:,i) = triangleFilter(P1, samplesFreq);
    
    I0 = Iend;
    i = i+1;
end








