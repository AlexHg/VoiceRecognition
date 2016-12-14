function [melcenters, filtersBankLength] = melScale()
melHzScaleBands = [160; 394; 670; 1000; 1420; 1900; 2450; 3120; 4000; 5100; 6600];

melcenters = [];
melcenters(1) = 0;
scaleLeng = length(melHzScaleBands);
for i = 1 : scaleLeng-1
    diff = (melHzScaleBands(i+1) - melHzScaleBands(i))/2;
    melcenters(i+1) = melHzScaleBands(i) + diff;
end

diff32 = melcenters(3) - melcenters(2);
melcenters(1) = melcenters(2) - diff32;
diffEnd = melcenters(scaleLeng) - melcenters(scaleLeng-1);
melcenters(scaleLeng + 1) = melcenters(scaleLeng) + diffEnd;

filtersBankLength = length(melcenters)-2;