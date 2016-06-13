function [R, G, B] = meanValue2(imt,x,y)

	imtSize=size(imt);

	topLeft=[x-1,y-1];
	bottomRight=[x+1,y+1];

	if(x==1 && y==1) %TL
		topLeft=[x,y];
	end

	if(x~=1 && y==1) %TW
		topLeft=[x-1,y];
	end

	if(x==imtSize(1) && y==1) %TR
		topLeft=[x-1,y];
		bottomRight=[x,y+1];
	end

	if(x==imtSize(1) && y~=1) %RW
		bottomRight=[x,y+1];
	end

	if(x==imtSize(1) && y==imtSize(2)) %BR
		bottomRight=[x,y];
	end

	if(x~=imtSize(1) && y==imtSize(2)) %BW
		bottomRight=[x+1,y];
	end

	if(x==1 && y==imtSize(2)) %LB
		topLeft=[x,y-1];
		bottomRight=[x,y+1];
	end

	if(x==1 && y~=1) %LW
		topLeft=[x,y-1];
	end

	imtCopy = imt;
	imtCopy(x,y,:) = 0;
	smallM = imtCopy(topLeft,bottomRight,:);
    sx=size(smallM,1);
    sy=size(smallM,2);
    tmpR=reshape(smallM(:,:,1),[sx*sy,1]);
    tmpG=reshape(smallM(:,:,2),[sx*sy,1]);
    tmpB=reshape(smallM(:,:,3),[sx*sy,1]);
	R = sum(tmpR)/(sx*sy-1);
	G = sum(tmpG)/(sx*sy-1);
	B = sum(tmpB)/(sx*sy-1);
end