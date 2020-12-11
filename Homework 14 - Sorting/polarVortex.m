function [bigdrop] = polarVortex(arr)

arr = arr';
temps = arr(arr>=0);
drops = abs(diff(temps));
[~, index] = max(drops);
bigdrop = [index index+1];

end