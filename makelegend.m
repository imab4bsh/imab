function makelegend(CLR,reg)
% plots a legend without any figure
figure
% make legend
for i=1:size(CLR,1)
    plot(1,1,'color',CLR(i,:),'linewidth',2)
    hold on
end
legend(reg)
set(findall(gcf,'-property','FontSize'),'FontSize',12)
