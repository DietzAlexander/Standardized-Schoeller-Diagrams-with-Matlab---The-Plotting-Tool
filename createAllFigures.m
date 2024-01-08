%All plot commands used in the manual.

%Standard graphic (used in any figure)
plotSchoeller('ExampleDataSet.xlsx',1,'LineWidth',2,'CreateFigure','Print','./example1','-depsc','FigureSize',[640,480])

%Fig 1 (pivot element)
plotSchoeller('ExampleDataSet.xlsx',0,'LineWidth',2,'CreateFigure','Print','./example2','-depsc','FigureSize',[640,480])

%Fig 2 (no plot options)
plotSchoeller('ExampleDataSet.xlsx',1,'Print','./example3','-depsc')

%Fig 3 (different columns)
plotSchoeller('ExampleDataSet.xlsx',1,'Columns',{'TEC','K+','NH4+','TDS'},'LineWidth',2,'CreateFigure','Print','./example4','-depsc','FigureSize',[640,480])

%Fig 4 (different lines)
plotSchoeller('ExampleDataSet.xlsx',1,'Rows',{'O2';'S1'},'LineWidth',2,'CreateFigure','Print','./example5','-depsc','FigureSize',[640,480])

%Fig 5 (customed title)
plotSchoeller('ExampleDataSet.xlsx',1,'Title','\bf \fontsize{16} Notice Element NH_{4}^{+}','LineWidth',2,'CreateFigure','Print','./example6','-depsc','FigureSize',[640,480])

%Fig 6 (2 legend columns)
plotSchoeller('ExampleDataSet.xlsx',1,'LegendColumns',2,'LineWidth',2,'CreateFigure','Print','./example7','-depsc','FigureSize',[640,480])

%Fig 6 (legend southwest)
plotSchoeller('ExampleDataSet.xlsx',1,'LegendLocation','southwest','LineWidth',2,'CreateFigure','Print','./example8','-depsc','FigureSize',[640,480])

%Fig 6 (legend outside)
plotSchoeller('ExampleDataSet.xlsx',1,'LegendLocation','eastoutside','LineWidth',2,'CreateFigure','Print','./example9','-depsc','FigureSize',[640,480])

%Fig 6 (legend outside, rescaled plot)
plotSchoeller('ExampleDataSet.xlsx',1,'LegendLocation','eastoutside','LineWidth',2,'CreateFigure','Print','./example10','-depsc','FigureSize',[800,480])

%Fig 7 (different lower bound)
plotSchoeller('ExampleDataSet.xlsx',1,'LowerBound',0.001,'LineWidth',2,'CreateFigure','Print','./example11','-depsc','FigureSize',[640,480])

%Fig 8 (all lower bound texts)
plotSchoeller('ExampleDataSet.xlsx',1,'LowerBoundText',1,'LineWidth',2,'CreateFigure','Print','./example12','-depsc','FigureSize',[640,480])

%Fig 8 (lower bound text on column 3 and 5)
plotSchoeller('ExampleDataSet.xlsx',1,'LowerBoundText',[0,0,1,0,1],'LineWidth',2,'CreateFigure','Print','./example13','-depsc','FigureSize',[640,480])

%Fig 8 (lower bound texts on column 1 and 4 with adjusted lower bound
%values)
plotSchoeller('ExampleDataSet.xlsx',1,'LowerBoundText',[1,0,0,1,0],'LowerBound',[0.001,0.01,0.01,10,0.01],'LineWidth',2,'CreateFigure','Print','./example14','-depsc','FigureSize',[640,480])

%Fig 9 (floor lower values on each column)
plotSchoeller('ExampleDataSet.xlsx',1,'FloorLowerValues',1,'LowerBound',[0.01,100,400,0.01,0.01],'LineWidth',2,'CreateFigure','Print','./example15','-depsc','FigureSize',[640,480])

%Fig 9 (floor lower values on the second column)
plotSchoeller('ExampleDataSet.xlsx',1,'FloorLowerValues',[0,1,0,0,0],'LowerBound',[0.01,100,400,0.01,0.01],'LineWidth',2,'CreateFigure','Print','./example16','-depsc','FigureSize',[640,480])

%Fig 10 (different upper and lower display factor)
plotSchoeller('ExampleDataSet.xlsx',1,'UpperDisplayFactor',5,'LowerDisplayFactor',1/5,'LineWidth',2,'CreateFigure','Print','./example17','-depsc','FigureSize',[640,480])

%Fig 11 (different font size)
plotSchoeller('ExampleDataSet.xlsx',1,'FontSize',15,'LineWidth',2,'CreateFigure','Print','./example18','-depsc','FigureSize',[640,480])

%Fig 12 (different figure size)
plotSchoeller('ExampleDataSet.xlsx',1,'LineWidth',2,'CreateFigure','Print','./example19','-depsc','FigureSize',[900,480])

%Fig  13 (all lines in red)
plotSchoeller('ExampleDataSet.xlsx',1,'.--','Markersize',15,'Color','r','LineWidth',4,'CreateFigure','Print','./example20','-depsc','FigureSize',[640,480])

%Fig 13 (different lines in each attribute)
plotSchoeller('ExampleDataSet.xlsx',1,["-";".-";"--";".--";"d-"],'Markersize',[5;10;25;5;15],'Color',[1,0,0;0,1,0;0,0,1;1,1,0;0,1,1],'LineWidth',[3;4;2;5;1],'CreateFigure','Print','./example21','-depsc','FigureSize',[640,480])

%Fig 14 (with arrow annotation)
[PointMatrix]=plotSchoeller('ExampleDataSet.xlsx',1,'RelativeDataPoints',[1.5,1;1.5,0.01],'LineWidth',2,'CreateFigure','FigureSize',[640,480]);
plot(PointMatrix([1,2],1),PointMatrix([1,2],2),'-','HandleVisibility','off','LineWidth',3,'Color','k');
plot(PointMatrix(2,1),PointMatrix(2,2),'v','HandleVisibility','off','LineWidth',3,'Color','k')
print('./example22','-depsc')

%Logo for TUDataLib
plotSchoeller('ExampleDataSet.xlsx',1,'LineWidth',4,'CreateFigure','Print','./logo','-dpng','FigureSize',[1400,1050],'Title','\bf \fontsize{32} Standardized Schoeller Diagrams','FontSize',16)

