function madLibs(file, list)
out = [file(1:end-4) '_fixed.txt'];
fh = fopen(out, 'w');
fclose(fh);

flist = fopen(list, 'r');
nounline = fgetl(flist);
    nounlist = strsplit(nounline, ',');
verbline = fgetl(flist);
    verblist = strsplit(verbline, ',');
adjline = fgetl(flist);
    adjlist = strsplit(adjline, ',');
fclose(flist);

fh = fopen(file, 'r');
fhn = fopen(out, 'a');

readline = fgets(fh);
while ischar(readline)
    countnouns = length(strfind(readline, '%n'));
    countverbs = length(strfind(readline, '%v'));
    countadjs = length(strfind(readline, '%a'));
    newline = readline;
    if countnouns > 0
        for i = 1:countnouns
            findnouns = strfind(newline, '%n');
            newline = [newline(1:findnouns(1)-1) nounlist{1} newline(findnouns(1)+2:end)];
            nounlist(1) = [];
        end
    end
    if countverbs > 0
        for i = 1:countverbs
            findverbs = strfind(newline, '%v');
            newline = [newline(1:findverbs(1)-1) verblist{1} newline(findverbs(1)+2:end)];
            verblist(1) = [];
        end
    end
    if countadjs > 0
        for i = 1:countadjs
            findadjs = strfind(newline, '%a');
            newline = [newline(1:findadjs(1)-1) adjlist{1} newline(findadjs(1)+2:end)];
            adjlist(1) = [];
        end
    end
    fprintf(fhn, '%s', newline);
    readline = fgets(fh);
end


fclose(fh);
fclose(fhn);

end