function [coeffs] = triangleFilter(fftResult, filtersBankLength)

seriesLength = length(fftResult);
freqMiddles = round(linspace(1, seriesLength, filtersBankLength + 2));
coeffs = zeros(1, filtersBankLength);

for i = 1:filtersBankLength
   filter = singleFilter(freqMiddles(i),freqMiddles(i+1),freqMiddles(i+2), seriesLength); 
   coeffs(i) = sum(filter*fftResult);
   %plot(filter, 'color',rand(1,3));
   %hold on
end

