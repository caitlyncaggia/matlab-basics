function [boards, missed, outcome] = playHangman(word, letters)

boards = [];
missed = [];
lives = 6;
win = false;

board = [];
for i = 1:length(word)
    board = [board '_'];
end

lword = lower(word)
for num = 1:length(letters)
    board(lword==letters(num)) = word(lword==letters(num));
    boards = [boards;board];
    if sum(lword==letters(num)) == 0
        lives = lives - 1;
        missed = [missed letters(num)];
        if lives == 0
            break
        end
    elseif sum(board=='_') == 0
        win = true;
        break
    end
end

if win == true
    outcome = 'You win!';
elseif lives == 1
    outcome = 'You have 1 life left.';
elseif lives > 1
    outcome = ['You have ' num2str(lives) ' lives left.'];
else
    outcome = 'You lose!';
end

end