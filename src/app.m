clear all
filename = 'data/ksiazkaSzklanka.wav';
dtPart = 0.01;
matchThreshold = 0.65;

matDir = 'mat/';
matFiles = {'ksiazkiAS', 'krzeslaAS', 'foteleAS', 'ksiazkiMK', 'krzeslaMK', 'foteleMK', 'ksiazkiJP', 'krzeslaJP', 'foteleJP'};

analyzedFileCoeffs = getCoeffs(filename, dtPart);

totalFrames = length(analyzedFileCoeffs);
% iterujemy po wszystkich ramkach, szukajac 'trafienia'
for i=1:80 % totalFrames
    % wczytac aktualnie analizowana próbke
    for z = 1 : length(matFiles)
        file = strcat('mat/',matFiles(z),'.mat');
        % z jakiegos powodu file jest typu cell, trzeba wyciagnac stringa
        file = file{1};
        %ladujemy zmienna coeffs
        load(file);
        
        coefLeng = length(coeffs);
        for j = 1:coefLeng
          word = coeffs{j};
          wordLength = size(word,2);
          if (j+wordLength-1 > totalFrames)
              %text = sprintf('Nie znaleziono slowa w pliku: %s', file)
              break;
          end
          
          similarity = corelation(word, analyzedFileCoeffs(:, i:i+ wordLength));         
          if (similarity >= matchThreshold)
              text = sprintf('Znaleziono slowo! Plik: %s, index: %d', file, j)
              break;
          end
        end
    end
end

