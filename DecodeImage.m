function message = DecodeImage(I)
    im=I;
    sx=size(im,1);
    sy=size(im,2);

    kopia=im(2:size(im,1)-1,2:size(im,2)-1,:);
    sx=size(kopia,1);
    sy=size(kopia,2);
    pixel_x=1;	%pierwszy x y
    pixel_y=1;
    next=0;
    message = '';

    while(true)
    
    [R,G,B]=meanValue(im,pixel_x,pixel_y)
    message = message + num2str(hex2dec(num2str(G)))+num2str(hex2dec(num2str(B)))
    
        if G!=0 && B!=0
            break; 
        end 
    end

    message
end