function [results, winHits, winDestroy] = battleTanks(player1, player2, moves)
%This function simulates a version of battleship called battletanks using a
%list of moves and the initial positions of each player's tanks to
%determine the winner and final board scores.

% load('battleTanks.mat')

%split the move vector into player 1's moves and player 2's moves:
rest = moves;
player1moves = [];
player2moves = [];
while length(rest) >= 5
    addp1move = rest(1:2);
    addp2move = rest(4:5);
    if length(rest) >= 6
        rest(1:6) = [];
    elseif length(rest) <= 5
        rest(1:end) = [];
    end
    player1moves = [player1moves addp1move];
    player2moves = [player2moves addp2move];
end
if length(rest) >= 2
    if rest(1) == ' '
        rest(1) = [];
    end
    player1moves = [player1moves rest];  
end


%convert moves for each player into array positions and change hits to 0:
hitp1 = 0; %number of times p1 hits one of p2's tanks
hitp2 = 0; %number of times p2 hits one of p1's tanks
num = 1; %starts the counter
hitlistp1 = []; %list of successful hits for p1 starts empty
hitlistp2 = []; %list of successful hits for p2 starts empty
player1win = false;
player2win = false;

while player2moves > 0
    for i = 1:num
        if length(player1moves) > 0 
            colp1 = double(player1moves(1)) - 64; %the column was a capital letter, which was converted into an ascii 
            %value and then subtracted 64 to find its postiion in the alphabet
            rowp1 = str2num(player1moves(2)); %the row was just the second character converted from a char to a number
            player1moves(1:2) = []; %deletes the move I just used from the list of moves
            if player2(rowp1, colp1) > 0 & player1win == false & player2win == false
                hitp1 = hitp1 + 1; %this counts as a hit so total num hits increases by 1
                hitlistp1 = [hitlistp1 player2(rowp1, colp1)]; %adds this hit to the hit list
                player2(rowp1, colp1) = 0; %changes this tank position value to 0
            elseif player1win == false & player2win == false
                hitp1 = hitp1 + 0;
            else
                break
            end
        else
            hitlistp1 = hitlistp1;
        end

    %I used this same process to determine if player 2's move was a hit.
        if length(player2moves) > 0
            colp2 = double(player2moves(1)) - 64;
            rowp2 = str2num(player2moves(2));
            player2moves(1:2) = [];
            if player1(rowp2, colp2) > 0 & player1win == false & player2win == false
                hitp2 = hitp2 + 1;
                hitlistp2 = [hitlistp2 player1(rowp2, colp2)];
                player1(rowp2, colp2) = 0;
            elseif player1win == false & player2win == false
                hitp2 = hitp2 + 0;
            else
                break
            end
        else 
            hitlistp2 = hitlistp2;
        end
    end
end

%to account if player 1 has more moves than player 2
if length(player1moves) > 0 
    colp1 = double(player1moves(1)) - 64;
    rowp1 = str2num(player1moves(2)); 
    player1moves(1:2) = []; 
    if player2(rowp1, colp1) > 0 & player1win == false & player2win == false
        hitp1 = hitp1 + 1; 
        hitlistp1 = [hitlistp1 player2(rowp1, colp1)]; 
        player2(rowp1, colp1) = 0; 
    elseif player1win == false & player2win == false
        hitp1 = hitp1 + 0;
    end
end
    
    

%determine who wins after all moves are played
if hitp1 > hitp2
    player1win = true;
elseif hitp1 < hitp2
    player2win = true;
elseif hitp1 == hitp2
    tie = true;
end

%arrange final outputs based on who wins
if player1win == true
    results = player1;
    winHits = hitlistp1;
    winDestroy = destroy(hitlistp1);   
elseif player2win == true
    results = player2;
    winHits = hitlistp2;
    winDestroy = destroy(hitlistp2);
elseif tie == true
    results = player1;
    winHits = player2;
    winDestroy = 'Cease fire!';
end
end

function [destroyed] = destroy(hitlist)
destroyed = [];
num = 1;
for i = 1:length(hitlist)
    counter = hitlist(1:num);
    countones = sum(counter==1);
    counttwos = sum(counter==2);
    countthrees = sum(counter==3);
    countfours = sum(counter==4);
    if countones == 2 & all(destroyed ~= 1) == true
        destroyed = [destroyed 1];
    end
    if counttwos == 3 & all(destroyed ~= 2) == true
        destroyed = [destroyed 2];
    end
    if countthrees == 4 & all(destroyed ~= 3) == true
        destroyed = [destroyed 3];
    end
    if countfours == 6 & all(destroyed ~= 4) == true
        destroyed = [destroyed 4];
    end
    num = num+1;
end
winDestroy = destroyed;
end
