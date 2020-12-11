function uniqueFit(x, y)
%This function fits a curve of some degree to a set of coordinates from
%the first degree to the "unique" degree and shows each of these potential
%fits on a subplot.

stop = length(x) - 1; %make one less than the number of points
m = ceil(stop/2); %finds how many rows of graphs you'll have
n = 2; %2 columns of graphs
hold on; %doesn't write over other graphs
for i = 1:stop %loop runs for one less than number of points
    plotname = ['Order ' num2str(i) ' Fit']; %creates name of plot
    
    coeffs = polyfit(x,y,i); %finds coefficients for the i'th order
    smallx = min(x); %finds the minimum x value
    bigx = max(x); %finds the maximum x value
    newX = linspace(smallx,bigx); %new x values are 100 points between min and max
    newY = polyval(coeffs, newX); %new y values are evaluated by the i'th order function at new X values
    
    subplot(m,2,i); %finds the right subplot
    
    plot(x,y,'rx', newX, newY, 'k-'); %plots original points as red x's and new points as a black line
    axis square; %makes axes square
    title(plotname); %names plot
end

end