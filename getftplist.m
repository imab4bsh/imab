function getftplist(site,indir,outmat,lstring)
% gets a list of ftp paths and mget syntaxes for all
% files (containing a string) in a ftp directory that is organized in folders year/month/files

%indir='archive/ice/conc/';
%site='osisaf.met.no';
%outmat='iceftpstr';
if nargin<4
    lstring='*_nh_polstere*.nc';
end

f = ftp(site);
cd(f); sf=struct(f); sf.jobject.enterLocalPassiveMode();
cd(f,indir)

count=0;
yrs=dir(f);

for i=1:numel(yrs)
    i
    mth=dir(f,yrs(i).name);
    cd(f,yrs(i).name);
    doy=0;
    for j=1:numel(mth)
        cd(f,mth(j).name);
        dy=dir(f,lstring);
        for k=1:numel(dy)
            count=count+1;
            ind(count,:)=[i j k];
            ftpdir{count,1}=[yrs(i).name '/' mth(j).name '/'];
            MM(count,1)=str2double(mth(j).name);
            YY(count,1)=str2double(yrs(i).name);
            fn{count,1}=dy(k).name;
            DD(count,1)=str2double(fn{count}(38:39));
            DOY(count,1)=datevec2doy([YY(count) MM(count) DD(count)...
                0 0 0]);
            strd{count,1}='mget(f,[ftpdir{count} fn{count}],im_path)';
        end
        cd(f,'..');
    end
    cd(f,'..');
end
eval(['save ' outmat '.mat indir ftpdir ind fn DOY YY MM DD strd'])
close(f)
