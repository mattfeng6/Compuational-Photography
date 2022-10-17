close('all');   % close all open figures so we start with a clean slate!

im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191289250-a43c28a1-e8ee-49b2-aa87-96e1084d5bf7.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191289143-d8878fb8-f557-416c-997d-b5df62cf73ee.jpg'));       % source image

% Get source region mask (extracted object) from the user
% First draw a polygon on the source image for applying the mask

% [poly_x, poly_y] = getPolygonForMask(im_obj);

% NOTE: For your own image sets, simply uncomment the call to getPolygonForMask(), and
% DO NOT USE the hard-coded polygon coordinates below!
poly_x = [276.4628  324.9961  391.5884  425.4488  453.6659  457.0519  433.3496 442.3791 ...
    441.2504  348.6984  248.2457  222.2860  238.0876  226.8008  222.2860  214.3853  224.5434  248.2457];
poly_y = [255.3512  238.4209  255.3512  250.8364  260.9946  283.5682  329.8442  349.0318 ...
    404.3372  419.0101  404.3372  356.9326  342.2597  308.3992  292.5977  265.5093  250.8364  247.4504];

% Convert polygon to a binary mask
objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

% Next, align the source object (im_s) and mask (mask_s) with the background image.  
% Get the bottom center location on the target image by using the function
% getBottomCenterLoc interactively

% [center_x, bottom_y] = getBottomCenterLoc(im_bg);

% NOTE: For your own image sets, simply uncomment the call to getBottomCenterLoc(), and
% DO NOT USE the hard-coded alignment coordinates below!
center_x = 575.9264;
bottom_y = 432.4922;

% Translate both the source image and the object mask for proper alignment
% w.r.t. the background image
% Pad the extracted object by 64 pixels each side to allow for feathering/blending overlap.

padding = 64;
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);  % convert mask from binary to double

% Call the function to blend the images using the mask
result1 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% Repeat your method for 4 more sets of images.  But remember that for
% these you must interactively specify the mask and alignment ONE TIME.
%
% The Matlab Grader website does not allow interactive code.  Therefore,
% you must first develop and run your code either in the Matlab computer
% app, or in the full Matlab Online version (https://matlab.mathworks.com).
% Both of those version allow interactive code, which will allow you to
% specify a mask for object selection and an alignment point in the
% target/background image.
%
% Once you are satisfied with your choice of mask and alignment, copy the
% values of the poly_x and poly_y vectors (which define the vertices of the
% polygon mask), and the values of center_x and bottom_y (which specify the
% alignment) from the output of the Command Window.  Then, hard-code these
% values into your code below, just like it was done for the first image
% set above.
%
% There are two reasons for hard-coding these values.  First, it avoids the
% need to repeatedly interact with the tool to specify the mask and
% alignment while you are fine tuning the blending algorithm.  Second, you
% will be submitting your final work on the Matlab Grader website which
% does not allow interactive code.
%
% -------------------------------------------------------------------------


%%%%% your own images
im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191298324-b764e3d5-df2e-4027-960a-9fc67b509a6a.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191298623-8b3a14a4-87f8-404b-9e12-58df3e3a722a.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

% Get source region mask (extracted object) from the user
%  First draw a polygon on the source image for applying the mask

% [poly_x, poly_y] = getPolygonForMask(im_obj);
% disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% poly_x        % display x coords of polygon
% poly_y        % display y coords of polygon
% Once you have these coordinates, comment out the call to getPolygonForMask() 
% and hard code the coordinates instead.

poly_x = 1.0e+03 * [1.3112    1.3873    1.4761    1.5395    1.4761    1.6663    1.9073    2.0024    2.0404    1.9897    1.9200    1.8058    1.6917    1.5141    1.2985    1.3049];
poly_y = 1.0e+03 * [0.3334    0.3778    0.2763    0.3080    0.3968    0.5110    0.7202    0.9358    1.1958    1.4494    1.5953    1.7728    1.8933    1.9694    2.0201    0.3271];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));
 
% % Get the bottom center location on the target image by using the function
% % getBottomCenterLoc interactively

% [center_x, bottom_y] = getBottomCenterLoc(im_bg);
% disp("Copy the values of center_x and bottom_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% center_x        % display x coord where center of object should be placed
% bottom_y        % display y coord where bottom of object should be placed
% Once you have these coordinates, comment out the call to getBottomCenterLoc()
% and hard code the coordinates instead.

center_x = 1.6464e+03;
bottom_y = 1.9884e+03;

padding = 32;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result2 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result2});


% REPEAT ABOVE FOR IMAGE SET 3

im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191395725-07c121b5-bf34-498f-9a71-f534dc2641a3.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191397546-93ce077d-14ea-4c4c-bd09-d76480516b24.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

% [poly_x, poly_y] = getPolygonForMask(im_obj);
% disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% poly_x        % display x coords of polygon
% poly_y        % display y coords of polygon

poly_x = [233.5816  205.6633  174.8061  157.1735  141.0102  167.4592  198.3163  221.8265  232.1122];
poly_y = [227.5204  237.8061  240.7449  233.3980  223.1122  211.3571  206.9490  215.7653  227.5204];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

% [center_x, bottom_y] = getBottomCenterLoc(im_bg);
% disp("Copy the values of center_x and bottom_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% center_x        % display x coord where center of object should be placed
% bottom_y        % display y coord where bottom of object should be placed

center_x = 252.6837;
bottom_y = 340.0918;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result3 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result3});


% REPEAT ABOVE FOR IMAGE SET 4

im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/190544877-30dd8f38-b60d-4a63-8d24-36ae4179f003.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191398643-0b9bded0-a331-4fa8-b7fd-9c3a7d2bcd06.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

% [poly_x, poly_y] = getPolygonForMask(im_obj);
% disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% poly_x        % display x coords of polygon
% poly_y        % display y coords of polygon

poly_x = [472.0067  511.8137  546.1300  577.7011  562.6019  540.6394  514.5590  482.9879  456.9075  444.5536  472.0067];
poly_y = [361.6957  360.3231  358.9504  375.4223  405.6206  417.9745  426.2105  420.7198  398.7574  378.1676  363.0684];


objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

% [center_x, bottom_y] = getBottomCenterLoc(im_bg);
% disp("Copy the values of center_x and bottom_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% center_x        % display x coord where center of object should be placed
% bottom_y        % display y coord where bottom of object should be placed

center_x = 829.8456;
bottom_y = 477.9562;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result4 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result4});


% REPEAT ABOVE FOR IMAGE SET 5

im_bg = im2double(imread('https://user-images.githubusercontent.com/54331576/191400680-ec0ed8d8-e1f1-498f-b4c7-2a959a8f482a.jpg'));        % background image
im_obj = im2double(imread('https://user-images.githubusercontent.com/54331576/191400561-8ac9520b-f341-4f2a-8148-934355f044cf.jpg'));       % source image

% resize the image
[h w ~] = size(im_obj);
im_bg = imresize(im_bg, [h w]);

% [poly_x, poly_y] = getPolygonForMask(im_obj);
% disp("Copy the values of the vectors poly_x and poly_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% poly_x        % display x coords of polygon
% poly_y        % display y coords of polygon

poly_x = 1.0e+03 * [1.3649    1.4567    1.5158    1.4928    1.5880    1.6142    1.6995    1.6470    1.5847    1.6109    1.5289    1.4141    1.3550 ...
        1.4206    1.4108    1.3878    1.4403    1.4010    1.3977    1.3616    1.2861    1.2960    1.2796    1.2828    1.3288    1.3681];

poly_y = 1.0e+03 * [1.7737    1.7934    1.8820    1.9673    2.0263    2.0887    2.2658    2.3675    2.4200    2.4922    2.5381    2.5972    2.5677 ...
        2.5316    2.4332    2.2757    2.2297    2.1346    2.0788    2.1215    2.0920    2.0263    1.9640    1.8984    1.8459    1.7770];

objmask = poly2mask(poly_x, poly_y, size(im_obj, 1), size(im_obj, 2));

% 
% [center_x, bottom_y] = getBottomCenterLoc(im_bg);
% disp("Copy the values of center_x and bottom_y from the " + ...
%     "Command Window below and hard code them inside your code for " + ...
%     "submission via the Grader website.");
% center_x        % display x coord where center of object should be placed
% bottom_y        % display y coord where bottom of object should be placed

center_x = 1.7373e+03;
bottom_y = 3.5098e+03;

padding = 64;   % You may want to play with this parameter
[im_s, mask_s] = alignSource(im_obj, objmask, im_bg, center_x, bottom_y, padding);
mask_s = im2double(mask_s);

% % Apply your blending method
result5 = cut_and_paste(im_bg, im_s, mask_s);

% Display:  target image, source image, mask, then blended result
figure; montage({im_bg, im_obj, mask_s, result5});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is your function that implements the blending method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function im_cut_and_paste = cut_and_paste(im_bg, im_s, mask_s)

    im_cut_and_paste = im_s .* mask_s + im_bg .* (1-mask_s);

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below are helper functions.  You DO NOT NEED TO MODIFY
% any of the code below.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [poly_x, poly_y] = getPolygonForMask(im)
    % Asks user to draw polygon around input image.  
    disp('Draw polygon around source object in clockwise order, q to stop');
    fig=figure; hold off; imagesc(im); axis image;
    poly_x = [];
    poly_y = [];
    while 1
        figure(fig)
        [x, y, b] = ginput(1);
        if b=='q'
            break;
        end
        poly_x(end+1) = x;
        poly_y(end+1) = y;
        hold on; plot(poly_x, poly_y, '*-');
    end
    close(fig);
end


function [center_x, bottom_y] = getBottomCenterLoc(im_t)
    disp('choose target bottom-center location');
    fig=figure; hold off; imagesc(im_t); axis image;
    figure(fig)
    [center_x, bottom_y, ~] = ginput(1);
    close(fig);
end


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
