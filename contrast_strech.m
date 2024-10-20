% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Apply Gaussian smoothing
smoothed_img = imgaussfilt(ct_img, 2);

% Perform contrast stretching
pmin = double(min(smoothed_img(:)));
pmax = double(max(smoothed_img(:)));
stretched_img = imadjust(smoothed_img, [double(pmin) double(pmax)] / 255, [0 1]);

% Display the smoothed and contrast-stretched images side-by-side
figure;
subplot(1, 2, 1);
imshow(smoothed_img);
title('Smoothed Image');

subplot(1, 2, 2);
imshow(stretched_img);
title('Contrast Stretched Image');
