function [dominant, recessive, wings] = personalityTest (type, all, subtype)

firstLetter = type(1);
%the first letter of the inputted type would indicate if the inputted type
%was dominant (capital) or recessive(lowercase).
if firstLetter < 'z' & firstLetter > 'a' 
    %if the first letter was lowercase, it represented the recessive trait.
    type(1) = type(1) - 32;
    recessive = type;
    %I then capitalized the first letter of the recessive trait and defined
    % type as the ouput for recessive.
    %then I matched each recessive trait with its apppropriate dominant
    %trait using strcmp...
    if strcmp(recessive, 'Investigator') == true
        dominant = 'Reformer';
    elseif strcmp(recessive, 'Loyalist') == true
        dominant = 'Helper';
    elseif strcmp(recessive, 'Enthusiast') == true
        dominant = 'Achiever';
    elseif strcmp(recessive, 'Challenger') == true
        dominant = 'Individualist';
    elseif strcmp(recessive, 'Peacemaker') == true
        dominant = 'Dreamer';
    elseif strcmp(recessive, 'Reformer') == true
        dominant = 'Investigator';
    elseif strcmp(recessive, 'Helper') == true
        dominant = 'Loyalist';
    elseif strcmp(recessive, 'Achiever') == true
        dominant = 'Enthusiast';
    elseif strcmp(recessive, 'Individualist') == true
        dominant = 'Challenger';
    elseif strcmp(recessive, 'Dreamer') == true
        dominant = 'Peacemaker';
    end
elseif firstLetter < 'Z' & firstLetter > 'A'
    %if the first letter was capital, I defined the dominant output as
    %type.
    dominant = type;    
end
%after the code was run to this point, regardless of the input, I would
%know what my dominant trait was. I can use this to find out the other
%outputs.

if strcmp(dominant,'Reformer') == true
    %If my dominant trait was reformer,
    recessive = 'Investigator';
    %my recessive trait was investigator.
    rightWing = 'Peacemaker';
    %the trait counterclockwise to reformer was peacemaker, so right wing
    %was peacemaker.
    leftWing = 'Helper';
    %the trait clockwise to reformer was helper, so left wing was helper.
    %I repeated this process for each of the traits.
elseif strcmp(dominant, 'Helper') == true
    recessive = 'Loyalist';
    rightWing = 'Reformer';
    leftWing = 'Achiever';
elseif strcmp(dominant, 'Achiever') == true
    recessive = 'Enthusiast';
    rightWing = 'Helper';
    leftWing = 'Individualist';
elseif strcmp(dominant, 'Individualist') == true
    recessive = 'Challenger';
    rightWing = 'Achiever';
    leftWing = 'Dreamer';
elseif strcmp(dominant, 'Dreamer') == true
    recessive = 'Peacemaker';
    rightWing = 'Individualist';
    leftWing = 'Investigator';
elseif strcmp(dominant, 'Investigator') == true
    recessive = 'Reformer';
    rightWing = 'Dreamer';
    leftWing = 'Loyalist';
elseif strcmp(dominant, 'Loyalist') == true
    recessive = 'Helper';
    rightWing = 'Investigator';
    leftWing = 'Enthusiast';
elseif strcmp(dominant, 'Enthusiast') == true
    recessive = 'Achiever';
    rightWing = 'Loyalist';
    leftWing = 'Challenger';
elseif strcmp(dominant, 'Challenger') == true
    recessive = 'Individualist';
    rightWing = 'Enthusiast';
    leftWing = 'Peacemaker';
elseif strcmp(dominant, 'Peacemaker') == true
    recessive = 'Dreamer';
    rightWing = 'Challenger';
    leftWing = 'Reformer';
end

%then I concatenated the right wing and left wing to make the wings output.
wings = [leftWing ' ' rightWing];

%to add the subtype tag to my dominant trait, I used strcmp to find what my
%subtype was.
if strcmp(subtype, 'alone') == true
    %if subtype was alone, I concatenated my dominant trait with "_a"
    dominant = [dominant '_a'];
elseif strcmp(subtype, 'smallGroup') == true
    %if subtype was smallGroup, I concatenated my dominant trait with "_s"
    dominant = [dominant '_s'];
elseif strcmp(subtype, 'largeGroup') == true
    %if subtype was largeGroup, I concatenated my dominant trait with "_l"
    dominant = [dominant '_l'];
end

end