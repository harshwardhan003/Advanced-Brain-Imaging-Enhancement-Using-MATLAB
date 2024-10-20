% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Convert image to double precision
img_double = im2double(ct_img);

% Apply homomorphic filtering
H = fspecial('gaussian', 30, 10); % Gaussian filter for homomorphic filtering
img_filtered = imfilter(img_double, H, 'replicate');
img_homomorphic = img_double ./ img_filtered;

% Display the original and homomorphic-filtered images side-by-side
figure;
subplot(1, 2, 1);
imshow(img_double);
title('Original Image');

subplot(1, 2, 2);
imshow(img_homomorphic);
title('Homomorphic Filtered Image');
