function [tribute] = volunteer(names)        
    namesleft = names(2:end); %looks at the first letters of all but the first name
    firstlettersleft = []; %creates an empty vector
    for i = 1:length(namesleft) %loop runs for one less than number of names
        firstletter = namesleft{i}(1); %extracts first letters
        firstlettersleft = [firstlettersleft firstletter]; %adds first letters to list
    end
    if length(names) == 1 %if there is only one name left
        tribute = names{1}; %that's the tribute
    elseif names{1}(1) > firstlettersleft 
        %if the first letter of the first name is greater than all the
        %other first letters following it
        tribute = names{1}; %the first name is the tribute
    else
        names(1) = []; %deletes the first name of the list
        tribute = volunteer(names); %runs the function again recursively
    end              
end