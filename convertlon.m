function tmp=convertlon(tmp,frmt)
% input: 
%  tmp= matrix containing longitude values
%  frmt = 180 or 360
if frmt==180
   tmp(tmp>180)=tmp(tmp>180)-360;
elseif frmt == 360
   tmp(tmp<0)=tmp(tmp<0)+360;
else
   disp('format not recognized, lon vector is unchanged')
end