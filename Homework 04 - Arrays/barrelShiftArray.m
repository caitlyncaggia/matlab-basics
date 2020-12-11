function [shiftedArray] = barrelShiftArray (array, nshifts)
a = size(array);
rows = a(1);
columns = a(2);

b = abs(nshifts) + 1;

vec = [array(1:1:end)]
c = length(vec)
if nshifts <= c
    shiftedvec = [vec(b:end) vec(1:nshifts)]
else
    d = nshifts-c
    shiftedvec = [vec(d:end) vec(a:d-1)]
end

columnvec = shiftedvec(:)
shiftedArray = reshape(columnvec, [rows, columns])


end