function [depth, index] = deepestCell(array)

depthlist = [];
for i = 1:length(array)
    contents = array{i};
    [~, depth] = lookInside(contents, 1);
    depthlist = [depthlist depth];
end
[value, index] = max(depthlist);
depth = value + 1;
    
end


function [out, depth] = lookInside(contents, counter)
    nextlayer = contents{1};
    if iscell(nextlayer)
        counter = counter+1;
        [out, depth] = lookInside(nextlayer, counter);
    else
        out = nextlayer;
        depth = counter;
    end
end