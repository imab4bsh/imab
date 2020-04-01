function rep_xtick(h,val,strr)
a=get(h,'xticklabel');
for i=1:numel(a)
    if strcmp(a{i},val)
       a{i}=strr;
    end
end
set(h,'XTickLabel',a)