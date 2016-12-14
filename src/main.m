clear all;
clc;
clear figure;

%% 3-5 s��w nagrane 10 krotnie
filesCount = 1;
%fileNameBegin = 'data/ksiazka';
fileNameBegin = 'data/krzeslo';
for i = 1:filesCount
    filename = strcat(fileNameBegin, num2str(i), '.wav');
    
    %% Wspolczynniki po banku filtrow dla 1 pliku
    dtPart = 0.1;
    fftPoints = 128;
    filtersBankLength = 10;
    coeffs = getCoeffs(filename, dtPart);
    imagesc(coeffs);
end

%% Sprawdzic powtarzalno�� - utworzon� macierz przedstawi� np. graficznie, korelacja macierzy
