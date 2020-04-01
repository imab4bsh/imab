function rep_ytick(h,val,strr)
a=get(h,'yticklabel');
for i=1:numel(a)
    if strcmp(a{i},val)
       a{i}=strr;
    end
end
set(h,'yticklabel',a)