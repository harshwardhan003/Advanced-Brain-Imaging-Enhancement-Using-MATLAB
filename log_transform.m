% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Convert image to double precision
img_double = im2double(ct_img);

% Apply logarithmic transformation
c = 1; % Scaling constant
log_transformed_img = c * log(1 + img_double);

% Display the original and logarithmically-transformed images side-by-side
figure;
subplot(1, 2, 1);
imshow(img_double);
title('Original Image');

subplot(1, 2, 2);
imshow(log_transformed_img);
title('Logarithmic Transformed Image');
