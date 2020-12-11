function [resultVector] = evenOrOddlyLengthed (someVector)

a = mod(length(someVector), 2)
%a, the remainder after division, will be 0 if the length is even, 1 if the length is odd

b = a .* (-1) + 2
%b needs to be equal to 1 if the vector is odd or 2 if the vector is even.
%To do that, the a = 0 needs to be 2, so I can just add two. The a=1 needs
%to stay 1, which will work if I first multiply by -1 then add two.

resultVector = someVector(b:2:end)

end
