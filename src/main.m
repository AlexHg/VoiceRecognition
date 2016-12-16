% clear all;
clc;
clear figure;

%% 3-5 s³ów nagrane 9-krotnie
filesCount = 9;
fileNameBegin = 'data/ksiazkaAS/ksiazka';
% fileNameBegin = 'data/krzesloAS/krzeslo';
% fileNameBegin = 'data/fotelAS/fotel';
coeffs = cell(1,filesCount);
for i = 1:filesCount
    filename = strcat(fileNameBegin, num2str(i), '.wav');
    %% Wspolczynniki po banku filtrow dla 1 pliku
    dtPart = 0.1;
    fftPoints = 128;
    filtersBankLength = 10;
    coeffs{i} = getCoeffs(filename, dtPart);
    
 %   subplot(1,2,1), subimage(imagesc(coeffs))
    subplot(3,3,i)
    imagesc(coeffs{i});
end
%axis([0 7000 0 4]) 

%% Sprawdzic powtarzalnoœæ - utworzon¹ macierz przedstawiæ np. graficznie, korelacja macierzy
