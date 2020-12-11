function board = hangman(word, letter)

board = '';
for i = 1:length(word)
    board = [board '_'];
end
lowerword = lower(word);
board(lowerword==letter) = word(lowerword==letter);

end