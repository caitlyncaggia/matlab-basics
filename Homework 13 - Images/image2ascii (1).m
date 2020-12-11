function image2ascii(image, str)
name = [image(1:end-4) '.txt']; %creates the output file name
im = imread(image); %opens the given image
newim = double(im); %converts the image matrix to double values
r = newim(:,:,1); %extracts the red layer
g = newim(:,:,2); %extracts the blue layer
b = newim(:,:,3); %exxtracts the green layer
gray = (r + g + b)./3; %grayscales by averaging three layers
gray = double(gray); %converts gray array to double again
[r, c, ~] = size(gray); %finds size of gray array
fh = fopen(name, 'w'); %creates new text file with write permission
fclose(fh); %closes new text file
fh = fopen(name, 'a'); %opens new file with append permission
blockrows = 1:8:r; %finds the index of the top of each block
blockcols = 1:4:c; %finds the index of the left side of each block
for i = 1:length(blockrows) %loop runs for as many blocks tall the image is
    line = ''; %sets line as blank
    cr = blockrows(i); %current row is the ith index of the list of starting row indicies
    for j = 1:length(blockcols) %loop runs for as many blocks wide the image is
        cc = blockcols(j); %current col is the ith index of the list of starting col indicies
        arr = gray(cr:cr+7, cc:cc+3); %creates the ith block
        bigsum = sum(sum(arr)); %sums the intensities of the block
        intensity = round(bigsum/32); %divides intensity by 32 (finds the avg intensity)
        %conditional finds appropriate value in the string based on
        %the block's average intensity
        if 0 <= intensity && intensity <=  31
            letter = str(1);
        elseif 32 <= intensity && intensity <=  63
            letter = str(2);
        elseif 64 <= intensity && intensity <=  95
            letter = str(3);
        elseif 96 <= intensity && intensity <= 127
            letter = str(4);
        elseif 128 <= intensity && intensity <= 159
            letter = str(5);
        elseif 160 <= intensity && intensity <= 191
            letter = str(6);
        elseif 192 <= intensity && intensity <= 223
            letter = str(7);
        elseif 224 <= intensity && intensity <= 255
            letter = str(8);
        end
        line = [line letter]; %adds this letter to the current line
    end
    fprintf(fh, '%s\n', line); %adds this line to the text file
end
fclose(fh); %closes the text file
end