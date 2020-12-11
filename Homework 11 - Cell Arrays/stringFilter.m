function [filtered] = stringFilter(cell)
    filtered = ''; %makes filtered a blank string
    for i = 1:length(cell) %loop runs fo as many entries as there are in the cell
        if ischar(cell{i}) %if the contents are characters
            filtered = [filtered cell{i}]; %add them directly to the output
        elseif iscell(cell{i}) %if the contents is another cell
            inside = stringFilter(cell{i}); %use recursion to extract strings
            filtered = [filtered inside]; %add these strings to the output
        end
    end    
end