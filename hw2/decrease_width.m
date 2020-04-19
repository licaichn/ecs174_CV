function [reducedColorImg, reducedEnergyImg] = ...
    decrease_width(im, energyIm)
    % reduce the width using vertical seam
    reducedColorImg = zeros(size(im, 1), size(im, 2)-1, size(im,3));
    reducedEnergyImg = zeros(size(energyIm, 1), size(energyIm, 2)-1);
    
    cumulativeEnergyMap = cumulative_min_energy_map(energyIm, 'VERTICAL');
    seam = find_vertical_seam(cumulativeEnergyMap);
    
    im = permute(im, [2,1,3]);
    energyIm = energyIm';
    reducedColorImg = permute(reducedColorImg, [2,1,3]);
    reducedEnergyImg = reducedEnergyImg';
    
    for i = 1:size(im, 2)
        tempIm = squeeze(im(:, i, :));
        tempIm(seam(i), :) = [];
        reducedColorImg(:, i, :) = tempIm;
        tempEnergyIm = squeeze(energyIm(:, i));
        tempEnergyIm(seam(i)) = [];
        reducedEnergyImg(:, i) = tempEnergyIm;
    end
    
    reducedColorImg = uint8(permute(reducedColorImg, [2,1,3]));
    reducedEnergyImg = reducedEnergyImg';
end