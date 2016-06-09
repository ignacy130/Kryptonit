function Iw = CodeImage2(I,h)
im=imread(I);
sx=size(im,1);
sy=size(im,2);
s=size(h,2);

%V1=reshape(I(:,:,1),sx*sy,1)'; V2=reshape(I(:,:,2),sx*sy,1)'; V3=reshape(I(:,:,3),sx*sy,1)';
kopia=im(2:size(im,1)-1,2:size(im,2)-1,:);
sx=size(kopia,1);
sy=size(kopia,2);
pixel_x=1;	%pierwszy x y
pixel_y=1;

DECh=uint8(h);
HEXh=dec2hex(DECh);
for i=1:size(h,2) %przejdx po kazdej literze hasla pocz¹tkowego
		[part1,part2]=znaki(HEXh(i,:));	
		[R,G,B]=meanValue(im,pixel_x,pixel_y);			%szukamy Å›redniej wartoÅ›ci tego pixela dla R G B
		next=randi([3,15],1,1);
		part1=hex2dec(num2str(part1));
        part2=hex2dec(part2);

		[R,G,B]=wartosc_bezwzgledna(R,next,G,part1,B,part2);		
		kopia(pixel_y,pixel_x,1)=R;			%nadpisujemy wartoÅ›ci R G B
		kopia(pixel_y,pixel_x,2)=G;				
		kopia(pixel_y,pixel_x,3)=B;
		tmp=sx*(pixel_y-1)+pixel_x+next;
		[pixel_x,pixel_y]=lokalizacja_pixela(sx,tmp);	%liczymy x y po przesunieciu. pixel_x*sx+pixel_y=aktualny numer pixela
end
imshow(kopia);
Iw=kopia
imwrite(kopia,'wyjscie.bmp');
end

function [R,G,B] = wartosc_bezwzgledna(R,next, G,part1, B,part2) 
if R<=200 
    R=R+next ;
else R=R-next; 
end
if G<=200 
    G=G+part1 ;
else G=G-part1;
end
if B<=200 
    B=B+part2;
else
    B=B-part2;
end
end 

function [xx,yy] = lokalizacja_pixela(sx,x)
xx= mod(x,sx);
if xx==0
     xx=sx;
end
yy =ceil(x/sx);
if yy==0
    yy=sx;
end
end


function [part1,part2] = znaki(hex) 
		if (numel(num2str(hex))==2)
			part1=hex(1);	
			part2=hex(2);	
        else
			part1=num2str(0);			
			part2=num2str(hex);
        end
end 

function [R, G, B] = meanValue(imt,pixel_x,pixel_y)%tu trzeba zmienic na srednia wartosc sasiadujacych pixeli, zapewne 'recznie' im(x-1,y) itd,trzeba pomijac pixele wychodzace poza zakres obrazu lub zmienic obraz wejsciowy na obraz minus krawedzie obrazu (wtedy wszystko robimy na obrazie bez krawedzi, ale srednia liczymy z obrazu z krawedziami i dzieki temu nigdy nie wychodzimy poza zakres)
	pixel_x=pixel_x+1;
	pixel_y=pixel_y+1;
	R = mean2(imt(pixel_x-1:pixel_x+1,pixel_y-1:pixel_y+1,1));
	G = mean2(imt(pixel_x-1:pixel_x+1,pixel_y-1:pixel_y+1,2)); 
	B = mean2(imt(pixel_x-1:pixel_x+1,pixel_y-1:pixel_y+1,3));       
end