%{

YOUR COMMENTS:

Please include brief comments here describing the effects and quality of
results (3-5 lines).  Include anything else about the images you would like
to share.

(Optional) Also mention if you obtained more compelling results by using a 
different filter shape than a disk.

%}

close('all');   % close all open figures so we start with a clean slate!

I=im2double(imread('https://user-images.githubusercontent.com/54331576/192126785-b77beb0e-0f7c-4a1a-8481-29f78a873720.jpg'));

% Get foreground mask (part that stays sharp) from the user

% For the given image, a mask is provided as an image
mask = im2double(imread('https://user-images.githubusercontent.com/54331576/192126791-9df4106d-63e3-4883-adf5-ee3ec2ebc1fb.png'));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 15;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result1a = method1(I, mask, bokeh_shape);
result1b = method2(I, mask, bokeh_shape);
result1 = method3(I, mask, bokeh_shape);

figure; montage({I, result1a, result1b, result1});


%%
% -------------------------------------------------------------------------
% IMPORTANT NOTE (please read carefully)
% -------------------------------------------------------------------------
% Repeat your method for 5 more sets of images.  But remember that for
% these you must interactively specify the mask ONE TIME.
%
% Work in the Matlab computer app or the full Matlab Online version
% (https://matlab.mathworks.com) first to get the coordinates for alignment
% and cropping.  Then hard-code these in your program before migrating to
% the Matlab Grader website for submission.
%
% -------------------------------------------------------------------------


I=im2double(imread('https://user-images.githubusercontent.com/54331576/191400680-ec0ed8d8-e1f1-498f-b4c7-2a959a8f482a.jpg'));

poly_x = 1.0e+03 * [0.0072    0.1405    0.3245    0.5832    0.8898    1.0872    1.2178    1.3325    1.4498    1.4232    1.3538    1.5352    1.5858    1.4765    1.3592    1.1512    1.1805    1.0712    0.9245    0.7512    0.6285    0.5138    0.3752    0.1485    0.0632    0.0018    0.0072];
poly_y = 1.0e+03 * [1.9378    1.7778    1.7458    1.7378    1.8232    1.9512    2.1245    2.4285    2.5565    2.6525    2.7085    2.8018    2.8632    3.0685    3.1058    3.0738    3.3378    3.5458    3.6258    3.6445    3.5512    3.3778    3.6392    3.7965    3.8018    3.7832    1.9352];

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 15;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result2 = method3(I, mask, bokeh_shape);

figure; montage({I, result2});



% REPEAT ABOVE FOR IMAGE 3


I=im2double(imread('https://user-images.githubusercontent.com/54331576/190536592-0547b667-1c03-4d7e-bfa4-ed64ba69d653.jpg'));

poly_x = 1.0e+03 * [3.0183    2.1099    1.5502    1.4930    1.4643    1.4617    1.8444    1.9016    1.2821    1.2561    1.3134    1.6413    1.6648    1.7090    1.9589    3.0157    3.0183];
poly_y = 1.0e+03 * [3.5913    2.7870    3.5080    3.5028    3.4716    3.4377    2.8755    2.6048    2.0503    1.7744    1.7276    1.9801    1.9566    1.9879    1.7718    2.5241    3.5913];

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 15;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result3 = method3(I, mask, bokeh_shape);

figure; montage({I, result3});

% REPEAT ABOVE FOR IMAGE 4


I=im2double(imread('https://user-images.githubusercontent.com/54331576/193166715-34ca7d95-2579-4f59-a272-94c673620d98.jpg'));

poly_x = 1.0e+03 * [1.6707    1.1962    0.7383    0.6689    0.7355    0.9603    1.2683    1.4154    1.6707    1.8705    2.1868    2.2035    2.1757    2.1646    2.2035    2.1840    2.1813    1.9842    1.8566    1.6818];
poly_y = 1.0e+03 * [2.6214    2.5299    2.5743    1.9860    1.7695    1.5559    1.4671    1.4643    1.3616    1.3921    1.5420    1.6585    1.7196    1.8361    1.9499    2.2024    2.2940    2.5215    2.4910    2.6242];

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 15;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result4 = method3(I, mask, bokeh_shape);

figure; montage({I, result4});

% REPEAT ABOVE FOR IMAGE 5

I=im2double(imread('https://user-images.githubusercontent.com/54331576/190544877-30dd8f38-b60d-4a63-8d24-36ae4179f003.jpg'));

% Interactively draw the foreground mask as a polygon

poly_x = 1.0e+03 * [1.1330    1.1317    1.1090    1.1292    1.1885    1.1519    1.1216    1.0762    1.0724    1.1229    1.1431    1.1696    1.2466    1.2402    1.2062    1.2024    1.2276    1.2781    1.3096    1.3084    1.2756    1.2768    1.3551    1.4043    1.4434    1.4093    1.3538    1.4396    1.4434    1.4939    1.4724    1.4484    1.4283    1.4585    1.1355];
poly_y = [780.5126  732.5631  685.8754  600.0710  515.5284  475.1498  480.1972  423.4148  340.1341  356.5379  297.2319  269.4716  237.9259  203.8565  173.5726  130.6703   99.1246   92.8155  124.3612  164.7397  210.1656  232.8785  256.8533  338.8722  323.7303  471.3644  507.9574  571.0489  607.6420  675.7808  699.7555  708.5883  702.2792  780.5126  780.5126];

mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 3;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result5 = method3(I, mask, bokeh_shape);

figure; montage({I, result5});


% REPEAT ABOVE FOR IMAGE 6


I=im2double(imread('https://user-images.githubusercontent.com/54331576/193168647-47290080-5e43-4e1e-b6bd-1f6615395c7e.jpg'));

% Interactively draw the foreground mask as a polygon

poly_x = [602.5079  657.5038  697.4412  681.0734  683.0375  578.9383  575.6647  582.8666  567.8082  601.8532];
poly_y = [187.3203  197.7957  183.3920  227.9124  275.7064  280.9441  233.8048  212.8540  179.4637  187.9750];


mask = poly2mask(poly_x, poly_y, size(I, 1), size(I, 2));

% Define the bokeh filter shape
% A simple disk filter is provided as default
% For extra credit you may optionally define a different shape, e.g., hexagon, starburst, heart etc.

radius = 5;            % choose this carefully for each image
bokeh_shape = fspecial('disk', radius);

result6 = method3(I, mask, bokeh_shape);

figure; montage({I, result6});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This are the functions that implement bokeh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = method1(I, mask, filter)
    I_blur = imfilter(I, filter, 'replicate');
    result = I_blur .* (1 - mask) + I .* mask;
end

function result = method2(I, mask, filter)
    bg = I .* (1 - mask);
    bg_blur = imfilter(bg, filter, 'replicate');
    result = bg_blur .* (1 - mask) + I .* mask;
end

function result = method3(I, mask, filter)
   
    bg = I .* (1 - mask);
    bg_blur = imfilter(bg, filter, 'replicate');
    
    com = 1 - mask;
    com_blur = imfilter(com, filter, 'replicate');
    
    output = bg_blur ./ com_blur;
    output(isnan(output)) = 0;
    result = output .* (1 - mask) + I .* mask;
    

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