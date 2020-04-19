function [reducedColorImg, reducedEnergyImg] = ...
    decrease_height(im, energyIm)
    % reduce the width using horizonal seam
    reducedColorImg = zeros(size(im, 1)-1, size(im, 2), size(im,3));
    reducedEnergyImg = zeros(size(energyIm, 1)-1, size(energyIm, 2));
    
    cumulativeEnergyMap = cumulative_min_energy_map(energyIm, 'HORIZONTAL');
    seam = find_horizontal_seam(cumulativeEnergyMap);
    
    for i = 1:size(im, 2)
        tempIm = squeeze(im(:, i, :));
        tempIm(seam(i), :) = [];
        reducedColorImg(:, i, :) = tempIm;
        tempEnergyIm = squeeze(energyIm(:, i));
        tempEnergyIm(seam(i)) = [];
        reducedEnergyImg(:, i) = tempEnergyIm;
    end
    
    reducedColorImg = uint8(reducedColorImg);
    
end