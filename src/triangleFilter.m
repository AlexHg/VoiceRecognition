clear all
clc

series_length = 128;
triangles_count = 10;

triangle_length = series_length / triangles_count;

srodki_czestotliwosci = linspace(1, series_length, triangles_count + 2);
%srodki_czestotliwosci = round(srodki_czestotliwosci(2:triangles_count+1))
[word, Fs] = audioread('data/ksiazka.wav');
for i = 1:triangles_count
   filter = singleFilter(srodki_czestotliwosci(i),srodki_czestotliwosci(i+1),srodki_czestotliwosci(i+2), series_length); 
   plot(filter, 'color',rand(1,3));
   hold on
end
%% get filter



