function [mix] = interweave(vec1, vec2)

if length(vec1) >= length(vec2)
    mixlength = 2 * length(vec1);
elseif length(vec1) < length(vec2)
    mixlength = 2 * length(vec2);
end

mix = zeros(1, mixlength);
l1 = 2 * length(vec1);
l2 = 2 * length(vec2);
mix(1:2:l1) = vec1;
mix(2:2:l2) = vec2;
end