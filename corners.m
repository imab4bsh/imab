function [lon_pts,lat_pts]=corners(lonlims,latlims)
% Calculates the 5 corners of a rectangle from the upper and lower limits of each dimension
% for example from the lon and lat limits
% [lon_pts,lat_pts]=corners(lonlims,latlims)

% Author
% Oceanographer MSc. Ingrid M. Angel-Benavides.
% email: ingrid.angelb@gmail.com

lat_pts=[min(latlims) min(latlims) max(latlims)  max(latlims) min(latlims)];
lon_pts=[min(lonlims) max(lonlims) max(lonlims)  min(lonlims) min(lonlims)];
end


