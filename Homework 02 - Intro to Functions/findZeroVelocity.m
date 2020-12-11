function [posRoot, negRoot] = findZeroVelocity(A, B, C, D)
newA = A*3;
newB = B*2;
newC = C;
posRoot = (-newB + sqrt(newB^2 - (4*newA*newC)))/(2*newA);
negRoot = (-newB - sqrt(newB^2 - (4*newA*newC)))/(2*newA);
end

%The "new" variables (newA, newB, newC) represent the coefficients of the function's first
%derivative found using the power rule explained in the instructions. When the solutions to this 
%function are found (using the same process as the quad function), I know 
%the points where velocity is zero.


% Inputs  (4): - (double) The first coefficient of a cubic polynomial, A.
%              - (double) The corresponding 2nd coefficient, B.
%              - (double) The corresponding 3rd coefficient, C.
%              - (double) The corresponding 4th coefficient, D.
%
% Outputs (2): - (double) The "positive root" for when velocity is 0.
%              - (double) the "negative root" for when velocity is 0.
%
%
% Function Description:
%   Imagine that you are an engineer finishing your degree at Georgia Tech,
%   and for your capstone-design course you need to find when the velocity
%   of certain component in your design is equal to 0. Using experimental
%   and curve fitting techniques that you will actually learn in later
%   classes, you have found that this component's position function with
%   respect to time is simply a cubic polynomial. For example, the position
%   function with respect to time might be something like this:
%
%           f(t) = 3t^3 + 4t^2 + 2t + 3.
%
%   If it was, then the "coefficients" of this polynomial would be 3, 4, 2,
%   and 3 (in that order). From calculus it is known that Velocity is the
%   derivative of Position. The derivative of a cubic polynomial with
%   coefficients of A, B, C, and D is shown below:
%
%           cubic function: f(t) = At^3 + Bt^2 + Ct + D
%
%           its derivative: f'(t) = (3*A)t^2 + (2*B)t + C
%
%   Using this knowledge, write a function that takes in the coefficients
%   A, B, C, and D of a cubic function for Position, and outputs the
%   "positive root" and "negative root" for when Velocity is zero.
%
% Notes:
%   - You do not need to, but you may use your prevously written function,
%     quad.m, or the included function quad_soln.p to code this problem.
%   - The inputs/outputs of your function must match those described above;
%     if yours do not, your will receive a zero for this problem.