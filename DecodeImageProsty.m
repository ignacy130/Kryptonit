function message = DecodeImageProsty(I,I2)
im2=imread(I2);
im=imread(I);
sx=size(im,1);
sy=size(im,2);
message='';
for i=1:sx
    for j=1:sy
        if im(i,j,2)~=im2(i,j,2)
            tmpG=abs(im2(i,j,2)-im(i,j,2));
            tmpG=dec2hex(tmpG);
            tmpG=num2str(tmpG);
            
            tmpB=abs(im2(i,j,3)-im(i,j,3));
            tmpB=dec2hex(tmpB);
            tmpB=num2str(tmpB);
            
            tmp=[tmpG,tmpB];
            tmp=hex2dec(tmp);
            tmp=char(tmp);
            message=[message,tmp];
        end
        
    end
end

