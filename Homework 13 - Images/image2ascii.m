function image2ascii(image, str)
name = [image(1:end-4) '.txt'];
im = imread(image);
gray = (im(:,:,1) + im(:,:,2) + im(:,:,3))./3;
gray = double(gray);
[r, c, ~] = size(gray);
line = '';
fh = fopen(name, 'w');
fclose(fh);
fh = fopen(name, 'a');
blockrows = 1:8:r;
blockcols = 1:4:c;
for i = 1:length(blockrows)-1
    line = '';
    cr = blockrows(i);
    for j = 1:length(blockcols)-1
        cc = blockcols(j);
        arr = gray(cr:cr+8, cc:cc+4);
        intensity = round(mean(mean(arr)));
        if 0 <= intensity & intensity <=  31
            letter = str(1);
        elseif 32 <= intensity & intensity <=  63
            letter = str(2);
        elseif 64 <= intensity & intensity <=  95
            letter = str(3);
        elseif 96 <= intensity & intensity <= 127
            letter = str(4);
        elseif 128 <= intensity & intensity <= 159
            letter = str(5);
        elseif 160 <= intensity & intensity <= 191
            letter = str(6);
        elseif 192 <= intensity & intensity <= 223
            letter = str(7);
        elseif 224 <= intensity & intensity <= 255
            letter = str(8);
        end
        line = [line letter];
    end
    fprintf(fh, '%s\n', line);
end
fclose(fh);
end