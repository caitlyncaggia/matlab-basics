function [output] = encoded(vector, number)

%any(vector) == number;
%case one needed any value of the vector to be equal to the given number,
%so I used the built-in funciton any and double equals.

%mod((vector(end)-vector(1)), number) == 0;
%if every number in the vector is a specific consistent distance from the
%next, the difference of the last term and first term should be evenly
%divisible by the step size, so modulus would be zero.

%sum(vector) == number;
%for case 3, the sum of all the elements of the vector needed to be equal
%to the given number, so I used the built-in function sum and double equals.

%all(mod(vector, number)) == 0;
%I used mod to find if there was a remainder after division of each term in
%the vector. If the mod for every term (built-in function all) was equal to
%zero, then every term in the vector was evenly divisible by the given
%number.

output = [any(vector) == number mod((vector(end)-vector(1)), number) == 0 sum(vector) == number all(mod(vector, number)) == 0];

end
