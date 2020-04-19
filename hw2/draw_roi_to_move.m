function roiToRemove = draw_roi_to_move(im)
% this create a polygon roi. Remember to double click the mouse in order 
% to exit. 
    f = figure;
    imshow(im);
    roi = impoly();
    wait(roi);
    roiToRemove = createMask(roi);
    close(f);
end