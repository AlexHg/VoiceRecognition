clear all
filename = 'data/ksiazkaSzklanka.wav';
dtPart = 0.1;
matchThreshold = 0.9;

matDir = 'mat/';
matFiles = {'ksiazki', 'krzesla'};

analyzedFileCoeaffs = getCoeffs(filename, dtPart);

totalFrames = length(analyzedFileCoeaffs);
% iterujemy po wszystkich ramkchach, szukajac 'trafienia'
for i=1:80 % totalFrames
    % wczyta? aktualnie analizowan? próbk?
    for z = 1 : length(matFiles)
        file = strcat('mat/',matFiles(1),'.mat');
        % z jakiegos powodu file jest typu cell, trzeba wyciagnac stringa
        file = file{1};
        %ladujemy zmienna coeffs
        load(file);
        for j= 1:length(coeffs)
          word = coeffs{j};
          wordLength = size(word,2);
          similarity = corelation(word, analyzedFileCoeaffs(:, i:i+ wordLength));
          
        end
    end
end

