function [newHeight] = erosion (topsoilHeight, bedrockHeight, erosionFactor)
topsoilLost = topsoilHeight - erosionFactor;
%The amount of soil lost depends on the difference between the original
%height and erosion factor, which were given.
mask = topsoilLost <= bedrockHeight;
topsoilLost(mask) = bedrockHeight(mask);
%when topsoil lost is less then bedrock height, the height will still be no
%lower than the bedrock. The mask identifies cases that would reduce
%topsoil to a level below the bedrock and replaces them with the height of
%the bedrock.
newHeight = topsoilLost;
end