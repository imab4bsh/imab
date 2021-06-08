function [st,ct,geovars,typevars,S,strext,fip]=get_geosubsetind(lonlims,latlims,indir,filename)
% Extracts info to access a subset of gridded data stored in a netcdf file
% using ncread
% Input example Ex. European arctic
% indir='\\win.bsh.de\root$\Standard\Hamburg\Homes\Homes00\bm2186\ICE\ice_im\2015\12\';
% filename='ice_conc_nh_polstere-100_multi_201512011200.nc';
% lonlims=[-25 60];  
% latlims=[66 90];
% Output example 
% st=[386   518     1];% start
% ct=[264   316     1];% count 
% geovars= list of variables
% 
% Author: Ingrid M. Angel-Benavides
% BSH - MOCCA/EA-Rise (Euro-Argo)
% (ingrid.angel@bsh.de)

info=ncinfo([indir filename]);
lat=ncread([indir filename],'lat');
lon=ncread([indir filename],'lon');
fip=[indir filename];
count=0;
for i=1:numel(info.Variables)
    s=info.Variables(i).Size;
    if numel(s)==3
        count=count+1;
        geovars{count}=info.Variables(i).Name;
        typevars{count}=info.Variables(i).Datatype;
        strext{count}=['ncread(fip,' '''' geovars{count} '''' ...
            ',st,ct);'];
        S(count,:)=s;
    end
end

[lon_pts,lat_pts]=corners(lonlims,latlims);
in=inpolygon(lon,lat,lon_pts,lat_pts);
[in1,in2]=ind2sub(size(lon),find(in==1));
in1_lim=[min(in1) max(in1)];
in2_lim=[min(in2) max(in2)];

st1=in1_lim(1);n1=diff(in1_lim)+1;
st2=in2_lim(1);n2=diff(in2_lim)+1; 

st=[st1 st2 1];
ct=[n1 n2 1];