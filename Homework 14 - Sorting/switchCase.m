function out = switchCase(str, modify)

switch modify
    case 'Title Case'
        out = lower(str);
        out(1) = out(1) - 32;
        spaces = out==' ';
        firstletters = find(spaces==true)+1;
        out(firstletters) = out(firstletters) - 32;
    case 'Camel Case'
        out = lower(str);
        spaces = out==' ';
        firstletters = find(spaces==true)+1;
        out(firstletters) = out(firstletters) - 32;
        out(spaces) = [];
    case 'Da Vinci'
        out = str(end:-1:1);
    case '1337'
        lstr=lower(str);
        out = str;
        for i = 1:length(str)
            if lstr(i) == 'l'
                out(i) = '1';
            elseif lstr(i) == 'z'
                out(i) = '2';
            elseif lstr(i) == 'e'
                out(i) = '3';
            elseif lstr(i) == 'a'
                out(i) = '4';
            elseif lstr(i) == 's'
                out(i) = '5';
            elseif lstr(i) == 'g'
                out(i) = '6';
            elseif lstr(i) == 't'
                out(i) = '7';
            elseif lstr(i) == 'b'
                out(i) = '8';
            elseif lstr(i) == 'j'
                out(i) = '9';
            elseif lstr(i) == 'o'
                out(i) = '0';
            end
        end
end                

end