function [YY,MM,DD,HH,MI,SS]=datesRD2vec(DATES)
% taken from make_one_GINseamatfile.m in X:\Public\bm2210\fuer_moritz
% YY: year
YY=fix(DATES/1e10);
% MM: month
MM=floor((DATES-(YY*1e10))/1e8);
% DD: day
DD=floor((DATES-(YY*1e10)-(MM*1e08))/1e06);
% HH: hour
HH=floor((DATES-(YY*1e10)-(MM*1e08)-DD*1e06)/1e04);
% MM: minute
MI=floor((DATES-(YY*1e10)-(MM*1e08)-DD*1e06-HH*1e04)/1e02);
% SS:
SS=0*DATES;
