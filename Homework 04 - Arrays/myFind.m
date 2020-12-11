function [out] = myFind (in)
A = [1:numel(in)];
%the built-in function numel will tell me how many elements are in the
%input. A is a vector from 1 to however many elements were in the input.
out = A(in);
%The output is the indicies where the input was true, or where A(in) was true.
end
