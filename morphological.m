% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Apply Gaussian smoothing
smoothed_img = imgaussfilt(ct_img, 1);

% Perform thresholding
threshold_level = graythresh(smoothed_img);
binary_img = imbinarize(smoothed_img, threshold_level);

% Define a structuring element
se = strel('disk', 5);

% Perform morphological operations
opened_img = imopen(binary_img, se);
closed_img = imclose(binary_img, se);

% Display the binary image, opened image, and closed image side-by-side
figure;
subplot(1, 3, 1);
imshow(binary_img);
title('Binary Image');

subplot(1, 3, 2);
imshow(opened_img);
title('Opened Image');

subplot(1, 3, 3);
imshow(closed_img);
title('Closed Image');
