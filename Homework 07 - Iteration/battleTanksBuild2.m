function [results, winHits, winDestroy] = battleTanksBuild(player1, player2, moves)
%This function simulates a version of battleship called battletanks using a
%list of moves and the initial positions of each player's tanks to
%determine the winner and final board scores.

load('battleTanks.mat');

%split the move vector into player 1's moves and player 2's moves:
rest = moves;
player1moves = [];
player2moves = [];
while length(rest) >=5
    addp1move = rest(1:2);
    addp2move = rest(4:5);
    rest(1:6) = [];
    player1moves = [player1moves ' ' addp1move];
    player2moves = [player2moves ' ' addp2move];
end
if length(rest) >= 2
    player1moves = [player1moves rest];  
end

%convert moves for each player into array positions and change hits to 0:
num = 1;
hitlistp1 = [];
hitlistp2 = [];
while ~isempty(player2moves)
    for i = 1:num
        colp1 = double(player1moves(1)) - 64;
        rowp1 = str2num(player1moves(2));
        if player2(rowp1, colp1) ~= 0
            hitlistp1 = [hitlistp1 player2(rowp1, colp1)];
            player2(rowp1, colp1) = 0;
        end
        colp2 = double(player2moves(1)) - 64;
        rowp2 = str2num(player1moves(2));
        if player1(rowp2, colp2) ~= 0
            hitlistp2 = [hitlistp2 player1(rowp1, colp1)];
            player1(rowp2, colp2) = 0;
        end            
    end
end
end