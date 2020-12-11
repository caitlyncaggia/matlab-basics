function extrapCalc(x, y, colors, bounds)
%This function plotted three different extrapolation methods using
%different percentages of the original data set.

l = length(x); %finds how many x values there are
X1 = x(1:1:l/5); %first set of x was the first fifth
Y1 = y(1:1:l/5); %corresponding y's to the first set of x
X2 = x(1:1:(2*l/5)); %second set of x was the first two fifths
Y2 = y(1:1:(2*l/5)); %corresponding y's to the second set of x
X3 = x(1:1:(3*l/5)); %repeats this for the third set of x...
Y3 = y(1:1:(3*l/5));
X4 = x(1:1:(4*l/5)); %repeats this for the fourth set of x...
Y4 = y(1:1:(4*l/5));

subplot(3,1,1);%the linear extrapolations were on the first subplot
hold on; %makes sure plots dont overwrite each other
newY1 = interp1(X1, Y1, x, 'linear', 'extrap'); 
%linearly extrapolates the rest of the x values using the first set of x's
plot(x,newY1, colors(1)); %plots the first extrapolation with the corresponding color
newY2 = interp1(X2, Y2, x, 'linear', 'extrap'); 
%linearly extrapolates the rest of the x values using the second set of x's
plot(x,newY2, colors(2)); %plots the second extrapolation with the corresponding color
newY3 = interp1(X3, Y3, x, 'linear', 'extrap');
plot(x,newY3, colors(3)); %repeats this process for the third set of x
newY4 = interp1(X4, Y4, x, 'linear', 'extrap');
plot(x,newY4, colors(4)); %repeats this process for the fourth set of x
plot(x,y,colors(5)); %plots the complete sets of given x and y values
axis(bounds); %sets the axes
xlabel('x values'); %names the x-axis
ylabel('y values'); %names the y-axis
title('Interp1: Linear'); %names the subplot

subplot(3,1,2); %the cubic extrapolations were on the second subplot
l = length(x); %resets l
hold on; %makes sure plots dont overwrite each other
newY1 = interp1(X1, Y1, x, 'cubic', 'extrap');
%cubically extrapolates the rest of the x values using the first set of x's
plot(x,newY1, colors(1)); %plots the second extrapolation with the corresponding color
newY2 = interp1(X2, Y2, x, 'cubic', 'extrap'); %repeats this process for the second set of x
plot(x,newY2, colors(2));
newY3 = interp1(X3, Y3, x, 'cubic', 'extrap'); %repeats this process for the third set of x
plot(x,newY3, colors(3));
newY4 = interp1(X4, Y4, x, 'cubic', 'extrap'); %repeats this process for the fourth set of x
plot(x,newY4, colors(4));
plot(x,y,colors(5)); %plots the complete sets of given x and y values
axis(bounds); %sets the axes to the correct scale
xlabel('x values'); %labels the x-axis
ylabel('y values'); %labesl the y-axis
title('Interp1: Cubic'); %titles the subplot


subplot(3,1,3); %the spline extrapolations were on the third subplot
l = length(x); %resets l
hold on; %makes sure one plot doesn't overwrite the others
newY1 = spline(X1, Y1, x); 
%uses spline to extrapolate the remaining x values using the first set of x
plot(x, newY1, colors(1)); %plots this extrapolation with the corresponding color
newY2 = spline(X2, Y2, x); %repeats this process for the second set of x
plot(x, newY2, colors(2));
newY3 = spline(X3, Y3, x); %repeats this process for the third set of x
plot(x, newY3, colors(3));
newY4 = spline(X4, Y4, x); %repeats this process for the fourth set of x
plot(x, newY4, colors(4));
plot(x,y,colors(5)); %plots the complete sets of given x and y values
axis(bounds); %sets the axes to the correct scale
xlabel('x values'); %labels the x-axis
ylabel('y values'); %labesl the y-axis
title('Spline'); %titles the subplot

end