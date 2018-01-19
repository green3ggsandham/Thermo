try
 fclose(instrfind);
end;
s1 = serial('COM3', ... % Change as needed!
 'BaudRate', 115200, ...
 'Parity', 'none', ...
 'DataBits', 8, ...
 'StopBits', 1, ...
 'FlowControl', 'none');
fopen(s1);
try
 fprintf('Press CTRL+C to finish\n');
 figureHandle = figure('NumberTitle','off',...
    'Name','Temperature Characteristics',...
    'Color',[0 0 0],'Visible','off');
axesHandle = axes('Parent',figureHandle,...
    'YGrid','on',...
    'YColor',[0.9725 0.9725 0.9725],...
    'XGrid','on',...
    'XColor',[0.9725 0.9725 0.9725],...
    'Color',[0 0 0]);
hold on;

xlabel('Time','FontWeight','bold','FontSize',14,'Color',[1 1 0]);
ylabel('Temperature in C','FontWeight','bold','FontSize',14,'Color',[1 1 0]);
title('Real Time Data','FontSize',15,'Color',[1 1 0]);
 
t = 0; 
 while (1)
  x = t;
  xlim([x-50 x+50])
  ylim([0 80])

 val=fscanf(s1);
 y = sscanf(val, '%f');
   pause(.001);
   t = t + 1;
 fprintf('X=%5.2f\n', x);
 fprintf('Y=%5.2f\n', y);
 
 
plotHandle = plot(axesHandle,x,y,'Marker','.','LineWidth',1,'Color',[0 1 0]);
set(plotHandle,'YData',y,'XData',x);
    set(figureHandle,'Visible','on');
 end
end
fclose(s1);
