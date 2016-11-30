function [sumOfSquares] = compareFormants(matrixA, matrixB)

%matrixSize = size(matrixA);
%squares = zeros(matrixSize);

diff = matrixA - matrixB;
squares = diff.*diff;
sumOfSquares = sum(sum(squares));
% for i = 0 : matrixSize(2)
%     for j = 0 : matrixSize(1)
%         diff = matrixA(i,j) - matrixB(i,j);
%         squares(i,j) = diff*diff;
%         sumOfSquares = sumOfSquares + diff*diff;
%     end
% end

