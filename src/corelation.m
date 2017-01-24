% zwraca wspó?czynnik korelacji pomi?dzy macierzami o dowolnych rozmiarach
function [result] = corelation(a, b)

aSize = size(a);
bSize = size(b);

if(aSize(1) ~= bSize(1))
    if(aSize(1) > bSize(1))
        paddBy = [aSize(1)-bSize(1) 0];
        b = padarray(b,paddBy,'post');
    else
        paddBy = [bSize(1)-aSize(1) 0];
        a = padarray(a,paddBy,'post');
    end
end

if(aSize(2) ~= bSize(2))
    if(aSize(2) > bSize(2))
        paddBy = [0 aSize(2)-bSize(2)];
        b = padarray(b,paddBy,'post');
    else
        paddBy = [0 bSize(2)-aSize(2)];
        a = padarray(a,paddBy,'post');
    end
end
result = corrcoef(a,b);
result = result(1,2);