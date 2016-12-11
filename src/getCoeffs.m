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

    %% Fourier analysys    
    fftResult = abs(fft(part, fftPoints))/length(part);
    
    %% Bank filtrów - 8-12 filtrów, w czêstotliwoœciach mowy (5-8kHz - do sprawdzenia)
    coeffs(:,i) = triangleFilter(fftResult, filtersBankLength);
    
    I0 = Iend;
    i = i+1;
end








