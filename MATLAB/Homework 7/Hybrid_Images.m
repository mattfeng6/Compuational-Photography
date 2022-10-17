%{

YOUR COMMENTS:

Please include brief comments here describing the effects and quality of results (3-5 lines),
including how you arrived at good values of low and high frequency cutoffs.
Include anything else about the images you would like to share.

%}

close('all');    % Close all figures so we start with a clean slate

% read images and convert to single format
set1_far = im2double(imread('https://user-images.githubusercontent.com/54331576/193436503-4e128c3a-40fc-47ec-837e-8e8ff9e4892a.jpg')); 		        % "far" picture
set1_near = im2double(imread('https://user-images.githubusercontent.com/54331576/193436483-be6f24f9-466f-4c6f-aba4-07f4947390b1.jpg')); 	    		% "near" picture
% (Optional) convert to grayscale
%set1_far = rgb2gray(set1_far)
%set1_near = rgb2gray(set1_near);


% Uncomment the call to get_points_interactively() to set the corresponding
% points in the two images to establish alignment (e.g., by the eyes).
% The function performs translation, rotation and scaling to align those 
% two points in the two images.
%[x1, y1, x2, y2] = get_points_interactively(set1_near, set1_far);
x1 = [605.1403 758.9682]; y1 = [287.3709 360.6136];
x2 = [303.8974 442.5175]; y2 = [348.1681 332.5175];
[set1_near_aligned, set1_far_aligned] = align_images(set1_near, set1_far, x1, y1, x2, y2);


%% Choose the cutoff frequencies for the low-pass and high-pass filters
cutoff_low  = 12.0;   % provide a value for the low-pass filter cutoff frequency (sigma of gaussian).  CHOOSE CAREFULLY!
cutoff_high = 10.0;   % provide a value for the high-pass filter cutoff frequency (sigma of gaussian).  CHOOSE CAREFULLY!

%% Compute the hybrid image (you supply this code)

set1_hybrid = hybridImage(set1_far_aligned, set1_near_aligned, cutoff_low, cutoff_high);

%% Crop resulting image:  Crop the result to get rid of any unsightly borders areas.
%disp('input crop points (two opposite corners)');
%fig=figure; hold off, imagesc(set2_hybrid), axis image;
%figure(fig)
%[x, y] = ginput(2);  x = round(x); y = round(y);
%close(fig);
% Once you these coordinates, uncomment the lines above, and 
% hard code the values below.
x = [90 680]; y = [370 1160];
set1_hybrid = set1_hybrid(min(y):max(y), min(x):max(x), :);

% Let us try to "simulate" what the hybrid image will look like
% when viewed from afar.  Let us pad a black border around it
% so it effectively shrinks in size when displayed in a montage.
[h, w, ~] = size(set1_hybrid);
viewed_from_afar = padarray(set1_hybrid, max(h, w));
figure; montage({set1_near, set1_far, set1_hybrid, viewed_from_afar}, 'Size', [2,2]);


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% Repeat your method for 5 more sets of images.  But remember that for
% these you must interactively specify the mask and alignment ONE TIME.
%
% Work in the Matlab computer app or the full Matlab Online version
% (https://matlab.mathworks.com) first to get the coordinates for alignment
% and cropping.  Then hard-code these in your program before migrating to
% the Matlab Grader website for submission.
%
% -------------------------------------------------------------------------


set2_far = im2double(imread('https://user-images.githubusercontent.com/54331576/191398643-0b9bded0-a331-4fa8-b7fd-9c3a7d2bcd06.jpg')); 		        % "far" picture
set2_near = im2double(imread('https://user-images.githubusercontent.com/54331576/190544186-65351b22-53db-4c8f-962a-c91e19f4b3cc.jpg')); 	    		% "near" picture
% (Optional) convert images to grayscale
% set2_far = rgb2gray(set2_far);                
% set2_near = rgb2gray(set2_near);


   x1 = 1.0e+03 * [0.7235, 1.0098];
   y1 = [851.1594, 851.1594];
   x2 = [451.5371, 585.8322];
   y2 = [256.9435, 256.0600];

[set2_near_aligned, set2_far_aligned] = align_images(set2_near, set2_far, x1, y1, x2, y2);

% Choose the cutoff frequencies for the low-pass and high-pass filters
% CHOOSE CAREFULLY!  Values will depend on the images used!
cutoff_low  = 13;   % provide a value for the low-pass filter cutoff frequency (sigma of gaussian)
cutoff_high = 10;   % provide a value for the high-pass filter cutoff frequency (sigma of gaussian)


% Compute the hybrid image (you supply this code)
set2_hybrid = hybridImage(set2_far_aligned, set2_near_aligned, cutoff_low, cutoff_high);

x = [117, 901];
y = [234, 947];
set2_hybrid = set2_hybrid(min(y):max(y), min(x):max(x), :);

% Let us try to "simulate" what the hybrid image will look like
% when viewed from afar.  Let us pad a black border around it
% so it effectively shrinks in size when displayed in a montage.
[h, w, ~] = size(set2_hybrid);
viewed_from_afar = padarray(set2_hybrid, max(h, w));
figure; montage({set2_near, set2_far, set2_hybrid, viewed_from_afar}, 'Size', [2,2]);


% REPEAT ABOVE FOR IMAGE SET 3


set2_far = im2double(imread('https://user-images.githubusercontent.com/54331576/193471532-06303767-95f2-4ca4-a48d-6ed181d2946c.jpg')); 		        % "far" picture
set2_near = im2double(imread('https://user-images.githubusercontent.com/54331576/193471416-949ecc05-cb4a-4b84-be14-e5843ef0343c.jpg')); 	    		% "near" picture
% (Optional) convert images to grayscale
% set2_far = rgb2gray(set2_far);                
% set2_near = rgb2gray(set2_near);

x1 = [247.1565 397.6972]; y1 = [776.9960 771.8050];
x2 = [234.6332 933.7353]; y2 = [338.1676 345.7051];

[set2_near_aligned, set2_far_aligned] = align_images(set2_near, set2_far, x1, y1, x2, y2);

% Choose the cutoff frequencies for the low-pass and high-pass filters
% CHOOSE CAREFULLY!  Values will depend on the images used!
cutoff_low  = 15;   % provide a value for the low-pass filter cutoff frequency (sigma of gaussian)
cutoff_high = 10;   % provide a value for the high-pass filter cutoff frequency (sigma of gaussian)


% Compute the hybrid image (you supply this code)
set2_hybrid = hybridImage(set2_far_aligned, set2_near_aligned, cutoff_low, cutoff_high);


x = [3 251]; y = [66 361];
set2_hybrid = set2_hybrid(min(y):max(y), min(x):max(x), :);

% Let us try to "simulate" what the hybrid image will look like
% when viewed from afar.  Let us pad a black border around it
% so it effectively shrinks in size when displayed in a montage.
[h, w, ~] = size(set2_hybrid);
viewed_from_afar = padarray(set2_hybrid, max(h, w));
figure; montage({set2_near, set2_far, set2_hybrid, viewed_from_afar}, 'Size', [2,2]);


% REPEAT ABOVE FOR IMAGE SET 4


set2_far = im2double(imread('https://user-images.githubusercontent.com/54331576/193472261-75feaa11-90e6-425f-a84f-1d83b02e8d76.jpg')); 		        % "far" picture
set2_near = im2double(imread('https://user-images.githubusercontent.com/54331576/193472576-538282e3-06e6-4a58-ab2d-19c775be3ec7.jpg')); 
% "near" picture
% (Optional) convert images to grayscale
% set2_far = rgb2gray(set2_far);                
% set2_near = rgb2gray(set2_near);

x1 = [178.6494 260.8392]; y1 = [180.7443 187.2430];
x2 = [375.3947 582.6398]; y2 = [383.9334 355.2898];

[set2_near_aligned, set2_far_aligned] = align_images(set2_near, set2_far, x1, y1, x2, y2);

% Choose the cutoff frequencies for the low-pass and high-pass filters
% CHOOSE CAREFULLY!  Values will depend on the images used!
cutoff_low  = 50;   % provide a value for the low-pass filter cutoff frequency (sigma of gaussian)
cutoff_high = 20;   % provide a value for the high-pass filter cutoff frequency (sigma of gaussian)


% Compute the hybrid image (you supply this code)
set2_hybrid = hybridImage(set2_far_aligned, set2_near_aligned, cutoff_low, cutoff_high);

x = [122 435]; y = [169 619];
set2_hybrid = set2_hybrid(min(y):max(y), min(x):max(x), :);

% Let us try to "simulate" what the hybrid image will look like
% when viewed from afar.  Let us pad a black border around it
% so it effectively shrinks in size when displayed in a montage.
[h, w, ~] = size(set2_hybrid);
viewed_from_afar = padarray(set2_hybrid, max(h, w));
figure; montage({set2_near, set2_far, set2_hybrid, viewed_from_afar}, 'Size', [2,2]);


% REPEAT ABOVE FOR IMAGE SET 5


set2_far = im2double(imread('https://user-images.githubusercontent.com/54331576/193472261-75feaa11-90e6-425f-a84f-1d83b02e8d76.jpg')); 		        % "far" picture
set2_near = im2double(imread('https://user-images.githubusercontent.com/54331576/193472835-dd988e87-aa74-46c6-abaa-a767b4aae2d2.jpg')); 	    		% "near" picture

% (Optional) convert images to grayscale
% set2_far = rgb2gray(set2_far);                
% set2_near = rgb2gray(set2_near);


x1 = [375.8138 619.3285]; y1 = [429.7887 428.9519];
x2 = [371.2113 587.1109]; y2 = [374.9498 354.8661];

[set2_near_aligned, set2_far_aligned] = align_images(set2_near, set2_far, x1, y1, x2, y2);

% Choose the cutoff frequencies for the low-pass and high-pass filters
% CHOOSE CAREFULLY!  Values will depend on the images used!
cutoff_low  = 15;   % provide a value for the low-pass filter cutoff frequency (sigma of gaussian)
cutoff_high = 10;   % provide a value for the high-pass filter cutoff frequency (sigma of gaussian)


% Compute the hybrid image (you supply this code)
set2_hybrid = hybridImage(set2_far_aligned, set2_near_aligned, cutoff_low, cutoff_high);


x = [137 885]; y = [202 1072];
set2_hybrid = set2_hybrid(min(y):max(y), min(x):max(x), :);

% Let us try to "simulate" what the hybrid image will look like
% when viewed from afar.  Let us pad a black border around it
% so it effectively shrinks in size when displayed in a montage.
[h, w, ~] = size(set2_hybrid);
viewed_from_afar = padarray(set2_hybrid, max(h, w));
figure; montage({set2_near, set2_far, set2_hybrid, viewed_from_afar}, 'Size', [2,2]);


% REPEAT ABOVE FOR IMAGE SET 6


set2_far = im2double(imread('https://user-images.githubusercontent.com/54331576/193479837-60260efe-afe4-4ddb-a99b-a11bf4e3ce66.JPG')); 		        % "far" picture
set2_near = im2double(imread('https://user-images.githubusercontent.com/54331576/193471246-ec1008c4-b258-47b6-961a-2efe811f5aea.jpg')); 	    		% "near" picture
% (Optional) convert images to grayscale
% set2_far = rgb2gray(set2_far);                
% set2_near = rgb2gray(set2_near);

x1 = [550.0191 697.4014]; y1 = 1.0e+03 * [0.9892 1.0097];
x2 = [191.0650 250.3555]; y2 = [942.2083 940.9468];

[set2_near_aligned, set2_far_aligned] = align_images(set2_near, set2_far, x1, y1, x2, y2);

% Choose the cutoff frequencies for the low-pass and high-pass filters
% CHOOSE CAREFULLY!  Values will depend on the images used!
cutoff_low  = 12;   % provide a value for the low-pass filter cutoff frequency (sigma of gaussian)
cutoff_high = 10;   % provide a value for the high-pass filter cutoff frequency (sigma of gaussian)


% Compute the hybrid image (you supply this code)
set2_hybrid = hybridImage(set2_far_aligned, set2_near_aligned, cutoff_low, cutoff_high);


x = [108 599]; y = [216 921];
set2_hybrid = set2_hybrid(min(y):max(y), min(x):max(x), :);

% Let us try to "simulate" what the hybrid image will look like
% when viewed from afar.  Let us pad a black border around it
% so it effectively shrinks in size when displayed in a montage.
[h, w, ~] = size(set2_hybrid);
viewed_from_afar = padarray(set2_hybrid, max(h, w));
figure; montage({set2_near, set2_far, set2_hybrid, viewed_from_afar}, 'Size', [2,2]);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your function appears below 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function im12 = hybridImage(im1, im2, cutoff_low, cutoff_high)
    
im1_fft = fftshift(fft2(im1));
[h1, w1, ~] = size(im1_fft);
im1_filter = rescale(fspecial('gaussian', [h1, w1], cutoff_low));
low_pass = im1_fft .* im1_filter;

im2_fft = fftshift(fft2(im2));
[h2, w2, ~] = size(im2_fft);
im2_filter = rescale(fspecial('gaussian', [h2, w2], cutoff_high));
high_pass = im2_fft .* (1 - im2_filter);

hybrid = low_pass + high_pass;
im12 = real(ifft2(ifftshift(hybrid)));
    
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Helper functions. (You DO NOT need to change)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x1, y1, x2, y2] = get_points_interactively(im1, im2)
    % displays image and gets two points from the user
    fig=figure; hold off, imagesc(im1), axis image;
    disp('Select two points from each image define rotation, scale, translation')
    figure(fig)
    [x1, y1] = ginput(2);
    figure(fig); hold off, imagesc(im2), axis image;
    figure(fig)
    [x2, y2] = ginput(2);
    close(fig);
end

function [im1, im2] = align_images(im1, im2, x1, y1, x2, y2)
    % Aligns im1 and im2 (translation, scale, rotation) after getting two pairs
    % of points from the user.  In the output of im1 and im2, the two pairs of
    % points will have approximately the same coordinates.
    
    % get image sizes
    [h1, w1, ~] = size(im1);
    [h2, w2, ~] = size(im2);
    
    cx1 = mean(x1); cy1 = mean(y1);
    cx2 = mean(x2); cy2 = mean(y2);
    
    % translate first so that center of ref points is center of image
    tx = round((w1/2-cx1)*2);
    if tx > 0,  im1 = padarray(im1, [0 tx], 'pre');
    else        im1 = padarray(im1, [0 -tx], 'post');
    end
    ty = round((h1/2-cy1)*2);
    if ty > 0,  im1 = padarray(im1, [ty 0], 'pre');
    else        im1 = padarray(im1, [-ty 0], 'post');
    end  
    tx = round((w2/2-cx2)*2) ;
    if tx > 0,  im2 = padarray(im2, [0 tx], 'pre');
    else        im2 = padarray(im2, [0 -tx], 'post');
    end
    ty = round((h2/2-cy2)*2);
    if ty > 0,  im2 = padarray(im2, [ty 0], 'pre');
    else        im2 = padarray(im2, [-ty 0], 'post');
    end
    
    % downscale larger image so that lengths between ref points are the same
    len1 = sqrt((y1(2)-y1(1)).^2+(x1(2)-x1(1)).^2);
    len2 = sqrt((y2(2)-y2(1)).^2+(x2(2)-x2(1)).^2);
    dscale = len2 ./ len1;
    if dscale < 1
        im1 = imresize(im1, dscale, 'bilinear'); 
    else
        im2 = imresize(im2, 1./dscale, 'bilinear');
    end
    
    % rotate im1 so that angle between points is the same
    theta1 = atan2(-(y1(2)-y1(1)), x1(2)-x1(1)); % in matlab, y==1 is at the top of the N x M image, and y==N is at the bottom
    theta2 = atan2(-(y2(2)-y2(1)), x2(2)-x2(1));
    dtheta = theta2-theta1;
    im1 = imrotate(im1, dtheta*180/pi, 'bilinear'); % imrotate uses degree units
    
    % Crop images (on both sides of border) to be same height and width
    [h1, w1, ~] = size(im1);
    [h2, w2, ~] = size(im2);
    
    minw = min(w1, w2);
    brd = (max(w1, w2)-minw)/2;
    if minw == w1 % crop w2
        im2 = im2(:, (ceil(brd)+1):end-floor(brd), :);
        tx = tx-ceil(brd);
    else
        im1 = im1(:, (ceil(brd)+1):end-floor(brd), :);
        tx = tx+ceil(brd);    
    end
    
    minh = min(h1, h2);
    brd = (max(h1, h2)-minh)/2;
    if minh == h1 % crop w2
        im2 = im2((ceil(brd)+1):end-floor(brd), :, :);
        ty = ty-ceil(brd);
    else
        im1 = im1((ceil(brd)+1):end-floor(brd), :, :);
        ty = ty+ceil(brd);    
    end    
end
