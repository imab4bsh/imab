% Find closest point in grid
% input: coord1, coord2, grid_coord1, grid_coord2
function [ix,iy,mdist]=closest_gcell(coord1, coord2, grid_coord1, grid_coord2)
c1_range=[floor(coord1)-1 ceil(coord1)+1];
c2_range=[floor(coord2)-1 ceil(coord2)+1];
f1=find(grid_coord1>=c1_range(1)&grid_coord1<c1_range(2));
f2=find(grid_coord2>=c2_range(1)&grid_coord2<c2_range(2));
f=intersect(f1,f2);

for k=1:numel(f)
    d(k)=m_lldist([coord1 grid_coord1(f(k))],[coord2 grid_coord2(f(k))]);
end
% find pixel closest to profile position
mdist=min(d(:));
closest=f(find(d==mdist));
[ix,iy]=ind2sub(size(grid_coord1),closest);