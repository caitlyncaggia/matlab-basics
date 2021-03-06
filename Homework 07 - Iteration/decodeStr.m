function [decoded] = decodeStr(message, num)
%This function took a given message and broke it down into another message
%according to a given number and the presence of spaces in the word. 
if isempty(strfind(message, ' ')) == false
    %if the message has spaces (aka, if strfind of message and a space
    %created a vector that wasn't empty)...I needed to take every nth word
    decoded = [];
    %I started with decoded as a blank vector
    rest = message;
    %since after the first time the loop was used "rest" would be the new
    %message, I just defined message as rest before the loop started
    while length(rest) > 0
        %the while loop would run until rest was 0 (there were no
        %characters left)
        for i = 1:num
            [word, rest] = strtok(rest);
        end
        %this for loop pulled out every nth word until it reached the end
        %of the message
        decoded = [decoded ' ' word];
        %which the while loop then concatenated each word generated by the
        %for loop with the previously generated words
    end
    
    if decoded(1) == ' '
        decoded(1) = [];
    elseif decoded(end) == ' '
        decoded(end) = [];
    end
    %this left a space at the beginning and end of the decoded message, so
    %I deleted the extra spaces
else
    %when the message does not contain spaces, remove every n'th char. I
    %just made a new vector of the message which only kept every nth
    %character until I hit the end of the message.
    decoded = message(num:num:end);    
end
end