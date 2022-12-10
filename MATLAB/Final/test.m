close all;
%{
For the energy function I used the gradient magnitude approach mentioned in
HW4. The idea is that only pixels with gradient magnitude would get
selected for edge image. So I first use a Gaussian blur filter with sigma=1
to help neglect insignificant details and then applied Sobel filter on the
blurred image to compute individual gradients on both x and y direction.
Then, the total gradient can be calculated by using pythagoras theorem.
What is specifically challenging is to correctly record the minimum amount
energy needed to get to a specific pixel(Energy Map) and identifying the direction of
backtrace accordingly. I started with bottom-to-up approach for vertical
carving, yet the effect is not ideal compared with the top-to-bottom
dynamic approach because important features in the image get removed much.
This failure is probably because of inncorrect direction for backtracing,
so the seam identified for removal is not entirely correct.
In particular, I added a small function to illustrate each seam identified
in red color. By including it in the carving function that gets looped each time,
I was able to create a dynamic video illustrating the shrinking of image and the corresponding
next seam to be removed. This also helped a lot in my debugging progress.
%}
%input Image 1
I = imread('https://user-images.githubusercontent.com/59798959/165596358-8501cc32-8b52-40ab-9a45-b754eb141ab2.jpg');
I = imresize(I,0.25);

%find energy of image of input image using gradient magnitude
energyImg = convertToEnergy(I);

%find the minimum energy map using dynamic programming concept similar to shortest path problem  
minEnergyMap=find_minimumEnergyMap(energyImg,'VERTICAL');
minEnergyMap2=find_minimumEnergyMap(energyImg,'HORIZONTAL');


verticalSeam=find_verticalSeam(minEnergyMap);
seamDisplayed=showSeam(I,verticalSeam,'VERTICAL');

horizontalSeam=find_horizontalSeam(minEnergyMap2);
seamDisplayed2=showSeam(I,horizontalSeam,'HORIZONTAL');

resultImage=I;
resultEnergyImage=energyImg;
for i = 1:100
   [resultImage,resultEnergyImage] = carveHorizontal(resultImage,resultEnergyImage);
end

resultImage2=I;
resultEnergyImage2=energyImg;
for i = 1:60
   [resultImage2,resultEnergyImage2] = carveVertical(resultImage2,resultEnergyImage2);
end

imshow(resultEnergyImage)

%Display output
figure(1);subplot(2,2,1);imshow(energyImg);
title('Energy of Image');
subplot(2,2,2);imshow(minEnergyMap,[min(minEnergyMap(:)), max(minEnergyMap(:))]);
title('Energy Map for Horizontal Carve');
subplot(2,2,3.5);imshow(seamDisplayed,[min(seamDisplayed(:)) max(seamDisplayed(:))]);
title('Vertical Seams to be removed...');

figure(2);subplot(1,2,1);imshow(I);
title('Original Picture');
subplot(1,2,2);imshow(resultImage);
title('Result (reduced 100 width)');

figure(4);subplot(2,2,1);imshow(energyImg);
title('Energy of Image');
subplot(2,2,2);imshow(minEnergyMap2,[min(minEnergyMap2(:)), max(minEnergyMap2(:))]);
title('Energy Map for Vertical Carve');
subplot(2,2,3.5);imshow(seamDisplayed2,[min(seamDisplayed2(:)) max(seamDisplayed2(:))]);
title('Horizontal Seams to be removed...');

figure(5);subplot(1,2,1);imshow(I);
title('Original Picture');
subplot(1,2,2);imshow(resultImage2);
title('Result (reduced 60 height)');

%second picture: Italy Venice
%//source:https://unsplash.com/photos/hFXZ5cNfkOk
I = imread('https://user-images.githubusercontent.com/59798959/155406496-751a765d-ec8a-4b5a-be80-814882b390e2.jpg');
I = imresize(I,0.25);
%size(I);

energyImg = convertToEnergy(I);
minEnergyMap=find_minimumEnergyMap(energyImg,'HORIZONTAL');
horizontalSeam=find_horizontalSeam(minEnergyMap);
seamDisplayed=showSeam(I,horizontalSeam,'HORIZONTAL');

resultImage=I;
resultEnergyImage=energyImg;
    for i = 1:150
       [resultImage,resultEnergyImage] = carveVertical(resultImage,resultEnergyImage);
    end
%Display output
figure(6);subplot(2,2,1);imshow(energyImg);
title('Energy of Image');
subplot(2,2,2);imshow(minEnergyMap,[min(minEnergyMap(:)), max(minEnergyMap(:))]);
title('Energy Map for Vertical Carve');
subplot(2,2,3.5);imshow(seamDisplayed,[min(seamDisplayed(:)) max(seamDisplayed(:))]);
title('Horizontal Seams to be removed...');

figure(7);subplot(1,2,1);imshow(I);
title('Original Picture');
subplot(1,2,2);imshow(resultImage);
title('Result (reduced 150 height)');


%//third picture: the Melting Clock painting
%//source: https://www.wallpaperflare.com/the-persistence-of-memory-by-salvador-dali-artwork-painting-wallpaper-tgqwp
I = imread('https://user-images.githubusercontent.com/59798959/165026085-1f30067b-0fa3-43a2-b666-7a40486758e1.jpg');
I = imresize(I,0.25);
%size(I);

energyImg = convertToEnergy(I);
minEnergyMap=find_minimumEnergyMap(energyImg,'VERTICAL');
verticalSeam=find_verticalSeam(minEnergyMap);
seamDisplayed=showSeam(I,verticalSeam,'VERTICAL');

resultImage=I;
resultEnergyImage=energyImg;
    for i = 1:100
       [resultImage,resultEnergyImage] = carveHorizontal(resultImage,resultEnergyImage);
    end
%Display output
figure(8);subplot(2,2,1);imshow(energyImg);
title('Energy of Image');
subplot(2,2,2);imshow(minEnergyMap,[min(minEnergyMap(:)), max(minEnergyMap(:))]);
title('Energy Map for Horizontal Carve');
subplot(2,2,3.5);imshow(seamDisplayed,[min(seamDisplayed(:)) max(seamDisplayed(:))]);
title('Vertical Seams to be removed...');

figure(9);subplot(1,2,1);imshow(I);
title('Original Picture');
subplot(1,2,2);imshow(resultImage);
title('Result (reduced 100 width)');

%//fourth picture: The Man's face
%//source:https://unsplash.com/photos/g_0aZYewvyg
I = imread('https://user-images.githubusercontent.com/59798959/155408324-fa3bad7a-e55d-435f-9628-a65b6dc77f95.jpg');
I = imresize(I,0.25);
%size(I);
energyImg = convertToEnergy(I);
minEnergyMap=find_minimumEnergyMap(energyImg,'VERTICAL');
verticalSeam=find_verticalSeam(minEnergyMap);
seamDisplayed=showSeam(I,verticalSeam,'VERTICAL');

resultImage=I;
resultEnergyImage=energyImg;
    for i = 1:100
       [resultImage,resultEnergyImage] = carveHorizontal(resultImage,resultEnergyImage);
    end
%Display output
figure(10);subplot(2,2,1);imshow(energyImg);
title('Energy of Image');
subplot(2,2,2);imshow(minEnergyMap,[min(minEnergyMap(:)), max(minEnergyMap(:))]);
title('Energy Map for Horizontal Carve');
subplot(2,2,3.5);imshow(seamDisplayed,[min(seamDisplayed(:)) max(seamDisplayed(:))]);
title('Vertical Seams to be removed...');

figure(11);subplot(1,2,1);imshow(I);
title('Original Picture');
subplot(1,2,2);imshow(resultImage);
title('Result (reduced 100 width)');

%Fifth picture: Dinner at Sea
%//Source: https://unsplash.com/photos/wX1YwLy5yCM
I = imread('https://user-images.githubusercontent.com/59798959/155409285-fde86feb-ab51-4eec-84d5-74ec57eb7ca3.jpg');
I = imresize(I,0.25);
%size(I);

energyImg = convertToEnergy(I);
minEnergyMap=find_minimumEnergyMap(energyImg,'HORIZONTAL');

horizontalSeam=find_horizontalSeam(minEnergyMap);
seamDisplayed=showSeam(I,horizontalSeam,'HORIZONTAL');

resultImage=I;
resultEnergyImage=energyImg;
    for i = 1:75
       [resultImage,resultEnergyImage] = carveVertical(resultImage,resultEnergyImage);
    end
figure(12);subplot(2,2,1);imshow(energyImg);
title('Energy of Image');
subplot(2,2,2);imshow(minEnergyMap,[min(minEnergyMap(:)), max(minEnergyMap(:))]);
title('Energy Map for Vertical Carve');
subplot(2,2,3.5);imshow(seamDisplayed,[min(seamDisplayed(:)) max(seamDisplayed(:))]);
title('Horizontal Seams to be removed...');

figure(13);subplot(1,2,1);imshow(I);
title('Original Picture');
subplot(1,2,2);imshow(resultImage);
title('Result (reduced 75 height)');


function energyImage = convertToEnergy(img) 
    % Energy function is used to determine importance of each pixel
    % I used the idea of creating edged image using gradient magnitude method

    img=rgb2gray(im2double(img));   % Convert image to gray scale
    gauss=imgaussfilt(img,1);       % Apply Gaussian filter with sigma=1 for a smooth
    Sx=fspecial('sobel');           % Create sobel filter for x direction
    Sy=Sx';                         % Create sobel filter for y direction
    gradX=imfilter(gauss,Sx,'replicate');    % Calculate gradient of X                      
    gradY=imfilter(gauss,Sy,'replicate');    % Calculate gradient of Y  
    %figure; imshow(abs(gradX));
    %figure; imshow(abs(gradY));
    energyImage=sqrt(gradX.*gradX+gradY.*gradY);    %Derive energy of image using gradient magnitude
        
    %threshold= prctile(grad_total,85,'all');
    %energyImage=1*(grad_total>=threshold)+0*(grad_total<threshold);
    %imshow(energyImage);
end


function [seamedImage,seamedEnergyImage] = carveHorizontal(im, energyImage)
    minEnergyMap = find_minimumEnergyMap(energyImage, 'VERTICAL');  %get minimum energymap
    %find best seam to remove by backtracking from bottom to top row of minimum energy map
    verticalSeam = find_verticalSeam(minEnergyMap);  
    
    %//Display seam path removed at each function call
    %seamCurrent=showSeam(im,verticalSeam,'VERTICAL'); %Display seam purpose
    %figure(3);imshow(seamCurrent,[min(seamCurrent(:)) max(seamCurrent(:))]);
    
    %remove the identified vertical seam pixel by pixel
    vSeam_length=size(verticalSeam,1);
        for i=1:vSeam_length
            im(i,verticalSeam(i,1):end-1,:)=im(i,verticalSeam(i,1)+1:end,:);
        end
    seamedImage=im(:,1:end-1,:); % New image created with the specific seam removed
    seamedEnergyImage=convertToEnergy(seamedImage);   % New energy image
end



function [seamedImage,seamedEnergyImage] = carveVertical(im, energyImage)
    minEnergyMap = find_minimumEnergyMap(energyImage, 'HORIZONTAL');  %get minimum energymap
    %find best seam to remove by backtracking from bottom to top row of minimum energy map
    horizontalSeam = find_horizontalSeam(minEnergyMap);  
    
    %//Display seam path removed at each function call
    %seamCurrent=showSeam(im,horizontalSeam,'HORIZONTAL'); %Display seam purpose
    %figure(3);imshow(seamCurrent,[min(seamCurrent(:)) max(seamCurrent(:))]);
    
    %remove the identified horizontal seam pixel by pixel
    hSeam_length=size(horizontalSeam,2);
        for i=1:hSeam_length
            im(horizontalSeam(i):end-1,i,:)=im(horizontalSeam(i)+1:end,i,:);
        end
    seamedImage=im(1:end-1,:,:); % New image created with the specific seam removed
    seamedEnergyImage=convertToEnergy(seamedImage);   % New energy image
end



function minEnergyMap = find_minimumEnergyMap(energyImage,seamType)
     %{
        %//method working energy map from bottom to up but failed
        [rows,columns]=size(energyImg);
        Map(end,:)=energyImg(end,:);
        next_elements=zeros(size(energyImg));
        for i=rows-1:-1:1
            for j=1:columns
                left=max(1,j-1);
                right=min(j+1,columns);
                local_energy=min(Map(i+1,left:right));
                Map(i,j)=local_energy+energyImg(i,j);
            end
            if left==1 //account boundary issues
                next_elements(i,j)=next_elements(i,j)+1;
            end
        end
     %}

    %//method of working from top to bottom, better results
    Map=zeros(size(energyImage));     %Create an empty Map
    if strcmp('VERTICAL',seamType)    %Identify the type of seam (e.g. horizontal seam for vertical carving)
      [rows, cols]=size(energyImage);     
       Map(1,:)=energyImage(1,:);
        for i=2:rows
            for j=1:cols
                if j==1
                    Map(i,j)= energyImage(i,j)+min([Map(i-1,j),Map(i-1,j+1)]); 
                elseif j==cols
                    Map(i,j)= energyImage(i,j)+min([Map(i-1,j-1),Map(i-1,j)]);
                else
                    Map(i,j)= energyImage(i,j)+min([Map(i-1,j-1),Map(i-1,j),Map(i-1,j+1)]);
                end
            end
        end
    elseif strcmp('HORIZONTAL',seamType)
    [rows, cols]=size(energyImage);
    Map(:,1)=energyImage(:,1);
        for i=2:cols
            for j=1:rows
                %Map(j,i)=energyImg(j,i)+min(Map(j-1:j+1,i-1));
                if j==1
                    Map(j,i)= energyImage(j,i)+min([Map(j,i-1),Map(j+1,i-1)]); 
                elseif j==rows
                    Map(j,i)= energyImage(j,i)+min([Map(j-1,i-1),Map(j,i-1)]);
                else
                    Map(j,i)= energyImage(j,i)+min([Map(j-1,i-1),Map(j,i-1),Map(j+1,i-1)]);
                end
            end
        end
    end
    minEnergyMap=Map;
end

function VerticalSeam = find_verticalSeam(minEnergyMap)
    [rows cols]=size(minEnergyMap);
    [minValue,minIndex]=min(minEnergyMap(rows,:));%minValue is the min value of the last row
                                                  %minIndex is the index of the min value
    VerticalSeam(rows,1)=minIndex;
    infValue=9999;
    for i=rows-1:-1:1
        j=VerticalSeam(i+1,1);  % j is the last(current) index before increment

        %dir is (1,2,3) corresponding to (left, center, and right)
        if j==1 %when at leftmost column  
            [value,dir]=min([infValue, minEnergyMap(i,j), minEnergyMap(i,j+1)]);
        elseif j==cols %when at rightmost column
            [value,dir]=min([minEnergyMap(i,j-1), minEnergyMap(i,j),infValue]);
        else
        %find min value of 3 neighboring pixels in previous row and
        %determine direction
            [value, dir]=min(minEnergyMap(i,j-1:j+1));       
        end
    next_Index=dir-2; %turn (1,2,3) to (-1,0,1) corresponding to the next increment of the index
    j=j+next_Index;     %add the last index with increment index to get the current index
    VerticalSeam(i,1)=j;
    end    
end


function HorizontalSeam = find_horizontalSeam(minEnergyMap)
    [rows cols]=size(minEnergyMap);
    [minValue,minIndex]=min(minEnergyMap(:,cols));     %minimum value and corresponding position of the last column
    HorizontalSeam(cols)=minIndex;
    infValue=9999;
    for i=cols-1:-1:1
        j=HorizontalSeam(i+1);  % j is the last(current) index before increment

        %dir is (1,2,3) corresponding to (upper, center, and lower)
        if j==1         %when at uppermost row        
            [value,dir]=min([infValue, minEnergyMap(j,i), minEnergyMap(j+1,i)]);
        elseif j==rows  %when at lowermost row
            [value,dir]=min([minEnergyMap(j-1,i), minEnergyMap(j,i),infValue]);
        else            %when at middle row, find min value of neighboring 3 pixels in last column
            [value, dir]=min(minEnergyMap(j-1:j+1,i));       
        end
    next_Index=dir-2;   %turn (1,2,3) to (-1,0,1) corresponding to the next increment of the index
    j=j+next_Index;     %add the last index with increment index to get the current index
    HorizontalSeam(i)=j;
    end    
end


function seamRed =  showSeam(image, seam, seamType)
%illustrate the seam path to be removed in the original image  
    if strcmp(seamType, 'VERTICAL')     %display vertical seam 
       for i = 1:size(image,1)         
          rgb=[255,0,0];                %create red color     
          image(i,seam(i),:)=rgb;       %make each single pixel of the seam path red, so the seam can be visible
      end
    else                                %display horizontal seam
      for i = 1:size(image,2)
          rgb=[255,0,0]; 
          image(seam(i), i,:) = rgb;
      end
    end
    seamRed = image;
end