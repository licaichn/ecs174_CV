im = imread('IMG_1943.JPG');
im = imresize(im, floor([size(im, 1)/4, size(im, 2)/4]));
energyIm = energy_img(im);
% figure;imshow(im)


% hsvIm = rgb2hsv(im);
% hIm = hsvIm(:,:,1);
% figure; 
% imagesc(hIm);

% figure;
% subplot(1,2,1);
% imshow(im);
% 
% for i = 1:10
%     energyIm = energy_img(im);
%     [im, energyIm] = decrease_height(im, energyIm);
%     disp(i);
% end
% subplot(1,2,2);
% imshow(im);


% ptr = [round(size(im,1)/2), round(size(im,2)/2)];
% cu_v = cumulative_min_energy_map(energyIm, 'VERTICAL');
% seam = find_vertical_seam_to_remove_ptr(cu_v, ptr);
% view_seam(im, seam, 'VERTICAL');
% 
% ptr = [round(size(im,1)/2), round(size(im,2)/2)];
% cu_h = cumulative_min_energy_map(energyIm, 'HORIZONTAL');
% seam = find_horizontal_seam_to_remove_ptr(cu_h, ptr);
% view_seam(im, seam, 'HORIZONTAL');


% remove roi
roiIm = draw_roi_to_move(im);
[newIm, newEnergyIm] = remove_roi(im, roiIm);
