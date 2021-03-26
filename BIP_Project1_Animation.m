% Make an animation

clear; clf; clc;
ipfn = 'mri-a.256';
ipfp = fopen(ipfn, 'r');
ipimg = fread(ipfp, [256,256], 'uchar');
mri=ipimg';
colormap(gray(256));
axis('image') ;

for count=1:256
    mri(:,257-count)=0;
    for i=1:256
        for j=1:256
            if(mri(i,j) == count)
                mri(i,j)=0;
            end
        end
    end

    image(mri);
    colormap(gray(256));
    axis('image') ;
    print('-djpeg', [ num2str(count),'.jpg'])
end

%%
writerObj = VideoWriter('104012005 project 1_2.avi');
writerObj.FrameRate = 30;
writerObj.Quality = 90;
open(writerObj);
for i = 1:1:256
    img = imread([sprintf('%d',i),'.jpg']);
    writeVideo(writerObj, img);
end
close(writerObj);
