function [candidates, time] = CFRecruiter(names, GPA, talk)
%This function determined the length of time and names of candidates a
%recruiter spoke to considering their GPA and whether they stayed to talk
%at the career fair.
candidates = [];
rest = names;
time = 0;
num = 1;
%I started off by building an empty vector of candidates, setting time as 0
%and num as 1 and renaming string as rest (like in decodeStr, after the 
%first time the loop was used "rest" would be the new message, I just 
%defined message as rest before the loop started.

numcommas = sum(strfind(names, ','));
numnames = numcommas+1;
%the number of names was one greater than the number of commas (as all
%names were followed by a comma except the last name).

%my loop ran as many times as there were names.
for i = 1:numnames
    %I used "num" as I wanted to look at a specific index of each input
    [name, rest] = strtok(rest, ',');
    %I used strtok to pull out the first name in the string, using
    %commas as a delimiter
    if name(1) == ' '
        name(1) = [];
    elseif name(end) == ' '
        name(end) = [];
    end
    %This if statement above removed spaces left over at the start or end of
    %names due to its position in the inputted name vector and the fact that
    %I used commas a delimiter instead of spaces.
    if GPA(num) > 2.5 & talk(num) == true
        %If the nth candidate had a GPA greater than 2.5 and stayed to
        %talk...
        candidates = [candidates ', ' name];
        %then this name was added to the list of candidates...
        time = time + ((GPA(num) - 2.5) * 4);
        %and time would increase according to the value of their GPA
        %(using the given formula).
    end

    if length(rest) < 1
        break
    end
    num = num + 1;
    %Then I increased num by 1 so the loop would continue.
end

if candidates(1) == ','
    candidates(1:2) = [];
end
%due to the way I concatenated the list of candidates, I needed to remove
%the initial ', ' at the start of the list. However if the first name in
%the list was the only candidate, no ', ' was added. this if statement
%removed any extraneous characters before the first name.
end