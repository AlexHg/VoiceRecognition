function [coeffs] = triangleFilter(fftResult, samplesFreq)

seriesLength = length(fftResult);
% freqMiddles = round(linspace(1, seriesLength, filtersBankLength + 2));
[middlesIndexes, filtersBankLength] = calcMiddles(samplesFreq);

coeffs = zeros(1, filtersBankLength);

for i = 1:filtersBankLength
   filter = singleFilter(middlesIndexes(i),middlesIndexes(i+1),middlesIndexes(i+2), seriesLength); 
   coeffs(i) = sum(filter*fftResult);
   plot(filter, 'color',rand(1,3));
   hold on
end

plot(fftResult);
