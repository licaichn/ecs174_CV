function energyImg = energy_img(im)
    % calculate the energy from each pixel of img
    grayIm = im2double(rgb2gray(im));
    h_sobelY = fspecial('sobel');
    h_sobelX = -h_sobelY'; 
    im_dx = imfilter(grayIm, h_sobelX);
    im_dy = imfilter(grayIm, h_sobelY);
    energyImg = sqrt(im_dx.^2 + im_dy.^2);
end