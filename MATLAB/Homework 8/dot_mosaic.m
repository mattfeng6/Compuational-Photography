close all;

% For grayscale dot mosaic
im = im2double(rgb2gray(imread('https://user-images.githubusercontent.com/54331576/193479573-1567b99f-fdad-4d39-a079-e290633750aa.JPG')));
mosaic = dot_mosaic_gray(im, 80);  % Choose Size carefully!
figure; montage({im, mosaic});

im = im2double(rgb2gray(imread('https://user-images.githubusercontent.com/54331576/193472835-dd988e87-aa74-46c6-abaa-a767b4aae2d2.jpg')));
mosaic = dot_mosaic_gray(im, 80);  % Choose Size carefully!
figure; montage({im, mosaic});

im = im2double(rgb2gray(imread('https://user-images.githubusercontent.com/54331576/193472576-538282e3-06e6-4a58-ab2d-19c775be3ec7.jpg')));
mosaic = dot_mosaic_gray(im, 40);  % Choose Size carefully!
figure; montage({im, mosaic});



% For color dot mosaic
im = im2double(imread('https://user-images.githubusercontent.com/54331576/193471416-949ecc05-cb4a-4b84-be14-e5843ef0343c.jpg'));
mosaic = dot_mosaic_color(im, 60);  % Choose Size carefully!
figure; montage({im, mosaic});

im = im2double(imread('https://user-images.githubusercontent.com/54331576/191289143-d8878fb8-f557-416c-997d-b5df62cf73ee.jpg'));
mosaic = dot_mosaic_color(im, 60);  % Choose Size carefully!
figure; montage({im, mosaic});

im = im2double(imread('https://user-images.githubusercontent.com/54331576/191400680-ec0ed8d8-e1f1-498f-b4c7-2a959a8f482a.jpg'));
mosaic = dot_mosaic_color(im, 70);  % Choose Size carefully!
figure; montage({im, mosaic});



function result = dot_mosaic_gray(im, Size)

    % Calculate k value
    [h, w, ~] = size(im);
    k = round(min(h, w) / Size);
    if mod(k, 2) == 0
        k = k - 1;
    end

    % Resize the image
    if h < w
        im_resized = imresize(im, [NaN Size]);
    else
        im_resized = imresize(im, [Size NaN]);
    end

    % Create cellular array
    [h_resized, w_resized, ~] = size(im_resized);
    arr = cell(h_resized, w_resized);
    for i = 1 : h_resized
        for j = 1 : w_resized
            
            filter = fspecial('disk', (k - 1)/2 * (1-im_resized(i, j)));
            [h_f, w_f, ~] = size(filter);
            
            if h_f > k
                imresize(filter, [k, k]);
                filter = 1 - rescale(filter);
                arr{i, j} = filter;
            else
                filter = 1 - rescale(filter);
                border = (k - h_f)/2;
                arr{i, j} = padarray(filter, [border, border], 1, 'both');
            end
    

        end
    end

    % convert array into image matrix
    result = cell2mat(arr);

end

function result = dot_mosaic_color(im, Size)
 
     % Calculate k value
    [h, w, ~] = size(im);
    k = round(min(h, w) / Size);
    if mod(k, 2) == 0
        k = k - 1;
    end

    % Resize the image
    if h > w
        im_resized = imresize(im, [NaN Size]);
    else
        im_resized = imresize(im, [Size NaN]);
    end

    % Create cellular array

    % R
    im_resized_R = im_resized(:, :, 1);
    [h_resized, w_resized, ~] = size(im_resized);
    arr1 = cell(h_resized, w_resized);
    for i = 1 : h_resized
        for j = 1 : w_resized
            
            filter = fspecial('disk', (k - 1)/2 * (1-im_resized_R(i, j)));
            [h_f, w_f, ~] = size(filter);
            
            if h_f > k
                imresize(filter, [k, k]);
                filter = 1 - rescale(filter);
                arr1{i, j} = filter;
            else
                filter = 1 - rescale(filter);
                border = (k - h_f)/2;
                arr1{i, j} = padarray(filter, [border, border], 1, 'both');
            end
    

        end
    end

    % G
    im_resized_G = im_resized(:, :, 2);
    [h_resized, w_resized, ~] = size(im_resized);
    arr2 = cell(h_resized, w_resized);
    for i = 1 : h_resized
        for j = 1 : w_resized
            
            filter = fspecial('disk', (k - 1)/2 * (1-im_resized_G(i, j)));
            [h_f, w_f, ~] = size(filter);
            
            if h_f > k
                imresize(filter, [k, k]);
                filter = 1 - rescale(filter);
                arr2{i, j} = filter;
            else
                filter = 1 - rescale(filter);
                border = (k - h_f)/2;
                arr2{i, j} = padarray(filter, [border, border], 1, 'both');
            end
    

        end
    end

    % B
    im_resized_B = im_resized(:, :, 3);
    [h_resized, w_resized, ~] = size(im_resized);
    arr3 = cell(h_resized, w_resized);
    for i = 1 : h_resized
        for j = 1 : w_resized
            
            filter = fspecial('disk', (k - 1)/2 * (1-im_resized_B(i, j)));
            [h_f, w_f, ~] = size(filter);
            
            if h_f > k
                imresize(filter, [k, k]);
                filter = 1 - rescale(filter);
                arr3{i, j} = filter;
            else
                filter = 1 - rescale(filter);
                border = (k - h_f)/2;
                arr3{i, j} = padarray(filter, [border, border], 1, 'both');
            end
    

        end
    end

    % convert array into image matrix
    result = cat(3, cell2mat(arr1), cell2mat(arr2), cell2mat(arr3));


end