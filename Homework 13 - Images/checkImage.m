function [comp] = checkImage(image1, image2)
im1 = imread(image1); %opens the first image
im2 = imread(image2); %opens the second image
[r1, c1, ~] = size(im1); %finds size of the first image
[r2, c2, ~] = size(im2); %finds size of the second image
red1 = im1(:,:,1); %extracts red layer of the first image
red2 = im2(:,:,1); %extracts red layer of the second image
green1 = im1(:,:,2); %extracts green layer of the first image
green2 = im2(:,:,2); %extracts green layer of the second image
blue1 = im1(:,:,3); %extracts blue layer of the first image
blue2 = im2(:,:,3); %extracts blue layer of the second image

if r1 == r2 & c1 == c2 & red1 == red2 & green1==green2 & blue1 == blue2
    %if the rows, columns, red, green, and blue layers are the same
    comp = 'The images are the same.'; %the images are the same
elseif r1 ~= r2 | c1 ~= c2 %if the images are different sizes
    comp = 'The images have different dimensions.'; %they have different dimensions
elseif r1 == r2 & c1 == c2 %if the images are the same size but different colors
    name1 = image1(1:end-4); %finds the first filename
    name2 = image2(1:end-4); %finds the second filename
    name = [name1 '_vs_' name2 '.png']; %creates the new filename
    comp = sprintf('The RBG values are different: see %s.', name); %outputs the string
    out = zeros(r1, c1); %creates an all black image the size of the original images
    same = (red1 == red2 & green1 == green2 & blue1 == blue2); %finds where the images are the same color
    out(same) = 255; %sets where the images are the same color to white
    out = uint8(out); %converts to an image data type
    imwrite(out, name); %creates the image
end

end