%% 3-5 s³ów nagrane 10 krotnie
%strcat('f', num2str(i));\
filename = 'data/ksiazka.wav';

%% Wspolczynniki po banku filtrow dla 1 pliku
coeffs = getCoeffs(filename, 0.1);

%% Wyci¹gn¹c wspó³czyniniki z poprzedniego punktu i utworzyæ macierz

%% Sprawdzic powtarzalnoœæ - utworzon¹ macierz przedstawiæ np. graficznie, korelacja macierzy
