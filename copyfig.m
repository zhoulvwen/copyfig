function [x,y]=copyfig(Figstr,Xticklabel,Yticklabel,plotstr)
FigM=imread(Figstr);
FigM(:,:,1)=flipud(FigM(:,:,1));
FigM(:,:,2)=flipud(FigM(:,:,2));
FigM(:,:,3)=flipud(FigM(:,:,3));
image(FigM);
grid on
Xlim=get(gca,'xlim');
Ylim=get(gca,'ylim');
[x,y]=ginput;
plot(x,y,plotstr);
xlim(Xlim);
ylim(Ylim);
xlength=length(Xticklabel);
ylength=length(Yticklabel);
set(gca,'xtick',[Xlim(1):(Xlim(2)-Xlim(1))/(xlength-1):Xlim(2)]);
set(gca,'ytick',[Ylim(1):(Ylim(2)-Ylim(1))/(ylength-1):Ylim(2)]);

Xticklabelstr='';
for i=1:length(Xticklabel)-1;
    Xticklabelstr=strcat(Xticklabelstr,num2str(Xticklabel(i)),'|');
end
Xticklabelstr=strcat(Xticklabelstr,num2str(Xticklabel(end)));

Yticklabelstr='';
for i=1:length(Yticklabel)-1;
    Yticklabelstr=strcat(Yticklabelstr,num2str(Yticklabel(i)),'|');
end
Yticklabelstr=strcat(Yticklabelstr,num2str(Yticklabel(end)));

set(gca,'xticklabel',Xticklabelstr);
set(gca,'yticklabel',Yticklabelstr);
x=(x-min(Xlim))/(max(Xlim)-min(Xlim))*(max(Xticklabel)-min(Xticklabel))+min(Xticklabel);
y=(y-min(Ylim))/(max(Ylim)-min(Ylim))*(max(Yticklabel)-min(Yticklabel))+min(Yticklabel);