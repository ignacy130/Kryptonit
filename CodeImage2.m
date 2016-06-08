function Iw = CodeImage2(I,h)
im=imread(I);
sx=size(im,1);
sy=size(im,2);
s=size(h,2)

%V1=reshape(I(:,:,1),sx*sy,1)'; V2=reshape(I(:,:,2),sx*sy,1)'; V3=reshape(I(:,:,3),sx*sy,1)';
kopia=im(2:size(im,1)-1,2:size(im,2)-1,:);
sx=size(kopia,1);
sy=size(kopia,2);
range = floor((sx*sy)/size(h,2));
pixel_x=1;	%pierwszy x y
pixel_y=1;
h=dec2hex(uint8(h));		%zmieniamy hasło z char na ASCII na hex
for i=1:size(h,2) %przejdx po kazdej literze hasla
		[part1,part2]=znaki(h(i));	
        pixel_x
        pixel_y%dzielimy znak na 2 czesci
		[R,G,B]=meanValue(im,pixel_x,pixel_y);			%szukamy średniej wartości tego pixela dla R G B
		next=randi(range-1) %przeskok powinien byc miedzy 2 a np 50 zeby dalo sie go zapisac w R
		part1=hex2dec(part1);
        part2=hex2dec(part2);
        G=G+part1;
        B=B+part2;					%w G B czesci liter hasla	
		[R,G,B]=wartosc_bezwzgledna(R,next,G,part1,B,part2);		
		kopia(pixel_x,pixel_y,1)=R;			%nadpisujemy wartości R G B
		kopia(pixel_x,pixel_y,2)=G;				
		kopia(pixel_x,pixel_y,3)=B;
		tmp=(pixel_x*sx)+pixel_y+next;
		[pixel_x,pixel_y]=lokalizacja_pixela(sx,tmp);	%liczymy x y po przesunieciu. pixel_x*sx+pixel_y=aktualny numer pixela
end
imshow(kopia);
Iw=kopia;
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
sx
x
xx =floor(x/sx); %x/sx bez reszty

yy= mod(x,sx);%reszta z x/sx
if yy==0
    yy=sx;
end
if xx==sx+1
    xx=sx;
end
end 


function [part1,part2] = znaki(hex) 
		if (numel(num2str(hex))==2)	%jeśli hex 2 znaki
            str1=num2str(hex);
            str2=num2str(hex);
			part1=str2num(str1(1));		%part1=pierwszy znak		
			part2=str2num(str2(2));		%part2=drugi znak
        else	%w hex 2 znak
			part1=0;			
			part2=hex;
        end
end 
  

function [R, G, B] = meanValue(imt,pixel_x,pixel_y)%tu trzeba zmienic na srednia wartosc sasiadujacych pixeli, zapewne 'recznie' im(x-1,y) itd,trzeba pomijac pixele wychodzace poza zakres obrazu lub zmienic obraz wejsciowy na obraz minus krawedzie obrazu (wtedy wszystko robimy na obrazie bez krawedzi, ale srednia liczymy z obrazu z krawedziami i dzieki temu nigdy nie wychodzimy poza zakres)
pixel_x=pixel_x+1;
pixel_y=pixel_y+1;
R = mean2(imt(pixel_x-1:pixel_x+1,pixel_y-1:pixel_y+1,1));
G = mean2(imt(pixel_x-1:pixel_x+1,pixel_y-1:pixel_y+1,2)); 
B = mean2(imt(pixel_x-1:pixel_x+1,pixel_y-1:pixel_y+1,3));      
end
  