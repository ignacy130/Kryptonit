function Iw = CodeImageProsty(I,h)
im=imread(I);
sx=size(im,1);
sy=size(im,2);
s=size(h,2);

V1=reshape(im(:,:,1)',[sx*sy,1])';
V2=reshape(im(:,:,2)',[sx*sy,1])';
V3=reshape(im(:,:,3)',[sx*sy,1])';

krok=floor(size(V1,2)/size(h,2));
DECh=uint8(h);
HEXh=dec2hex(DECh);
next=0;
for i=1:size(h,2) %przejdx po kazdej literze hasla pocz¹tkowego
		[part1,part2]=znaki(HEXh(i,:));
		next=next+krok;
        part1=hex2dec(part1);
        part2=hex2dec(part2);
        if V2(next)>=200
            V2(next)=V2(next)-part1;
        else
            V2(next)=V2(next)+part1;
        end
        if V3(next)>=200
            V3(next)=V3(next)-part2;
        else
            V3(next)=V3(next)+part2;
        end
end
im(:,:,2)=reshape(V2,sy,sx)';
im(:,:,3)=reshape(V3,sy,sx)';
Iw=im;
imwrite(Iw,'wyjscie.bmp');
end


function [part1,part2] = znaki(hex) 
		if (numel(num2str(hex))==2)
			part1=hex(1);	
			part2=hex(2);	
        else
			part1=num2str(0)			
			part2=num2str(hex)
        end
end 