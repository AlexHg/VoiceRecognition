clear all;

dtPart = 0.02;
keyWordFormants = getFormantsMatrix('data/ksiazka.wav', dtPart);
wholeFormants = getFormantsMatrix('data/dwieKsiazkWzdaniuiKrzesloMK.wav', dtPart);

keyWordFormantsLength = length(keyWordFormants);
wholeFormantsLength =length(wholeFormants);
lengthDiff = wholeFormantsLength - keyWordFormantsLength;
comparerResults = [];

Istart = 1;
while(Istart <= lengthDiff)
Iend = Istart + keyWordFormantsLength-1;
comparerResults(Istart) = compareFormants(keyWordFormants, wholeFormants(:, Istart : Iend));
Istart = Istart + 1;
end

[minDiff, IminDiff] = min(comparerResults);
xAxis = (1:length(comparerResults))*dtPart;
plot(xAxis, comparerResults)