function [possoutcomes] = ticTacToeTurn(board, turn)
%This function predicts the possible outcomes of a tic-tac-toe game given
%the current board and the next move.
str = [board{1:end}]; %converts the board into a string of characters
empty = strfind(str, ' '); %finds where the string contains a space, or where the board is empty
num = 1; %counter starts at 1
arrays = {}; %creates empty cell arrays...
outcomes = {};
possoutcomes = {};
for i = 1:length(empty) %loop runs for as many empty spaces there are
    str(empty(num)) = turn; %replaces the first empty index with the next turn
    grid = {str(1), str(4), str(7); str(2), str(5), str(8); str(3), str(6), str(9)}; 
    %creates a cell array including next possible turn
    array = cell2mat(grid); %converts the cell array to a char array
    outcome = moveEvaluator(array, turn); %helper funciton finds outcome of this move
    possibility = {grid; outcome}; %pairs the board and outcome of that possible move
    possoutcomes = [possoutcomes possibility]; %keeps track of possible moves and outcomes
    str(empty(num)) = ' '; %changes the location of the possible move back to blank
    num = num+1; %increases counter by 1
end
end