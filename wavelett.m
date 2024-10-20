% Load the brain CT scan image
ct_img = imread('ct_image.jpeg'); 

% Convert the image to grayscale (if not already grayscale)
if size(ct_img, 3) == 3
    ct_img = rgb2gray(ct_img); 
end

% Apply Gaussian smoothing
smoothed_img = imgaussfilt(ct_img, 2);

% Perform wavelet decomposition
[LL, LH, HL, HH] = dwt2(smoothed_img, 'haar');

% Reconstruct the image from approximation coefficients
reconstructed_img = idwt2(LL, LH, HL, HH, 'haar');

% Display the smoothed and wavelet-reconstructed images side-by-side
figure;
subplot(1, 2, 1);
imshow(smoothed_img);
title('Smoothed Image');

subplot(1, 2, 2);
imshow(reconstructed_img, []);
title('Wavelet Reconstructed Image');
