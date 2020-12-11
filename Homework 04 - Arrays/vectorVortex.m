function [vortexArray] = vectorVortex (n, m, vec)
V = zeros(n,m);
V(1,1:m-1) = vec(1:m-1);
%I started at the top left corner and went across the top row until I was
%in the second to last column. I replaced these values with the the first
%values of the vector, of whatever the number of columns was minus one.
vec(1:m-1) = [];
%To simplify things, I then deleted the values in the vector I used. This
%way, the next number I want to pick up would be the first index in my new
%vector.
V(1:n-1, end) = vec(1:n-1);
%I repeated a similar process to go down the first column, replacing each 0
%in the far right column (the end column) to the second-to-last row. 
vec(1:n-1) = [];
%I again deleted the values in my vector that I already added to the
%vortex.
V(n, m:-1:2) = vec(1:m-1);
%Then I wanted to work across the last row (n) and start from the farthest
%column on the right (m) and move to the left one at a time (-1) until I
%was back in the second column. I'd need (m-1) values from the vector, as
%I'd want to leave the last column on the left a 0 still.
vec(1:m-1) = [];
%I again deleted the values in my vector that I already added to the
%vortex.
V(n:-1:2,1) = vec(1:n-1);
%I then went from the bottom left corner(row n, column 1) to the second to
%the top row (row 2), going from bottom to top (-1). I wanted one less than
%the number of rows of the values in my vector.
vec(1:n-1) = [];
%I again deleted the values in my vector that I already added to the
%vortex.
%This creates the outer ring of numbers.

V(3,3:1:m-3) = vec(1:m-5);
%this starts the inner circle of the vector, which goes along the third
%row. It ends 3 spots away from the right side of the vector, hence m-3.
%The vector itself needs m-5 values, as it has to account for two coulumns
%on either side being zeros and two columns on either side being the outer 
%circle of numbers (hence -4), plus one more column being considered part 
%of the next step (-1).
vec(1:m-5) = [];
%I again deleted the values in my vector that I already added to the
%vortex.
V(3:n-3,m-2) = vec(1:n-5);
%I then went to make the right side of the inner circle. This goes down the
%m-2 column, and goes from the third row to the n-3 row (as the corner will
%belong to the next step). This needed n-5 values from the vector with the same idea as
%prior steps (there was one existing row of numbers and one row of zeros on
%either side, and minus an additional corner.)
vec(1:n-5) = [];
%I again deleted the values in my vector that I already added to the
%vortex.
V(n-2, m-2:-1:4) = vec(1:m-5);
%This was the bottom of the inner circle. I started in the 3rd from the
%right column (m-2) and went from right to left (-1) until I was at the
%fourth column (as the last step would cover the corner) all along the row
%that was third from the bottom (n-2). I used the same process as before so
%needed to consider that I had two rows of zeros and two sides of the outer
%matrix and exclude the corner, so I needed m-5 values from my vector.
vec(1:m-5) = [];
%I again deleted the values in my vector that I already added to the
%vortex.
V(n-2:-1:4, 3) = vec(1:end);
%This completed the last side of the inner circle, which went from the 3rd to
%last row (n-2) from bottom to top (-1) to the third row all along the
%third column. This used the remaining values of the vector (1:end).
vortexArray = V;
end


