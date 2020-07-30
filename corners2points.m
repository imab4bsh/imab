function [lons,lats]=corners2points(lon_pts,lat_pts,n)
% from 5 points that define a rectangle, gets n points from each side, to
% have n*4 points defining the boundary of the rectangle.
% I wrote this script so I can plot the boundaries of my ROIs correctly
% when the lines of latitude, longitude are not straight.

% Author: Ingrid M. Angel-Benavides
%         BSH - MOCCA/EA-Rise (Euro-Argo)
%        (ingrid.angel@bsh.de)
%         30.07.20
for i=1:4
    lo1=lon_pts(i);lo2=lon_pts(i+1);
    la1=lat_pts(i);la2=lat_pts(i+1);
    if lo1==lo2
       lons{i}=repmat(lo1,1,n);
       lats{i}=linspace(la1,la2,n);
    else
       lons{i}=linspace(lo1,lo2,n);
       lats{i}=repmat(la1,1,n);
    end
end
lons=cell2mat(lons);lats=cell2mat(lats);