function [area] = shoelace (vectorx, vectory)
newvy1 = vectory(2:end);
newvy2 = horzcat(newvy1, vectory(1));
sum1 = sum(vectorx .* newvy2);
%newvy1 pulled the first value off the front of vectory. newvy2 tacked that
%first value back on to the remaining values of vectory. sum1 adds the
%product of the original x-vector (vectorx) by the rearranged y-vector
%(newvy2, which has the first value of vectory moved to the end of the new
%vector with identical middle numbers).

newvx1 = vectorx(2:end);
newvx2 = horzcat(newvx1, vectorx(1));
sum2 = sum(vectory .* newvx2);
%newvx1 functions exactly as newvy1 did, except removes the first value of
%the original x-vector. newvx2 also mirrors newy2 as it adds the first
%value of the x-vector back on the end of the new vector. sum2 adds the
%product of the original y-vector by the rearranged x-vector(newvx2).

area = .5 * abs(sum1 - sum2);
%area was found using the formula given, where the area of the polygon is
%equal to half the positive difference of the sums (aka, the absolute value
%of the difference of the sums).

end