clear all;
clc;
clear figure;

%% 3-5 s��w nagrane 10 krotnie
filesCount = 9;
%fileNameBegin = 'data/ksiazka';
fileNameBegin = 'data/krzeslo';
for i = 1:filesCount
   % filename = strcat(fileNameBegin, num2str(i), '.wav');
    filename = strcat(fileNameBegin, '1', '.wav');
    %% Wspolczynniki po banku filtrow dla 1 pliku
    dtPart = 0.1;
    fftPoints = 128;
    filtersBankLength = 10;
    coeffs = getCoeffs(filename, dtPart);
    
 %   subplot(1,2,1), subimage(imagesc(coeffs))
    subplot(3,3,i)
   imagesc(coeffs);
end
%axis([0 7000 0 4]) 

%% Sprawdzic powtarzalno�� - utworzon� macierz przedstawi� np. graficznie, korelacja macierzy
