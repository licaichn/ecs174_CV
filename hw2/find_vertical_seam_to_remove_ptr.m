function verticalSeam = find_vertical_seam_to_remove_ptr(...
    cumulativeEnergyMap, ptrToRemove)
    % ptrToRemove is a vector [row, col] records the coordinates of the 
    % point to remove.
    % The function will find a vertical seam pass this point.
    [NRows, NCols] = size(cumulativeEnergyMap);
    verticalSeam = zeros(1, NRows);
    verticalSeam(ptrToRemove(1)) = ptrToRemove(2);
    
    % pass to the top of the image
    for i = ptrToRemove(1) - 1 : -1 : 1
        lastMinIdx = verticalSeam(i+1);
        if lastMinIdx ~= 1
            if lastMinIdx ~= NCols
                [~, minIdx] = min([cumulativeEnergyMap(i, lastMinIdx-1), ...
                                   cumulativeEnergyMap(i, lastMinIdx), ...
                                   cumulativeEnergyMap(i, lastMinIdx+1)]);
                verticalSeam(i) = lastMinIdx + minIdx - 2;
            else
                % Hit Row end
                [~, minIdx] = min([cumulativeEnergyMap(i, lastMinIdx-1), ...
                                   cumulativeEnergyMap(i, lastMinIdx)]);
                verticalSeam(i) = lastMinIdx + minIdx - 2;
            end
        else
            % Hit Row beginning
            [~, minIdx] = min([cumulativeEnergyMap(i, lastMinIdx), ...
                                   cumulativeEnergyMap(i, lastMinIdx+1)]);
            verticalSeam(i) = lastMinIdx + minIdx - 1;
        end
    end
    
    % pass to the bottom of the image
    for i = ptrToRemove(1) + 1 : 1 : NRows
        lastMinIdx = verticalSeam(i-1);
        if lastMinIdx ~= 1
            if lastMinIdx ~= NCols
                [~, minIdx] = min([cumulativeEnergyMap(i, lastMinIdx-1), ...
                                   cumulativeEnergyMap(i, lastMinIdx), ...
                                   cumulativeEnergyMap(i, lastMinIdx+1)]);
                verticalSeam(i) = lastMinIdx + minIdx - 2;
            else
                % Hit Row end
                [~, minIdx] = min([cumulativeEnergyMap(i, lastMinIdx-1), ...
                                   cumulativeEnergyMap(i, lastMinIdx)]);
                verticalSeam(i) = lastMinIdx + minIdx - 2;
            end
        else
            % Hit Row beginning
            [~, minIdx] = min([cumulativeEnergyMap(i, lastMinIdx), ...
                                   cumulativeEnergyMap(i, lastMinIdx+1)]);
            verticalSeam(i) = lastMinIdx + minIdx - 1;
        end
    end
end