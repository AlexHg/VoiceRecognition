clearvars

a = load('mat/ksiazkiMK.mat', 'coeffs');
%a = load('mat/fotele.mat', 'coeffs');
% b = load('mat/ksiazki.mat', 'coeffs');
b = load('mat/ksiazkiMK.mat', 'coeffs');

a= a.coeffs;
b = b.coeffs;
result = zeros(9);
for i = 1:9
    for j = 1:9
       result(i,j) = corelation(a{i},b{j}); 
    end
end

result