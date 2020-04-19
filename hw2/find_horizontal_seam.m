function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
    [NRows, NCols] = size(cumulativeEnergyMap);
    % find the min point in the last column
    horizontalSeam = zeros(1, NCols);
    [~, horizontalSeam(end)] = min(cumulativeEnergyMap(:, end));
    for j = NCols - 1 : -1 : 1
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
end