function [out1, out2] = ifOnlyIfOnly(in1, in2)
if isnumeric(in1) == true
% if the first input was double it would follow this code block...
    out1 = in1 ./ sum(sum(in2));
    %if the second input was an array, I'd need to take the sum twice.
    %Dividing the first input by this sum was the first output.
    out2 = in2 .* in1;
    %the second output was dot-multiplying the two inputs.
elseif islogical(in1) == true
%if the first input was logical it would follow this code block...
    out1 = ~in1;
    %the "~" flipped in1
    if isnumeric(in2) == true
        %if the second input was an even number (double class and had a mod
        % of 0 when divided by 2), the second output would be true (logical, not string).
        out2 = mod(in2, 2) == 0 ;
    else
        %if the second input was a even number (of the logical class with a
        %mod of 0 when divided by 2) the second output would be 'True' (as
        %a string, not a logical).
        if mod(in2, 2) == 0
            out2 = 'True';
        else
            %if the second input was an odd number (logical class with a
            %mod not equal to 0 when divided by 2) the second output would
            %be 'False' (as a string, not a logical).
            out2 = 'False';
        end
    end 
elseif ischar(in1) == true
%if the first input was a string, its class would be char. 
%       Char: If the first input is char class (in other words, if the
%       first input is a string), then the second input is always
%       guaranteed to be another string. You will need to find which string
%       is longer, and remove indices from it that go past the length of 
%       the shorter string.
    if length(in1) > length(in2)
        %if in1 was longer than in2, only the first (length(in2))
        %characters of in1 would be kept, the rest would be deleted.
        in1(length(in2)+1:end) = [];
        out2 = false;
        %since in1 was longer than in2, the strings were not the same
        %length, so out2 would be false.
    elseif length(in1) < length(in2)
        %this exact same process was used if in2 was longer than in1.
        in2(length(in1)+1:end) = [];
        %similarly, since the lengths were unequal, out2 was false.
        out2 = false;
    else 
        %otherwise, the strings were the same length, so neither needed to
        %be shortened, and out2 was true!
        in1 = in1;
        in2 = in2;
        out2 = true;
    end    
    out1 = [in1 ' ' in2];
    %finally, out1 was the concatenation of both strings (using a shortened
    %string if they weren't initially equal.)
end
end
