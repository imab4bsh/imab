function DATE=juld2datev(JULD,t1)
%JULD:units = "days since 1950-01-01
%t1=[1950 1 1 0 0 0];
for k=1:numel(JULD)
    T(k)= addtodate(datenum(t1),floor(JULD(k)), 'day');
end
DATE=datevec(T);
