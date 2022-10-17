close('all');   % close all open figures so we start with a clean slate!

im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191289250-a43c28a1-e8ee-49b2-aa87-96e1084d5bf7.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191289143-d8878fb8-f557-416c-997d-b5df62cf73ee.jpg'));       % source image

poly_x = [276.4628  324.9961  391.5884  425.4488  453.6659  457.0519  433.3496 442.3791 ...
    441.2504  348.6984  248.2457  222.2860  238.0876  226.8008  222.2860  214.3853  224.5434  248.2457];
poly_y = [255.3512  238.4209  255.3512  250.8364  260.9946  283.5682  329.8442  349.0318 ...
    404.3372  419.0101  404.3372  356.9326  342.2597  308.3992  292.5977  265.5093  250.8364  247.4504];
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 575.9264;
bottom_y = 432.4922;
padding = 64;
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% Call the function to blend the images using the mask
levels = 6;         % levels in the Laplacian pyramid
result1 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% You must use the same images and mask and alignment coordinates as Part 1.
% Simply copy most of the code from Part 1 here.  The only difference
% is that the blending function called is now alpha_blend() instead of
% cut_and_paste().
% -------------------------------------------------------------------------


%%%%% your own images
im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191298324-b764e3d5-df2e-4027-960a-9fc67b509a6a.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191298623-8b3a14a4-87f8-404b-9e12-58df3e3a722a.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

poly_x = 1.0e+03 * [1.3112    1.3873    1.4761    1.5395    1.4761    1.6663    1.9073    2.0024    2.0404    1.9897    1.9200    1.8058    1.6917    1.5141    1.2985    1.3049];
poly_y = 1.0e+03 * [0.3334    0.3778    0.2763    0.3080    0.3968    0.5110    0.7202    0.9358    1.1958    1.4494    1.5953    1.7728    1.8933    1.9694    2.0201    0.3271];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 1.6464e+03;
bottom_y = 1.9884e+03;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 9;         % levels in the Laplacian pyramid
result2 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});


% REPEAT ABOVE FOR IMAGE SET 3


im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191395725-07c121b5-bf34-498f-9a71-f534dc2641a3.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191397546-93ce077d-14ea-4c4c-bd09-d76480516b24.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

poly_x = [233.5816  205.6633  174.8061  157.1735  141.0102  167.4592  198.3163  221.8265  232.1122];
poly_y = [227.5204  237.8061  240.7449  233.3980  223.1122  211.3571  206.9490  215.7653  227.5204];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 252.6837;
bottom_y = 340.0918;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 6;         % levels in the Laplacian pyramid
result3 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result3});


% REPEAT ABOVE FOR IMAGE SET 4


im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/190544877-30dd8f38-b60d-4a63-8d24-36ae4179f003.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191398643-0b9bded0-a331-4fa8-b7fd-9c3a7d2bcd06.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

poly_x = [472.0067  511.8137  546.1300  577.7011  562.6019  540.6394  514.5590  482.9879  456.9075  444.5536  472.0067];
poly_y = [361.6957  360.3231  358.9504  375.4223  405.6206  417.9745  426.2105  420.7198  398.7574  378.1676  363.0684];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 829.8456;
bottom_y = 477.9562;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 6;         % levels in the Laplacian pyramid
result4 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result4});



% REPEAT ABOVE FOR IMAGE SET 5

im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191400680-ec0ed8d8-e1f1-498f-b4c7-2a959a8f482a.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191400561-8ac9520b-f341-4f2a-8148-934355f044cf.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

poly_x = 1.0e+03 * [1.3649    1.4567    1.5158    1.4928    1.5880    1.6142    1.6995    1.6470    1.5847    1.6109    1.5289    1.4141    1.3550 ...
        1.4206    1.4108    1.3878    1.4403    1.4010    1.3977    1.3616    1.2861    1.2960    1.2796    1.2828    1.3288    1.3681];

poly_y = 1.0e+03 * [1.7737    1.7934    1.8820    1.9673    2.0263    2.0887    2.2658    2.3675    2.4200    2.4922    2.5381    2.5972    2.5677 ...
        2.5316    2.4332    2.2757    2.2297    2.1346    2.0788    2.1215    2.0920    2.0263    1.9640    1.8984    1.8459    1.7770];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

center_x = 1.7373e+03;
bottom_y = 3.5098e+03;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
levels = 4;         % levels in the Laplacian pyramid
result5 = laplacian_blend(im_bg, im_s, mask_s, levels);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result5});



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These are your functions that implement the blending method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function im_blend = laplacian_blend(im_bg, im_s, mask_s, levels)   
    
    mask_g = pyr_gaussian(mask_s, levels);
    im_bg_l = pyr_laplacian(im_bg, levels);
    im_s_l = pyr_laplacian(im_s, levels);

    pyr_blend = cell([levels, 1]);
    for i = 1 : levels
        pyr_blend{i} = im_s_l{i} .* mask_g{i} + im_bg_l{i} .* (1 - mask_g{i});
    end

    im_blend = pyr_laplacian_collapse(pyr_blend);

    % Tip:  You may want to visualize the Gaussian and Laplacian pyramids
    % computed in this function.  Functions for displaying pyramids
    % are included below.

end


function pyr_G = pyr_gaussian(im, levels)
% Computes Gaussian pyramid of image im over number of levels
    pyr_G = cell([levels, 1]);      % declare cell array of height "levels", and width 1
    
    pyr_G{1} = im;                  % level 1 is the orignal image
    for i=2:levels
        pyr_G{i} = imresize(imgaussfilt(pyr_G{i-1}, 2), 0.5);
    end                             % level i is image at level i-1 filtered with Gaussian(2)
                                    % and then downsampled by factor of 2
end


function pyr_L = pyr_laplacian(im, levels)
% Computes Laplacian pyramid of image im over number of levels
    pyr_G = pyr_gaussian(im, levels);   % first compute the Gaussian pyramid

    pyr_L = cell([levels, 1]);      % declare cell array of height "levels", and width 1
    
    pyr_L{levels} = pyr_G{levels};  % top level of Laplacian pyramid is the same as that of Gaussian pyramid
    for i= levels - 1 : -1 : 1
        [m n ~] = size(pyr_G{i});
        pyr_L{i} = pyr_G{i} - imresize(pyr_G{i+1}, [m n]);
                                    % level i of Laplacian is the difference of
                                    % Gaussian level i and upsampled level i+1
                                    % equalizes size by upsampling G{i+1}
    end
end

function im = pyr_laplacian_collapse(pyr)
% computes the image from its Laplacian pyramid
    levels = size(pyr, 1);
     
    for i = levels - 1: -1 : 1
        [m n ~] = size(pyr{i});
        pyr{i} = pyr{i} + imresize(pyr{i+1}, [m n]);
    end
    im = pyr{1};
        
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are complete functions to display Gaussian and
% Laplacian pyramids.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function display_gaussian(pyr)  % code is complete!
% displays the Gaussian pyramid
    figure; montage(pyr);               
end
    
function display_laplacian(pyr) % code is complete!
% displays the Laplacian pyramid
    levels = size(pyr, 1);      
    for i=1:levels-1
        pyr{i} = pyr{i} + 0.5;   % false color all levels except topmost by adding 0.5
    end
    figure; montage(pyr);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are helper functions.  You DO NOT NEED TO MODIFY
% any of the code below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im_s2, mask2] = alignSource(im_s, mask, im_t, center_x, bottom_y, padding)
    % Inputs:  source image, mask, target/background image, ...
    % center_x, bottom_y are the coordinates of the bottom center location on the target image
    % padding is the number of extra rows/coumns to include around the
    % object to allow for feathering/blending.

    % Outputs: an aligned source image and also an aligned blending mask.
    
    % find the bounding box of the mask, and enlarge it by the amount of
    % padding
    [y, x] = find(mask);
    y1 = min(y)-1-padding; y2 = max(y)+1+padding; 
    x1 = min(x)-1-padding; x2 = max(x)+1+padding;
    im_s2 = zeros(size(im_t));

    yind = (y1:y2);
    yind2 = yind - max(y) + round(bottom_y);
    xind = (x1:x2);
    xind2 = xind - round(mean(x)) + round(center_x);
    
    % if the padding exceeds the image boundaries,
    % clip to image boundary
    yind(yind > size(im_s, 1)) = size(im_s, 1);
    yind(yind < 1) = 1;
    xind(xind > size(im_s, 2)) = size(im_s, 2);
    xind(xind < 1) = 1;
   
    yind2(yind2 > size(im_t, 1)) = size(im_t, 1);
    yind2(yind2 < 1) = 1;
    xind2(xind2 > size(im_t, 2)) = size(im_t, 2);
    xind2(xind2 < 1) = 1;

    y = y - max(y) + round(bottom_y);
    x = x - round(mean(x)) + round(center_x);
    ind = y + (x-1)*size(im_t, 1);
    mask2 = false(size(im_t, 1), size(im_t, 2));
    mask2(ind) = true;
    
    im_s2(yind2, xind2, :) = im_s(yind, xind, :);    
end