function [R, G, B] = meanValue(imt,x,y)

	imtSize=size(imt)

	topLeft=[x-1,y-1];
	bottomRight=[x+1,y+1];

	if(x==1 && y==1) %TL
		topLeft=[x,y];
	end

	if(x!=1 && y==1) %TW
		topLeft=[x-1,y];
	end

	if(x==imtSize(1) && y==1) %TR
		topLeft=[x-1,y];
		bottomRight=[x,y+1];
	end

	if(x==imtSize(1) && y!=1) %RW
		bottomRight=[x,y+1];
	end

	if(x==imtSize(1) && y==imtSize(2)) %BR
		bottomRight=[x,y];
	end

	if(x!=imtSize(1) && y==imtSize(2)) %BW
		bottomRight=[x+1,y];
	end

	if(x==1 && y==imtSize(2)) %LB
		topLeft=[x,y-1];
		bottomRight=[x,y+1];
	end

	if(x==1 && y!=1) %LW
		topLeft=[x,y-1];
	end

	imtCopy = imt;
	imtCopy(x,y) = 0;
	smallM = imtCopy(toplLeft,bottomRight);
	R = sum(smallM)(1)/(size(smallM)-1);
	G = sum(smallM)(2)/(size(smallM)-1);
	B = sum(smallM)(3)/(size(smallM)-1);
end