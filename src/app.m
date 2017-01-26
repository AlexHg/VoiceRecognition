clear all
clc
% filename = 'data/ksiazkaSzklanka.wav';
%  filename = 'data/zdaniaTestowe/ksiazka_x5_MK.wav';
% filename = 'data/ksiazkaMK/ksiazka_10_MK.wav';
filename = 'data/zdaniaTestowe/wszystko_JP2.wav';

dtPart = 0.05;
matchThreshold = 0.85;

matDir = 'mat/';
matFiles = {'ksiazkiAS', 'krzeslaAS', 'foteleAS', 'ksiazkiMK', 'krzeslaMK', 'foteleMK', 'ksiazkiJP', 'krzeslaJP', 'foteleJP'};
% matFiles = {'ksiazkiMK', 'ksiazkiAS', 'ksiazkiJP'};
analyzedFileCoeffs = getCoeffs(filename, dtPart);

totalFrames = length(analyzedFileCoeffs);
% iterujemy po wszystkich ramkach, szukajac 'trafienia'
match = false;
skipNextFramesCounter = 0;
for i = 1 : totalFrames
    match = false;
    if skipNextFramesCounter > 0
        skipNextFramesCounter = skipNextFramesCounter -1;
        continue;
    end
    % wczytac aktualnie analizowana próbke
    for z = 1 : length(matFiles)
        if (match == true)
            break; 
        end
        file = strcat('mat/',matFiles(z),'.mat');
        % z jakiegos powodu file jest typu cell, trzeba wyciagnac stringa
        file = file{1};
        %ladujemy zmienna coeffs
        load(file);

        coefLeng = length(coeffs);
        for j = 1:coefLeng
          word = coeffs{j};
          wordLength = size(word,2);
          if (i + wordLength > totalFrames)
              %text = sprintf('Nie znaleziono slowa w pliku: %s', file)
              break;
          end

          similarity = corelation(word, analyzedFileCoeffs( : , i:i+ wordLength));         
          if (similarity >= matchThreshold)
              sprintf('Znaleziono slowo! Plik: %s, czas: %f2, podobienstwo: %f2', file, i * dtPart,similarity)
              match = true;
              skipNextFramesCounter = wordLength;
              break;
          end
        end
    end
end

