function [nMean,nResult] = image_statistics(image)


img=imread(image);

imgGray = rgb2gray(img);


a = fix((size(imgGray,1)-256)/2);
b = fix((size(imgGray,2)-256)/2);

c = (a+256);
d = (b+256);


imgCrop = imgGray(a:c,b:d,:);


%kernel1 = 1 * ones(3);
%kernel1(2,2) = -8;  % Now kernel = [-1,-1,-1; -1,8,-1; -1,-1,-1]
%output1 = conv2(double(imgCrop), kernel1, 'same');
kernel = [0 1 0;1 -4 1; 0 1 0];
imgLap = imfilter(double(imgCrop),kernel);

nMean=mean2(imgLap);
nStd=std2(imgLap);
nResult = nStd*2;

imshow(imgLap);


end

