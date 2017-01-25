clear all
filename = 'data/ksiazkaSzklanka.wav';
% filename = 'data/ksiazkaMK/ksiazka_10_MK.wav';


dtPart = 0.1;
matchThreshold = 0.85;

matDir = 'mat/';
% matFiles = {'ksiazkiAS', 'krzeslaAS', 'foteleAS', 'ksiazkiMK', 'krzeslaMK', 'foteleMK', 'ksiazkiJP', 'krzeslaJP', 'foteleJP'};
matFiles = {'ksiazkiMK'};
analyzedFileCoeffs = getCoeffs(filename, dtPart);

totalFrames = length(analyzedFileCoeffs);
% iterujemy po wszystkich ramkach, szukajac 'trafienia'
match = false;
for i = 1 : totalFrames
    match = false;
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
              text = sprintf('Znaleziono slowo! Plik: %s, index: %f2', file, i * dtPart)
              match = true;
              break;
          end
        end
    end
end

