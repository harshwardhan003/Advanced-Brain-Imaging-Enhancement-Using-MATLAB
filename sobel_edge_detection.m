% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Apply Gaussian smoothing
smoothed_img = imgaussfilt(ct_img, 1);

% Perform edge detection using Sobel operator
edges_img = edge(smoothed_img, 'Sobel');

% Display the smoothed image and edges detected side-by-side
figure;
subplot(1, 2, 1);
imshow(smoothed_img);
title('Smoothed Image');

subplot(1, 2, 2);
imshow(edges_img);
title('Sobel Edge Detection');
