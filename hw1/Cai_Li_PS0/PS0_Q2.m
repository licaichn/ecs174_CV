% PS0 Q2
img = imread('peppers.png');
imageTransfer(img);

function imageTransfer(img)
    % question a, convert to the grayscale
    grayImg = uint8(0.2989 * img(:, :, 1) + ...
        0.5870 * img(:, :, 2) + 0.1140 * img(:, :, 3));
    
    % question b, convert to negative image
    negImg = uint8(ones(size(grayImg)) * 255 - double(grayImg));
    
    % question c, flip the image from left to right
    mirImg = flip(img, 2);
    
    % question d, swap the red and blue channel
    swapImg = img;
    swapImg(:, :, 1) = img(:, :, 3);
    swapImg(:, :, 3) = img(:, :, 1);
    
    % question e, average the image
    avgImg = uint8((double(mirImg) + double(img)) / 2);
    
    % question f, add or subtract a random value and then threshold 
    threshImg = double(grayImg) + rand(size(grayImg)) * 255;
    threshImg(threshImg < 0) = 0;
    threshImg(threshImg > 255) = 255;
    threshImg = uint8(threshImg);
    
    % plot
    figure;
    subplot(3, 2, 1);
    imshow(grayImg);
    title('Gray Image');
    
    subplot(3, 2, 2);
    imshow(negImg);
    title('Negative Image');
    
    subplot(3, 2, 3);
    imshow(mirImg);
    title('Mirror Image');
    
    subplot(3, 2, 4);
    imshow(swapImg);
    title('Swapped Img');
    
    subplot(3, 2, 5);
    imshow(avgImg);
    title('Average Image');
    
    subplot(3, 2, 6);
    imshow(threshImg);
    title('Thresholded Image');
        
end