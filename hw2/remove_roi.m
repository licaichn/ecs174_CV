function [roiRemovedImg, roiRemovedEnergyImg] = remove_roi(im, ...
    roiIm)
% remove the roi area from the image
% determine decrease height or decrease width
    [ptrsX, ptrsY] = find(roiIm);
    nPtrsToRemove = numel(ptrsX);
    widthToRemove = max(ptrsY) - min(ptrsY);
    heightToRemove = max(ptrsX) - min(ptrsX);
    if heightToRemove > widthToRemove % decrease the width
        while nPtrsToRemove > 0
            energyIm = energy_img(im);
            energyIm(roiIm) = 0;
            [im, energyIm, roiIm] = decrease_width_to_remove_roi_single_seam(...
                im, energyIm, roiIm);
            nPtrsToRemove = numel(find(roiIm));
            fprintf("The number of points left in ROI: %d\n", nPtrsToRemove);
        end
    else
        while nPtrsToRemove > 0
            energyIm = energy_img(im);
            energyIm(roiIm) = 0;
            [im, energyIm, roiIm] = decrease_height_to_remove_roi_single_seam(...
                im, energyIm, roiIm);
            nPtrsToRemove = numel(find(roiIm));
            fprintf("The number of points left in ROI: %d\n", nPtrsToRemove);
        end
    end
    
    roiRemovedImg = im;
    roiRemovedEnergyImg = energyIm;

end

                                           