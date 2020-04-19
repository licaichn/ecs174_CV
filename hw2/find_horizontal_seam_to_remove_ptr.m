function horizontalSeam = find_horizontal_seam_to_remove_ptr(...
    cumulativeEnergyMap, ptrToRemove)
    % ptrToRemove is a vector [row, col] records the coordinates of the 
    % point to remove.
    % The function will find a vertical seam pass this point.
    [NRows, NCols] = size(cumulativeEnergyMap);
    horizontalSeam = zeros(1, NCols);
    horizontalSeam(ptrToRemove(2)) = ptrToRemove(1);
    
    % pass to the left of image
    for j = ptrToRemove(2) - 1 : -1 : 1
        lastMinIdx = horizontalSeam(j+1);
        if lastMinIdx ~= 1
            if lastMinIdx ~= NRows
                [~, minIdx] = min([cumulativeEnergyMap(lastMinIdx-1, j), ...
                                   cumulativeEnergyMap(lastMinIdx, j), ...
                                   cumulativeEnergyMap(lastMinIdx+1, j)]);
                horizontalSeam(j) = lastMinIdx + minIdx - 2;
            else
                % Hit Col end
                [~, minIdx] = min([cumulativeEnergyMap(lastMinIdx-1, j), ...
                                   cumulativeEnergyMap(lastMinIdx, j)]);
                horizontalSeam(j) = lastMinIdx + minIdx - 2;
            end
        else
            % Hit Col beginning
            [~, minIdx] = min([cumulativeEnergyMap(lastMinIdx, j), ...
                                   cumulativeEnergyMap(lastMinIdx+1, j)]);
            horizontalSeam(j) = lastMinIdx + minIdx - 1;
        end
    end
    
    % pass to the right of the image
    for j = ptrToRemove(2) + 1 : 1 : NCols
        lastMinIdx = horizontalSeam(j-1);
        if lastMinIdx ~= 1
            if lastMinIdx ~= NRows
                [~, minIdx] = min([cumulativeEnergyMap(lastMinIdx-1, j), ...
                                   cumulativeEnergyMap(lastMinIdx, j), ...
                                   cumulativeEnergyMap(lastMinIdx+1, j)]);
                horizontalSeam(j) = lastMinIdx + minIdx - 2;
            else
                % Hit Col end
                [~, minIdx] = min([cumulativeEnergyMap(lastMinIdx-1, j), ...
                                   cumulativeEnergyMap(lastMinIdx, j)]);
                horizontalSeam(j) = lastMinIdx + minIdx - 2;
            end
        else
            % Hit Col beginning
            [~, minIdx] = min([cumulativeEnergyMap(lastMinIdx, j), ...
                                   cumulativeEnergyMap(lastMinIdx+1, j)]);
            horizontalSeam(j) = lastMinIdx + minIdx - 1;
        end
    end
end