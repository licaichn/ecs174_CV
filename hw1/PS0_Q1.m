temp = load('PS0_A.mat', 'A');
A = temp.A;

% question a
figure;
plot(sort(A(:), 'descend'), 'lineWidth', 2);
set(gca, 'fontSize', 15, 'lineWidth', 2);

% question b
figure;
hist(A(:), 10, 'FaceColor', 'g', 'lineWidth', 2);
set(gca, 'fontsize', 15, 'lineWidth', 2);

% question c
Z = A(floor(size(A, 1)/2):end, 1:floor(size(A,2)/2));
figure;
imagesc(Z);
colormap jet;
set(gca, 'fontsize', 15, 'linewidth', 2);
colorbar;

% question d
W = A - mean(A(:));
figure;
imagesc(W);
set(gca, 'fontsize', 15, 'linewidth', 2);
colormap jet;
colorbar;

% question e
Y = zeros(size(A, 1), size(A, 2), 3);
t = mean(A(:));
Y = Y + cat(3, (A > t) * 255, zeros(size(A)), zeros(size(A)));
figure;
imagesc(Y);
set(gca, 'fontsize', 15, 'linewidth', 2);
colormap jet;
colorbar;