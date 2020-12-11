function [winner] = rockPaperScissors(player1, player2)
[r1p1, rest] = strtok(player1, ',');
[r2p1, r3p1] = strtok(rest, ',');
r3p1(1) = [];
%I used strtok to break the given strings into individual moves. So r1p1
%was player 1's first move, r2p1 was player 1's second move, and r3p1 (with
%the comma at the beginning deleted) was player 1's third move.

[r1p2, rest] = strtok(player2, ',');
[r2p2, r3p2] = strtok(rest, ',');
r3p2(1) = [];
%I used strtok again in the same way to separate player 2's moves.


if strcmp(r1p1,'Rock') == true & strcmp(r1p2, 'Scissors')==true | ...
        strcmp(r1p1,'Paper')==true & strcmp(r1p2,'Rock')==true | ...
        strcmp(r1p1,'Scissors')==true & strcmp(r1p2,'Paper')==true 
    %these were the situations in which player 1 would win the first round.
    %Thus, player 1's score would increase after the first round, but
    %player 2's score would stay the same.
    scorer1p1 = 1;
    scorer1p2 = 0;
elseif strcmp(r1p2,'Rock') == true & strcmp(r1p1, 'Scissors')==true | ...
        strcmp(r1p2,'Paper')==true & strcmp(r1p1,'Rock')==true | ...
        strcmp(r1p2,'Scissors')==true & strcmp(r1p1,'Paper')==true 
    %these were situations in which player 2 would win the first round.
    %Thus, player 2's score would increase after the first round, but
    %player 1's score would stay the same.
    scorer1p1 = 0;
    scorer1p2 = 1;
elseif strcmp(r1p1,'Rock')==true & strcmp(r1p2,'Rock')==true | ...
        strcmp(r1p1,'Paper')==true & strcmp(r1p2,'Paper')==true | ...
        strcmp(r1p1,'Scissors')==true & strcmp(r1p2,'Scissors')==true
    %these were the situations in which neither player would win the first
    %round. Neither players score would increase.
    scorer1p1 = 0;
    scorer1p2 = 0;
end

if strcmp(r2p1,'Rock') == true & strcmp(r2p2, 'Scissors')==true | ...
        strcmp(r2p1,'Paper')==true & strcmp(r2p2,'Rock')==true | ...
        strcmp(r2p1,'Scissors')==true & strcmp(r2p2,'Paper')==true 
    %these were situations where player 1 would win round 2...
    scorer2p1 = 1;
    scorer2p2 = 0;
elseif  strcmp(r2p2,'Rock') == true & strcmp(r2p1, 'Scissors')==true | ...
        strcmp(r2p2,'Paper')==true & strcmp(r2p1,'Rock')==true | ...
        strcmp(r2p2,'Scissors')==true & strcmp(r2p1,'Paper')==true 
    %and where player 2 would win round 2...
    scorer2p1 = 0;
    scorer2p2 = 1;
else
    %or where neither player would win round 2...
    scorer2p1 = 0;
    scorer2p2 = 0;
    
end

if strcmp(r3p1,'Rock') == true & strcmp(r3p2, 'Scissors')==true | ...
        strcmp(r3p1,'Paper')==true & strcmp(r3p2,'Rock')==true | ...
        strcmp(r3p1,'Scissors')==true & strcmp(r3p2,'Paper')==true 
    %these were situations where player 1 would win round 3...
    scorer3p1 = 1;
    scorer3p2 = 0;
elseif  strcmp(r3p2,'Rock') == true & strcmp(r3p1, 'Scissors')==true | ...
        strcmp(r3p2,'Paper')==true & strcmp(r3p1,'Rock')==true | ...
        strcmp(r3p2,'Scissors')==true & strcmp(r3p1,'Paper')==true 
    %or where player 2 would win round 3...
    scorer3p1 = 0;
    scorer3p2 = 1;
else
    %or where neither player would win round 3.
    scorer3p1 = 0;
    scorer3p2 = 0;
end    
    
%I totaled the scores for each player after all 3 rounds.
scorep1 = scorer1p1 + scorer2p1 + scorer3p1;
scorep2 = scorer1p2 + scorer2p2 + scorer3p2;

%To win, one player had to have at least 2 points.
if scorep1 >=2
    winner = 'Player 1 wins!';
    %if player 1 had at least 2 points, player 1 won.
elseif scorep2 >=2
    winner = 'Player 2 wins!';
    %if player 2 had at least 2 points, player 2 won.
else
    %if both players earned less than 2 points, they kept playing.
    winner = 'Keep Playing!';
end


end