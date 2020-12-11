function [leader] = teamPowerHolder(emails)
%This function finds who the "leader" of the group is based on who asks a
%question starting with "do you want" in a series of emails first.

fh = fopen(emails, 'r'); 
%opens the file with read permission
line = fgetl(fh); 
%grabs the first line of the file
counter = 1;

while ischar(line) 
    line = fgetl(fh);
    if ischar(line) %the last line won't pass this conditional
        if ~isempty(strfind(line, 'do you want')) | ~isempty(strfind(line, 'Do you want'))
        %if the line contains "do you want" or "Do you want"
            break
        end
    end
    counter = counter + 1; %increases the counter by 1 every time the loop is run
end
fclose(fh);


num = counter;
keepgoing = true;
while keepgoing == true
    fh = fopen(emails, 'r');
    line = fgetl(fh);
    %this opened the emails and found the first line
    for i = 1:num
        line = fgetl(fh);
    end
    fclose(fh);
    %this for loop continued through the emails until it found the line containing the "do you want" statement
    if ~isempty(strfind(line, ':'))
        keepgoing = false;
        %the first line that contained a colon contained the name, so the
        %loop ended
    else
        keepgoing = true; %if the line didn't contain a colon it didn't contain a name.
        num = num-1; %this counted backward so that I was one line before the line the "do you want" statement was in
    end
    %this loop continued backward from the first "do you want" statement
    %until it found a colon (and thus found a name).
end

fh=fopen(emails);
line = fgetl(fh);
for i = 1:num
    line = fgetl(fh);
    [leader, rest] = strtok(line, ':');
end
%this loop found the line containing the leader's name and extracted the
%name
fclose(fh);
%closes the emails file
end