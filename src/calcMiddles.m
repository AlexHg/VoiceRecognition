function [outMiddleIndexes, filtersBankLength] = calcMiddles(samplesFreq)

[melFreqMiddles, filtersBankLength] = melScale();
outMiddleIndexes = [];

for i = 1 : length(melFreqMiddles)
    for j = 1 : length(samplesFreq)
        res = samplesFreq(j) - melFreqMiddles(i);
        if (res > 0)
            outMiddleIndexes(i) = j;
            break;
        end
    end
end