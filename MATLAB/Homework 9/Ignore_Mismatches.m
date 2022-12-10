close all;

URL_prefix = "https://www.cs.unc.edu/~montek/teaching/Comp572-Fall22/hw9/";
images  = [ "camel.jpg"; "cathedral.jpg"; "chapel.jpg"; "courtyard.jpg"; "emir.jpg"; ...
            "gruppa.jpg"; "khan.jpg"; "monastery.jpg"; "nativity.jpg"; "railroad.jpg"; ...
            "settlers.jpg"; "urn.jpg" ];
imagecount = size(images, 1);

for i=1:imagecount
    I=imread(URL_prefix + images(i));
    aligned_I = align_better(I);
    figure; imshow(aligned_I);
end


function aligned = align_better(im)
    
    [h w] = size(im);
    h = floor(h/3);
    blue = imcrop(im, [1 1 w-1 h-1]);
    green = imcrop(im, [1 h+1 w-1 h-1]);
    red = imcrop(im, [1 2*h+1 w-1 h-1]);

    [h_b w_b] = size(blue);
    [h_g w_g] = size(green);
    [h_r w_r] = size(red);

    blue = imcrop(blue, [w_b/10 h_b/10 w_b*4/5 h_b*4/5]);
    green = imcrop(green, [w_g/10 h_g/10 w_g*4/5 h_g*4/5]);
    red = imcrop(red, [w_r/10 h_r/10 w_r*4/5 h_r*4/5]);

    [h_b w_b] = size(blue);
    ncc1 = normxcorr2(blue, green);
    [y1_top, x1_top] = find(ncc1 == max(ncc1(:)));
    y1_move = y1_top - h_b;
    x1_move = x1_top - w_b;

    if y1_move > 30
        y1_move = 30;
    elseif y1_move < -30
        y1_move = -30;
    end

    if x1_move > 30
        x1_move = 30;
    elseif x1_move < -30
        x1_move = -30;
    end

    basic_blue = imtranslate(blue, [x1_move, y1_move]);

    [h_r w_r] = size(blue);
    ncc2 = normxcorr2(red, green);
    [y2_top, x2_top] = find(ncc2 == max(ncc2(:)));
    y2_move = y2_top - h_r;
    x2_move = x2_top - w_r;

    if y2_move > 30
        y2_move = 30;
    elseif y2_move < -30
        y2_move = -30;
    end

    if x2_move > 30
        x2_move = 30;
    elseif x2_move < -30
        x2_move = -30;
    end

    basic_red = imtranslate(red, [x2_move, y2_move]);

    aligned = cat(3, basic_red, green, basic_blue);

end