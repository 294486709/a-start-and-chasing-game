function CTinfo=CTVisibilitycheck(Mapinfo,CTinfo,Tinfo)
% visibility check
NumCT=size(CTinfo,2);
visibile=struct('unit',[]);
for i=1:NumCT
    visibile(i).unit=[];
    if Mapinfo(CTinfo(i).idx).up==1
        visibile(i).unit=[visibile(i).unit CTinfo(i).idx-36];
        for j=1:100
            if Mapinfo(CTinfo(i).idx-36*j).up==1
                visibile(i).unit=[visibile(i).unit CTinfo(i).idx-36*j-36];
            else
                break;
            end
        end
    end
    if Mapinfo(CTinfo(i).idx).down==1
        visibile(i).unit=[ visibile(i).unit CTinfo(i).idx+36];
        for j=1:100
            if Mapinfo(CTinfo(i).idx+36*j).down==1
                visibile(i).unit=[visibile(i).unit CTinfo(i).idx+36*j+36];
            else
                break;
            end
        end
    end
    if Mapinfo(CTinfo(i).idx).left==1
        visibile(i).unit=[ visibile(i).unit CTinfo(i).idx-1];
        for j=1:100
            if Mapinfo(CTinfo(i).idx-j).left==1
                visibile(i).unit=[visibile(i).unit CTinfo(i).idx-1-j];
            else
                break;
            end
        end
    end
    if Mapinfo(CTinfo(i).idx).right==1
        visibile(i).unit=[ visibile(i).unit CTinfo(i).idx+1];
        for j=1:100
            if Mapinfo(CTinfo(i).idx+j).right==1
                visibile(i).unit=[visibile(i).unit CTinfo(i).idx+1+j];
            else
                break;
            end
        end
    end
    CTinfo(i).vision=visibile(i).unit;
end
end