function compareExtrap(x,y,D)

hold on;
minx = min(x);
maxx= max(x);
lowerbound = minx - D;
upperbound = maxx + D;
newx = linspace(lowerbound, upperbound, 100);
newy1 = interp1(x, y, newx, 'linear', 'extrap');
newy2 = spline(x, y, newx);
coeffs = polyfit(x, y, 3);
newy3 = polyval(coeffs, newx);
plot(x, y, 'b*', newx, newy1, 'g', newx, newy2, 'r', newx, newy3, 'k');

end