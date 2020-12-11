function [forMe] = birthdaycake(ncake, npeople)
remainder = mod(ncake, npeople);
forMe = (ncake-remainder)/npeople + remainder;
end

%To find the remainder (the number of uneaten cake pieces left), I used the
%mod function. Then to find out how many pieces of cake each person had, I
%subtracted the remainder from the total number of pieces of cake and
%divided that by the number of people. To find out how many pieces of cake
%I can eat, I added the number of slices of cake per person to the
%remainder.


% Inputs  (2): - (double) The total number of pieces of cake
%              - (double) The number of people at your party
%
% Outputs (1): - (double) How many pieces of cake you will get
%
% Function Description:
%   You are having a birthday party for yourself, and are trying to predict
%   how many pieces of cake you'll get to eat by yourself. Write a matlab
%   function to do this for you! There are two inputs: the total number of
%   pieces of cake, and the number of people at the party. You know that
%   the cake will need to be divided evenly between all guests at your
%   party, including yourself, and that you want everyone to eat the same
%   number of pieces. Because of this, there might be a few pieces of cake
%   left over that could not be fairly distributed. These few pieces left
%   over will be yours to eat after everyone has left, so you will get all
%   of them.
%
% Example:
%   If there are 20 pieces of cake and 6 people at your party: 18 pieces of
%   cake will be distributed among the 6 people so that each person gets 3
%   (including yourself). This will leave 2 pieces of cake remaining from
%   the original 20, and you will also get these 2 pieces. So your output
%   in this case should be 5.
%
% Notes:
%   - You may find the floor() and mod() functions useful.

