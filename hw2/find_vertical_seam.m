function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    [NRows, NCols] = size(cumulativeEnergyMap);
    % find the min point in the last column
    verticalSeam = zeros(1, NRows);
    [~, verticalSeam(end)] = min(cumulativeEnergyMap(end, :));
    for i = NRows - 1 : -1 : 1
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
end