% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Apply CLAHE to enhance local contrast
clahe_img = adapthisteq(ct_img, 'ClipLimit', 0.02, 'NumTiles', [8 8]);

% Display the original and CLAHE-enhanced images side-by-side
figure;
subplot(1, 2, 1);
imshow(ct_img);
title('Original Image');

subplot(1, 2, 2);
imshow(clahe_img);
title('CLAHE Image');
