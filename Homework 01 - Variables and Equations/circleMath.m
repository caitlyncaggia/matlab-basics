function [area, perim] = circleMath(diam)
% Inputs (1):  - (double) The diameter of a circle
%
% Outputs (2): - (double) The area of the circle
%              - (double) The perimeter of the circle
%
% Function Description:
%   Write a function, circleMath, that takes in the diameter of a circle
%   and outputs the area and the perimeter.
r = diam ./ 2;
area = pi .* (r^2);
perim = pi .* diam;
%Since the diameter is the given value, I can find the perimiter by simply
%multiplying the diameter by pi. I can define the radius as half of
%diameter, then use the radius to find the area of the circle as it's equal
%to pi times the radius squared.
end

