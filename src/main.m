%% 3-5 s��w nagrane 10 krotnie
%strcat('f', num2str(i));\
filename = 'data/ksiazka.wav';

%% Wspolczynniki po banku filtrow dla 1 pliku
coeffs = getCoeffs(filename, 0.1);

%% Wyci�gn�c wsp�czyniniki z poprzedniego punktu i utworzy� macierz

%% Sprawdzic powtarzalno�� - utworzon� macierz przedstawi� np. graficznie, korelacja macierzy
