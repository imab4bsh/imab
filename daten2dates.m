function dates=daten2dates(daten)
dates=zeros(size(daten));
for i=1:numel(daten)
    Date_1=datevec(daten(i));
    Date_2=[];
    for j=1:6
        Date_2=[Date_2 num2str(Date_1(j),'%02.f')];
    end
    dates(i)= str2double(Date_2);    
end