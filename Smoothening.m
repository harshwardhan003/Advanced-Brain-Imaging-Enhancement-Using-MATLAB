% Load the JPEG image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Apply Gaussian smoothing to reduce noise
smoothed_img = imgaussfilt(ct_img, 2); % The second argument controls the amount of smoothing (sigma)

% Display the original and smoothed images
figure;
subplot(1, 2, 1);
imshow(ct_img);
title('Original Image');

subplot(1, 2, 2);
imshow(smoothed_img);
title('Smoothed Image');
