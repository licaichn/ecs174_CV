function [reducedColorImg, reducedEnergyImg, reducedRoiImg] = ...
    decrease_height_to_remove_roi_single_seam(im, energyIm, roiIm)
% decrease a single vertical seam passing through the non-zero area of the 
% roiIm
    [ptrX, ptrY] = find(roiIm, 1);
    if ~isempty(ptrX)
        reducedColorImg = zeros(size(im, 1)-1, size(im, 2), size(im,3));
        reducedEnergyImg = zeros(size(energyIm, 1)-1, size(energyIm, 2));
        reducedRoiImg = zeros(size(roiIm, 1)-1, size(roiIm, 2));

        cumulativeEnergyMap = cumulative_min_energy_map(energyIm, 'HORIZONTAL');
        seam = find_horizontal_seam_to_remove_ptr(cumulativeEnergyMap, ...
                                                    [ptrX, ptrY]);
                                                
        for i = 1:size(im, 2)
            tempIm = squeeze(im(:, i, :));
            tempIm(seam(i), :) = [];
            reducedColorImg(:, i, :) = tempIm;
            tempEnergyIm = squeeze(energyIm(:, i));
            tempEnergyIm(seam(i)) = [];
            reducedEnergyImg(:, i) = tempEnergyIm;
            tempRoiIm = squeeze(roiIm(:, i));
            tempRoiIm(seam(i)) = [];
            reducedRoiImg(:, i) = tempRoiIm;
        end

        reducedColorImg = uint8(reducedColorImg);
        reducedRoiImg = logical(reducedRoiImg);
    else
        disp('Has removed all the ptrs!');
        reducedColorImg = im;
        reducedEnergyImg = energyIm;
        reducedRoiImg = roiIm;
    end
end