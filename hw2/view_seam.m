function view_seam(im, seam, seamDirection)
    figure; 
    imshow(im);
    hold on;
    x = 1:numel(seam);
    if strcmp(seamDirection, 'HORIZONTAL')
        plot(x, seam, 'r', 'linewidth', 2);
    else
        if strcmp(seamDirection, 'VERTICAL')
            plot(seam, x, 'r', 'linewidth', 2);
        else
            disp('seamDirection not correct!');
        end
    end
end