function cumulativeEnergyMap = cumulative_min_energy_map(energyImg, ...
    seamDirection)
    cumulativeEnergyMap = zeros(size(energyImg));
    if strcmp(seamDirection, 'HORIZONTAL')
        [NRows, NCols] = size(energyImg);
        cumulativeEnergyMap(:,1) = energyImg(:,1);
        for j = 2 : NCols
            for i = 1 : NRows
                if i ~= 1
                    if i ~= NRows
                        cumulativeEnergyMap(i, j) = energyImg(i,j) + ...
                            min([cumulativeEnergyMap(i-1, j-1), ...
                                cumulativeEnergyMap(i, j-1), ...
                                cumulativeEnergyMap(i+1, j-1)]);
                    else
                        % col end
                        cumulativeEnergyMap(i, j) = energyImg(i,j) + ...
                            min(cumulativeEnergyMap(i-1, j-1), ...
                                cumulativeEnergyMap(i, j-1));
                    end
                else
                    % col beginning
                    cumulativeEnergyMap(i, j) = energyImg(i,j) + ...
                        min(cumulativeEnergyMap(i, j-1), ...
                            cumulativeEnergyMap(i+1, j-1));
                end
            end
        end
    else
        if strcmp(seamDirection, 'VERTICAL')
            [NRows, NCols] = size(energyImg);
            cumulativeEnergyMap(1,:) = energyImg(1,:);
            for i = 2 : NRows
                for j = 1 : NCols
                    if j ~= 1
                        if j ~= NCols
                            cumulativeEnergyMap(i, j) = energyImg(i,j) + ...
                                min([cumulativeEnergyMap(i-1, j-1), ...
                                    cumulativeEnergyMap(i-1, j), ...
                                    cumulativeEnergyMap(i-1, j+1)]);
                        else
                            % col end
                            cumulativeEnergyMap(i, j) = energyImg(i,j) + ...
                                min(cumulativeEnergyMap(i-1, j-1), ...
                                    cumulativeEnergyMap(i-1, j));
                        end
                    else
                        % col beginning
                        cumulativeEnergyMap(i, j) = energyImg(i,j) + ...
                            min(cumulativeEnergyMap(i-1, j), ...
                                cumulativeEnergyMap(i-1, j+1));
                    end
                end
            end
        else
            disp('direction not correct');
        end
    end
end
