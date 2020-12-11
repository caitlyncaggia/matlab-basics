function greenScreen(image, overlay, replace)
name = [image(1:end-4) '_new.png']; %makes the new filename
im = imread(image); %opens the first/base image
r = im(:,:,1); %finds the red layer of the base image
g = im(:,:,2); %finds the green layer of the base image
b = im(:,:,3); %finds the blue layer of the base image
match = (r == replace(1) & g == replace(2) & b == replace(3)); 
%finds where the layers match the given specifications
ov = imread(overlay); %opens the overlay image
ro = ov(:,:,1); %finds the red layer of the overlay 
go = ov(:,:,2); %finds the green layer of the overlay
bo = ov(:,:,3); %finds the blue layer of the overlay
r(match) = ro(match); %where the red layer matches the given specifications,
%make the red layer of the base match the red layer of the overlay
g(match) = go(match); %where the green layer matches... ""
b(match) = bo(match); %where the blue layer matches... ""
newim = uint8(cat(3, r, g, b)); %concatenates the new layers into an image
imwrite(newim, name); %writes the new image
end