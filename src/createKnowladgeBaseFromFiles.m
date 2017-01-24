% clear all;
clc;
clear figure;

%% 3-5 s?�w nagrane 9-krotnie
filesCount = 9;
fileNameBegin = 'data/krzesloMK/krzeslo';

coeffs = cell(1,filesCount);
for i = 1:filesCount
    filename = strcat(fileNameBegin, num2str(i), '.wav');
    %% Wspolczynniki po banku filtrow dla 1 pliku
    dtPart = 0.1;
    fftPoints = 128;
    filtersBankLength = 10;
    coeffs{i} = getCoeffs(filename, dtPart);    
%     subplot(3,3,i)
%     imagesc(coeffs{i});
%     colormap
end
%axis([0 7000 0 4]) 

% obliczone wspolczynniki zpaisujemy do pliku
save('mat/krzeslaMK.mat', 'coeffs')

%% Sprawdzic powtarzalnosc - utworzona macierz przedstawic np. graficznie, korelacja macierzy
