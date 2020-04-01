function [unix,uniy,ofs]=set_grid(lonlims,latlims,step)
uniy=min(latlims):step:max(latlims);
unix=min(lonlims):step:max(lonlims);
ofs=step/2;