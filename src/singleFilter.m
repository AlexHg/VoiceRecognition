function [filter] = singleFilter(x1, x_center, x2, series_length)

x = zeros(1,series_length);
x1 = round(x1);
x2 = round(x2);
x_center = round(x_center);

filter = x;
left_side_length = round(x_center - x1 + 1);
filter(x1:x_center) = linspace(0,1,left_side_length);

right_side_length = round(x2 - x_center + 1);
filter(x_center:x2) = fliplr(linspace(0,1,right_side_length));

