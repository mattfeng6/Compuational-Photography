%% Writeups
% * Video URL
% <http://www.xxx.xxx>
%
% BRIEF DESCRIPTION:
% - This final project tends to look at the Seam Carving Method, which
% allow users to change the size of the picture while keeping the important
% content.
% - This project tends to use Edge Detection Method to find the energy of
% the image.
% - ALL PICTURES are personal works shot by myself.
%

%% Your project code
close all;


% FIRST IMGAE -- PET
img = imresize(imread('https://user-images.githubusercontent.com/54331576/193166715-34ca7d95-2579-4f59-a272-94c673620d98.jpg'), 0.4);

% Set up the height & width needed to be deducted
heightDeducted = 80;
widthDeducted = 50;

% Get the energy of the image using edge Detection Method
energy_img = edgeDetect(img);

% Find the vertical Seam Carving Line
energy_vertical_map = energyVerticalMap(energy_img);
min_vertical_seam = minVerticalSeam(energy_vertical_map);
vertical_seam_img = verticalSeamImg(img, min_vertical_seam);

% Find the horizontal Seam Carving Line
energy_horizontal_map = energyHorizontalMap(energy_img);
min_horizontal_seam = minHorizontalSeam(energy_horizontal_map);
horizontal_seam_img = horizontalSeamImg(img, min_horizontal_seam);

% Delete the pixels
after_width_deducted_img = img;
for i = widthDeducted: -1 : 1
    after_width_deducted_img = verticalSeam(after_width_deducted_img);
end

after_height_deducted_img = img;
for i = heightDeducted: -1 : 1
    after_height_deducted_img = horizontalSeam(after_height_deducted_img);
end


figure(1);
subplot(3, 2, 1); imshow(img); title("Image - Pet");
subplot(3, 2, 2); imshow(energy_img); title("Energy of Image (Edge Detection)");

subplot(3, 2, 3); imshow(vertical_seam_img); title("First Min Vertical Seam");
subplot(3, 2, 4); imshow(after_width_deducted_img); title("Width " + widthDeducted + " Deducted")

subplot(3, 2, 5); imshow(horizontal_seam_img); title("First Min Horizontal Seam");
subplot(3, 2, 6); imshow(after_height_deducted_img); title("Height " + heightDeducted + " Deducted")


% SECOND IMAGE -- MOUNTAIN
img = imresize(imread('https://user-images.githubusercontent.com/54331576/204958857-87dc80ed-78a7-4752-be84-751176fc305a.jpg'), 0.25);

% Set up the height & width needed to be deducted
heightDeducted = 60;
widthDeducted = 80;

% Get the energy of the image using edge Detection Method
energy_img = edgeDetect(img);

% Find the vertical Seam Carving Line
energy_vertical_map = energyVerticalMap(energy_img);
min_vertical_seam = minVerticalSeam(energy_vertical_map);
vertical_seam_img = verticalSeamImg(img, min_vertical_seam);

% Find the horizontal Seam Carving Line
energy_horizontal_map = energyHorizontalMap(energy_img);
min_horizontal_seam = minHorizontalSeam(energy_horizontal_map);
horizontal_seam_img = horizontalSeamImg(img, min_horizontal_seam);

% Delete the pixels
after_width_deducted_img = img;
for i = widthDeducted: -1 : 1
    after_width_deducted_img = verticalSeam(after_width_deducted_img);
end

after_height_deducted_img = img;
for i = heightDeducted: -1 : 1
    after_height_deducted_img = horizontalSeam(after_height_deducted_img);
end


figure(2);
subplot(3, 2, 1); imshow(img); title("Image - Mountain");
subplot(3, 2, 2); imshow(energy_img); title("Energy of Image (Edge Detection)");

subplot(3, 2, 3); imshow(vertical_seam_img); title("First Min Vertical Seam");
subplot(3, 2, 4); imshow(after_width_deducted_img); title("Width " + widthDeducted + " Deducted")

subplot(3, 2, 5); imshow(horizontal_seam_img); title("First Min Horizontal Seam");
subplot(3, 2, 6); imshow(after_height_deducted_img); title("Height " + heightDeducted + " Deducted")



% THIRD IMAGE -- CAMPUS SKY
img = imresize(imread('https://user-images.githubusercontent.com/54331576/204959118-57334c5c-507f-4f70-8bf2-bf4b2fa0b610.jpg'), 0.25);

% Set up the height & width needed to be deducted
heightDeducted = 60;
widthDeducted = 100;

% Get the energy of the image using edge Detection Method
energy_img = edgeDetect(img);

% Find the vertical Seam Carving Line
energy_vertical_map = energyVerticalMap(energy_img);
min_vertical_seam = minVerticalSeam(energy_vertical_map);
vertical_seam_img = verticalSeamImg(img, min_vertical_seam);

% Find the horizontal Seam Carving Line
energy_horizontal_map = energyHorizontalMap(energy_img);
min_horizontal_seam = minHorizontalSeam(energy_horizontal_map);
horizontal_seam_img = horizontalSeamImg(img, min_horizontal_seam);

% Delete the pixels
after_width_deducted_img = img;
for i = widthDeducted: -1 : 1
    after_width_deducted_img = verticalSeam(after_width_deducted_img);
end

after_height_deducted_img = img;
for i = heightDeducted: -1 : 1
    after_height_deducted_img = horizontalSeam(after_height_deducted_img);
end


figure(3);
subplot(3, 2, 1); imshow(img); title("Image - Campus Sky");
subplot(3, 2, 2); imshow(energy_img); title("Energy of Image (Edge Detection)");

subplot(3, 2, 3); imshow(vertical_seam_img); title("First Min Vertical Seam");
subplot(3, 2, 4); imshow(after_width_deducted_img); title("Width " + widthDeducted + " Deducted")

subplot(3, 2, 5); imshow(horizontal_seam_img); title("First Min Horizontal Seam");
subplot(3, 2, 6); imshow(after_height_deducted_img); title("Height " + heightDeducted + " Deducted")



%FOURTH IMAGE -- Snow
img = imresize(imread('https://user-images.githubusercontent.com/54331576/204959588-c8ab73da-b0ff-4d51-a482-a50fc2d0d552.jpg'), 0.3);

% Set up the height & width needed to be deducted
heightDeducted = 70;
widthDeducted = 50;

% Get the energy of the image using edge Detection Method
energy_img = edgeDetect(img);

% Find the vertical Seam Carving Line
energy_vertical_map = energyVerticalMap(energy_img);
min_vertical_seam = minVerticalSeam(energy_vertical_map);
vertical_seam_img = verticalSeamImg(img, min_vertical_seam);

% Find the horizontal Seam Carving Line
energy_horizontal_map = energyHorizontalMap(energy_img);
min_horizontal_seam = minHorizontalSeam(energy_horizontal_map);
horizontal_seam_img = horizontalSeamImg(img, min_horizontal_seam);

% Delete the pixels
after_width_deducted_img = img;
for i = widthDeducted: -1 : 1
    after_width_deducted_img = verticalSeam(after_width_deducted_img);
end

after_height_deducted_img = img;
for i = heightDeducted: -1 : 1
    after_height_deducted_img = horizontalSeam(after_height_deducted_img);
end


figure(4);
subplot(3, 2, 1); imshow(img); title("Image - Snow");
subplot(3, 2, 2); imshow(energy_img); title("Energy of Image (Edge Detection)");

subplot(3, 2, 3); imshow(vertical_seam_img); title("First Min Vertical Seam");
subplot(3, 2, 4); imshow(after_width_deducted_img); title("Width " + widthDeducted + " Deducted")

subplot(3, 2, 5); imshow(horizontal_seam_img); title("First Min Horizontal Seam");
subplot(3, 2, 6); imshow(after_height_deducted_img); title("Height " + heightDeducted + " Deducted")



% FIFTH IMAGE -- SEAGULL
img = imresize(imread('https://user-images.githubusercontent.com/54331576/204959908-1147ffb9-100e-43cf-800c-f8ecfe65936d.jpg'), 0.25);

% Set up the height & width needed to be deducted
heightDeducted = 100;
widthDeducted = 50;

% Get the energy of the image using edge Detection Method
energy_img = edgeDetect(img);

% Find the vertical Seam Carving Line
energy_vertical_map = energyVerticalMap(energy_img);
min_vertical_seam = minVerticalSeam(energy_vertical_map);
vertical_seam_img = verticalSeamImg(img, min_vertical_seam);

% Find the horizontal Seam Carving Line
energy_horizontal_map = energyHorizontalMap(energy_img);
min_horizontal_seam = minHorizontalSeam(energy_horizontal_map);
horizontal_seam_img = horizontalSeamImg(img, min_horizontal_seam);

% Delete the pixels
after_width_deducted_img = img;
for i = widthDeducted: -1 : 1
    after_width_deducted_img = verticalSeam(after_width_deducted_img);
end

after_height_deducted_img = img;
for i = heightDeducted: -1 : 1
    after_height_deducted_img = horizontalSeam(after_height_deducted_img);
end


figure(5);
subplot(3, 2, 1); imshow(img); title("Image - Seagull");
subplot(3, 2, 2); imshow(energy_img); title("Energy of Image (Edge Detection)");

subplot(3, 2, 3); imshow(vertical_seam_img); title("First Min Vertical Seam");
subplot(3, 2, 4); imshow(after_width_deducted_img); title("Width " + widthDeducted + " Deducted")

subplot(3, 2, 5); imshow(horizontal_seam_img); title("First Min Horizontal Seam");
subplot(3, 2, 6); imshow(after_height_deducted_img); title("Height " + heightDeducted + " Deducted")


% FIFTH IMAGE -- SEAGULL (EXTENSTION)
img = imresize(imread('https://user-images.githubusercontent.com/54331576/204959908-1147ffb9-100e-43cf-800c-f8ecfe65936d.jpg'), 0.25);

heightDeducted = 150;

energy_img = edgeDetect(img);
energy_horizontal_map = energyHorizontalMap(energy_img);


after_height_deducted_img = img;

for i = heightDeducted: -1 : 1

    after_height_deducted_img = horizontalSeam(after_height_deducted_img);
end

figure(6);
subplot(2, 2, 1); imshow(img); title("Image - Seagull");
subplot(2, 2, 2); imshow(energy_img); title("Energy of Image");
subplot(2, 2, 3); imshow(after_height_deducted_img); title("Image after Seam Carving");
subplot(2, 2, 4); imshow(energy_horizontal_map); title("Energy Horizontal Map");


%% Set the following two flags to "YES!" when ready to submit.
are_you_sure_video_url_is_correct = "";
are_you_sure_brief_description_is_provided = "";


% Energy Function -- Using Edge Detection Method
function energy_img = edgeDetect(img)


    % Detect the edge of the image
    gray_img = rgb2gray(im2double(img));
    gauss_img = imgaussfilt(gray_img, 1);
    
    sobel_x = fspecial("sobel");
    grad_x = imfilter(gauss_img, sobel_x, "replicate");

    sobel_y = transpose(sobel_x);
    grad_y = imfilter(gauss_img, sobel_y, "replicate");

    energy_img = sqrt(grad_x.^2 + grad_y.^2);

end


function energy_vertical_map = energyVerticalMap(img)

    map = zeros(size(img));

    [r, c] = size(img);
    map(1,:) = img(1,:);
    for i = 2 : r
        for j = 1 : c
            if j == 1
                map(i,j) = img(i,j) + min([map(i-1,j), map(i-1,j+1)]);
            elseif j == c
                map(i,j) = img(i,j) + min([map(i-1,j-1), map(i-1,j)]);
            else
                map(i,j) = img(i,j) + min([map(i-1,j-1), map(i-1,j), map(i-1,j+1)]);
            end
        end
    end

    energy_vertical_map = map;

end


function energy_horizontal_map = energyHorizontalMap(img)

    map = zeros(size(img));

    [r, c] = size(img);
    map(:,1) = img(:,1);
    for i = 2 : c
        for j = 1 : r
            if j == 1
                map(j,i) = img(j,i) + min([map(j,i-1), map(j+1,i-1)]);
            elseif j == r
                map(j,i) = img(j,i) + min([map(j-1,i-1), map(j,i-1)]);
            else
                map(j,i) = img(j,i) + min([map(j-1,i-1), map(j,i-1), map(j+1,i-1)]);
            end
        end
    end

    energy_horizontal_map = map;

end


function min_vertical_seam = minVerticalSeam(map)

    [r, c] = size(map);
    [~, min_idx] = min(map(r, :));

    min_vertical_seam(r, 1) = min_idx;
    for i = r-1 : -1 : 1
        j = min_vertical_seam(i+1, 1);

        if j == 1
            [~, idx] = min([map(i, j), map(i, j+1)]);
        elseif j == c
            [~, idx] = min([map(i, j), map(i, j-1)]);
        else
            [~, idx] = min([map(i, j), map(i, j-1), map(i, j+1)]);
        end

        dir = idx-2;
        j = j+dir;
        min_vertical_seam(i,1) = j;
    end
end


function min_horizontal_seam = minHorizontalSeam(map)

    [r, c] = size(map);
    [~, min_idx] = min(map(:, c));

    min_horizontal_seam(c) = min_idx;
    for i = c-1 : -1 : 1
        j = min_horizontal_seam(i+1);

        if j == 1
            [~, idx] = min([map(j, i), map(j+1, i)]);
        elseif j == r
            [~, idx] = min([map(j, i), map(j-1, i)]);
        else
            [~, idx] = min([map(j, i), map(j-1, i), map(j+1, i)]);
        end

        dir = idx-2;
        j = j+dir;
        min_horizontal_seam(i) = j;
    end
end


function vertical_seam_img = verticalSeam(img)

    energy_img = edgeDetect(img);

    energy_vertical_map = energyVerticalMap(energy_img);

    min_vertical_seam = minVerticalSeam(energy_vertical_map);

    len = size(min_vertical_seam, 1);
    
    for i = 1 : len
        img(i, min_vertical_seam(i,1) : end-1, :) = img(i, min_vertical_seam(i,1)+1 : end, :);
    end

    vertical_seam_img = img(:, 1:end-1, :);

end


function horizontal_seam_img = horizontalSeam(img)

    energy_img = edgeDetect(img);

    energy_horizontal_map = energyHorizontalMap(energy_img);

    min_horizontal_seam = minHorizontalSeam(energy_horizontal_map);

    len = size(min_horizontal_seam, 2);

    for i = 1 : len
        img(min_horizontal_seam(i) : end-1, i, :) = img(min_horizontal_seam(i)+1 : end, i, :);
    end

    horizontal_seam_img = img(1:end-1, :, :);

end


function vertical_seam_img = verticalSeamImg(img, seam)

    vertical_seam_img = img;

    for i = 1 : size(vertical_seam_img, 1)
        color = [255, 0, 0]; % COLOR: RED
        vertical_seam_img(i, seam(i), :) = color;
    end

end


function horizontal_seam_img = horizontalSeamImg(img, seam)

    horizontal_seam_img = img;

    for i = 1 : size(horizontal_seam_img, 2)
        color = [255, 0, 0]; % COLOR: RED
        horizontal_seam_img(seam(i), i, :) = color;
    end

end
    