function [extreme] = estimateExtremum(x,y)
%This function estimates local minimums and maximums of a given function.

deriv = diff(y)./diff(x); %finds the derivative of the function

midpoints = []; %starts midpoints as an empty vector
for i = 1:length(x)-1 %runs for one less than the number of points
    midpt = (x(i)+x(i+1))/2; %finds one midpoint
    midpoints = [midpoints midpt]; %adds this midpoint to the vector
end

newX = interp1(deriv,midpoints,0); %finds the x value where the derivative is 0
newY = interp1(x,y,newX); %finds the appropriate y for this x

extreme = [newX newY]; %formats the output

end