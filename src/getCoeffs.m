function [coeffs] = getCoeffs(filename, dtPart, fftPoints, filtersBankLength)

[signal, Fs] = audioread(filename);



%% Divide signal into parts
I0 = 1;
totalSampleCount = length(signal);
samplePartCount = round(Fs*dtPart);

i=1;
coeffs = [];
%% Loop
while (I0 + samplePartCount <= totalSampleCount)
    Iend = I0 + samplePartCount;
    part = signal(I0:Iend);
    L  = length(part);
    %% Fourier analysys    
    fftResult = fft(part);
    
    P2 = abs(fftResult/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    plot(f,P1);
    
    %% Bank filtrów - 8-12 filtrów, w czêstotliwoœciach mowy (5-8kHz - do sprawdzenia)
    coeffs(:,i) = triangleFilter(fftResult, filtersBankLength);
    
    I0 = Iend;
    i = i+1;
end








