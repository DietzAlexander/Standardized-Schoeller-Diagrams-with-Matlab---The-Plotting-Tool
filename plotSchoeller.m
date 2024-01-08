function [varargout] = plotSchoeller(Data,pivot,varargin)

%PLOTSCHOELLER Plots a (standardized) Schoeller diagram from given Data
%with the normed line pivot and several plot options. We recommend to have
%a look into the manual we provide. There you can find all information
%example graphics and a detailed explanation of all commands.
%
%   Data:   Data Table or path to a Data Table. Format: cell array
%           One column represents one chemical element or molecule
%           The first line represents the identifing names of each 
%           column.
%           The second line represents the caption if each column
%           all other lines represents the values of the coresponding 
%           element for one measurement. 
%
%   pivot:  The line number, which appears constant in the standardized
%           Schoeller diagram. Use 0 for a usual Schoeller diagram. 
%
%   varargin:   Several plot and print options.
%
%   plotSchoeller(Data,0) plots a Schoeller diagram.
%
%   plotSchoeller(Data,n) plots a Schoeller diagram with constant line n.
%
%   plotSchoeller('Datapath',pivot) plots a Schoeller diagram from given
%       Data in file 'Datapath'.
%
%   plotSchoeller(Data,pivot) plots a Schoeller diagram from given cell 
%       array Data.
%
%   plotSchoeller( , ,'Columns',columnarray) plots a Schoeller diagram with
%       only the columns, specified in the cell array columnarray, which 
%       corespond to the columnnames of the cell array Data.
%       Example: plotSchoeller(Data,pivot,'columns',{'Li','Ca'})
%
%   plotSchoeller( , ,'Rows',rowarray) plots a Schoeller diagram with
%       only the rows, specified in the cell array rowarray, which 
%       corespond to the rownames of the cell array Data.
%       Example: plotSchoeller(Data,pivot,'Rows',{'DataLine1';'DataLine2'})
%
%   plotSchoeller( , ,LineSpec) plots a Schoeller diagram with plot options
%       to the lines. Also see plot. If you want to specify different 
%       options for each line, use a matrix with options coresponding to 
%       the lines.
%       Example: plotSchoeller( , ,'.-','Markersize',15,'Color','r')
%       Example: plotSchoeller( , ,'.-','Markersize',[2;5;1;25],'Color',...
%           [1,0,0;0,0,0;0,1,0;0,0,1])
%
%   plotSchoeller( , ,'LegendLocation',value) plots a Schoeller diagram 
%       with LegendLocation value. 
%       Example: plotSchoeller( , ,'LegendLocation','Southeast')
%
%   plotSchoeller( , ,'LegendColumns',value) plots a Schoeller diagram 
%       with the amount of LegendColumns value. 
%       Example: plotSchoeller( , ,'LegendColumns',2)
%
%   plotSchoeller( , ,'Print',printpath,printproperties) plots a Schoeller
%       diagram and print it to the file printpath with the printproperties
%       printproperties.
%       Example: plotSchoeller( , ,'Print','./Test','-dpng')
%
%   plotSchoeller( , ,'CreateFigure') plots a Schoeller diagram and creates
%       a figure with Renderer Painters.
%       Example: plotSchoeller( , ,'CreateFigure')
%
%   plotSchoeller( , ,'Title',titleName) plots a Schoeller diagram with the
%       title titleName.
%       Example: plotSchoeller( , ,'Title','MyTitle')
%
%   plotSchoeller( , ,'LowerBound',lowerBound) plots a Schoeller diagram
%   with a lower bound of lowerBound. Standard is 0.01.
%   Can also be specified for each column.
%       Example: plotSchoeller( , ,'LowerBound',0.001)
%                plotSchoeller( , ,'LowerBound',[0.1,1,0.001,0.00001])
%
%   plotSchoeller( , ,'LowerBoundText',value) plots a Schoeller diagram 
%       with or without the texts of minimal entries for each column.
%       value must be 0,1 or a vector of 0 and 1. Each value of the vector
%       corresponds with a column of the plot. If the input is a vector, the
%       length of the vector must have the same size as the amount of
%       columns.
%       Example: plotSchoeller( , ,'LowerBoundText',1)
%       Example: plotSchoeller( , ,'LowerBoundText',[1,0,1,0,0,1])
%
%   plotSchoeller( , ,'FloorLowerValues', value) Sets all values of the
%   DataTable which are lower than the lower bound to NaN if the value is equal
%   to 1. Can also be specified for each column.
%       Example: plotSchoeller( , ,'FloorLowerValue',1)  
%       Example: plotSchoeller( , ,'FloorLowerValue',[1,0,1])  
%
%   plotSchoeller( , ,'UpperDisplayFactor',upperDisplayFactor) plots a
%       Schoeller diagram, in which the upper display is 
%       upperDisplayFactor*biggestElement. Standard is 2.
%       Example: plotSchoeller( , ,'UpperDisplayFactor',3)
%
%   plotSchoeller( , ,'LowerDisplayFactor',lowerDisplayFactor) plots a
%       Schoeller diagram, in which the lowest display is 
%       lowerDisplayFactor*smalestElement. Standard is 0.5.
%       Example: plotSchoeller( , ,'LowerDisplayFactor',0.25)
%
%   plotSchoeller( , ,'FonzSize',value) plots a
%       Schoeller diagram, in which all not specified texts have the font size
%       value.
%       Example: plotSchoeller( , ,'FonzSize',12)  
%
%   plotSchoeller( , ,'FigureSize',[width,height]) plots a
%       Schoeller diagram with fixed figure size width x height. Standard
%       value is screensize.
%       Example: plotSchoeller( , ,'FigureSize',[640,480])  
%       
%   [PointOutputMatrix]=plotSchoeller( , ,'RelativeDataPoints',PointMatrix) 
%       plots a Schoeller diagram. Returns a matrix, where lines are the 
%       real values of the points which are seen in the figure and 
%       specified by Point Matrix. The x-values of the first column starts 
%       at 1 and ends at 1.999, the x values of the second column starts at
%       2 and ends at 2.999 and so on.
%       Example: [PointOutputMatrix]=plotSchoeller( , ,'RelativeDataPoints',[1,1;2,100])
%
%We highly recommend to have a look into our manual. There is a detailed
%explanation to all the commands and a lot of example graphics.
%
%   See also: plot, semilogy, print, figure
%
%
%----------------------------------------------------------------------
% Contact and Licence
%----------------------------------------------------------------------
%
% For any suggestions concerning the code or the manual you can write to
%
%      dietz@mathematik.tu-darmstadt.de
%
% and for any suggestions concerning (standardized) Schoeller diagrams to
%
%      rafael.schaeffer@tu-darmstadt.de
%
% The original source of this code file is
%
% https://doi.org/10.48328/tudatalib-877
%
% There you can find a manual and additional information.
%
% The matlab code and the manual are published under the CC-BY license. 
% The tool and any graphics, created with this plotting tool, can be used 
% by naming the corresponding publication:
%
%  Schäffer, R., Dietz, A. (2023): Standardized Schoeller diagrams — 
%  A Matlab plotting tool. Grundwasser 28, 345–355. 
%  https://doi.org/10.1007/s00767-023-00556-3



% The number of plot properties. Might be reduced by LegenLocation, Print
% and columns
NumberOfPlotProperties = nargin - 2;

%Standard values for several options of varargin
LegendPos='Northeast';
LegendColumns=1;
Print=false;
columns='all';
rows='all';
createFigure = false;
createTitle = false;
warningCaptions = false;
lowerBound=0.01;
LowerBoundText=0;
lowerDisplayFactor=0.5;
upperDisplayFactor=2;
floorLowerValues= 0;
PointOutputMatrix=zeros(0);
AmountOfPoints=0;
FontSize=10;
FigureSize=get(0, 'Screensize');


%Checks, if the given keyword could be found in varargin. If yes, values
%were set and the keywords and the values were deleted from varargin. All
%remaining entries are values for the semilog command
i=1;
while i <= NumberOfPlotProperties
    %Specifies the Values under the lowerBound
    if ischar(varargin{i}) && strcmp(varargin{i},'FloorLowerValues')
        floorLowerValues=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the Legend Location
    elseif ischar(varargin{i}) && strcmp(varargin{i},'LegendLocation')
        LegendPos=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;   
    %Specifies the font size
    elseif ischar(varargin{i}) && strcmp(varargin{i},'FontSize')
        FontSize=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the figure size
    elseif ischar(varargin{i}) && strcmp(varargin{i},'FigureSize')
        FigureSize=[1,1,varargin{i+1}];
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the amount of Legend Columns
    elseif ischar(varargin{i}) && strcmp(varargin{i},'LegendColumns')
        LegendColumns=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the RelativeDataPoints
    elseif ischar(varargin{i}) && strcmp(varargin{i},'RelativeDataPoints')
        PointMatrix=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
        PointOutputMatrix=zeros(size(PointMatrix));
        [AmountOfPoints,~]=size(PointOutputMatrix);
    %Specifies Printing and printing options
    elseif ischar(varargin{i}) && strcmp(varargin{i},'Print')
        Print=true;
        PrintPath=varargin{i+1};
        PrintProp=varargin{i+2};
        varargin(i)=[];
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-3;
    %Specifies which columns are displayed
    elseif ischar(varargin{i}) && strcmp(varargin{i},'Columns')
        columns=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies which rows are displayed
    elseif ischar(varargin{i}) && strcmp(varargin{i},'Rows')
        rows=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies if a new figure with Renderer Painters will be created
    elseif ischar(varargin{i}) && strcmp(varargin{i},'CreateFigure')
        createFigure = true;
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-1;
    %Specifies the title of the figure
    elseif ischar(varargin{i}) && strcmp(varargin{i},'Title')
        createTitle = true;
        titleName = varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the lower bound
    elseif ischar(varargin{i}) && strcmp(varargin{i},'LowerBound')
        lowerBound = varargin{i+1};
        if lowerBound <=0
           error('The lower bound has to be greater than zero.'); 
        end
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the output of the LowerBoundText
    elseif ischar(varargin{i}) && strcmp(varargin{i},'LowerBoundText')
        LowerBoundText=varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the lower display factor
    elseif ischar(varargin{i}) && strcmp(varargin{i},'LowerDisplayFactor')
        lowerDisplayFactor = varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    %Specifies the upper display factor
    elseif ischar(varargin{i}) && strcmp(varargin{i},'UpperDisplayFactor')
        upperDisplayFactor = varargin{i+1};
        varargin(i)=[];
        varargin(i)=[];
        NumberOfPlotProperties=NumberOfPlotProperties-2;
    else
        i=i+1;
    end
end

%Avoid an error for the display factors
if lowerDisplayFactor > 1
    warning('Lower display factor cannot be greater then 1. Set the factor to 0.5.')
    lowerDisplayFactor=0.5;
end

if upperDisplayFactor < 1
    warning('Upper display factor cannot be lower then 1. Set the factor to 2.')
    upperDisplayFactor=2;
end

%If the  option is enabled, create a new figure with Renderer
%Painters (for good qualitiy of the plot)
if createFigure
    figure('Renderer','Painters')
else
    figure
end


%If Data is a path, load the given DataTable as cell array
if ischar(Data)
    %Reads the Data and the column headers
   DataTable=readtable(Data,'ReadRowNames',true,'PreserveVariableNames', true);
   %Reads the captions which had to be in the second line of the data table
   CaptionsCol=readtable(Data,'ReadRowNames',true,'PreserveVariableNames', true,'Range','A2');
   %Sets the captions of the columns and the rows
   DataTable.Properties.VariableDescriptions=CaptionsCol.Properties.VariableNames;
   if strcmp(DataTable.Properties.VariableDescriptions(1),'Var1') 
      RowCaptions=DataTable(:,1);
      DataTable(:,1)=[];
   else
       RowCaptions=table(DataTable.Properties.RowNames);
   end
   %if no Captions is described
   if strcmp(DataTable.Properties.VariableDescriptions(1),'Var1')
      warning('No column captions found in DataTable. Column caption will be set to column names.')
      warningCaptions = true;
   end
else
    %if not, use the given dataTable
    DataTable=Data;
end

%if all columns should be displayed, load all of the tables
if ischar(columns) && strcmp(columns,'all')
    %if all rows should be displayed, load all of the tables
    if ischar(rows) && strcmp(rows,'all')
        Data=DataTable{:,:};
    %if not, just read the rows specified in the columns
    else
       Data=DataTable{rows,:}; 
    end

%if not, read just the columns specified within the columns
else
   %if all rows should be displayed, load all of the tables
    if ischar(rows) && strcmp(rows,'all')
        Data=DataTable{:,columns};
    %if not, read just the rows specified in the columns
    else
       Data=DataTable{rows,columns}; 
    end
    
end



Data(Data==0)=NaN;
[~,col]=size(Data);

%Checks if the lowerBound has the right size
if length(lowerBound) ~= 1 
   if length(lowerBound) > col
      warning('Length of the lower bound vector is greater than the amount of columns. the last values are ignored.')
      lowerBound=lowerBound(1:col);
      
   elseif length(lowerBound)< col
       warning('Length of the lower bound vector is smaller than the amount of columns. the last value is reproduced.')
      lowerBound=[lowerBound, repelem(lowerBound(end),col-length(lowerBound))];
   end
end

%Checks if the lowerBoundText has the right size
if length(LowerBoundText) ~= 1 
   if length(LowerBoundText) > col
      warning('Length of the lower bound text vector is greater than the amount of columns. the last values are ignored.')
      LowerBoundText=LowerBoundText(1:col);
      
   elseif length(LowerBoundText)< col
       warning('Length of the lower bound text vector is smaller than the amount of columns. the last value is reproduced.')
      LowerBoundText=[LowerBoundText, repelem(LowerBoundText(end),col-length(LowerBoundText))];
   end
end

%Checks if the floorLowerValues has the right size
if length(floorLowerValues) ~= 1 
   if length(floorLowerValues) > col
      warning('Length of the floor lower values vector is greater than the amount of columns. the last values are ignored.')
      floorLowerValues=floorLowerValues(1:col);
      
   elseif length(floorLowerValues)< col
       warning('Length of the floor lower values vector is smaller than the amount of columns. the last value is reproduced.')
      floorLowerValues=[floorLowerValues, repelem(floorLowerValues(end),col-length(floorLowerValues))];
   end
end


%if floorLowerValues is active, we set all Values in the DataTable which
%are smaller than the lowerBound to NaN

if length(floorLowerValues)==1
   if floorLowerValues ~=0
        if length(lowerBound)==1
           Data(Data<lowerBound)=NaN;
        else
           for i=1:col
               DataLine=Data(:,i);
               Data(DataLine<lowerBound(i),i)=NaN;
           end    
        end
   end
else
    for i=1:col
       if floorLowerValues(i) ~=0
           if length(lowerBound)==1
               DataLine=Data(:,i);
               Data(DataLine<lowerBound,i)=NaN;
           else
               DataLine=Data(:,i);
               Data(DataLine<lowerBound(i),i)=NaN;
           end
       end
   end   
end




%Amount of lines and columns 
[AmountOfLines,AmountOfCategories]=size(Data);

%If one pivot line has been choosen, all columns were divided by the
%coresponding line value to set the constant line to 1. if no pivot line is
%choosen, the dividend is 1 to let everything as it is.
if pivot >0
PivotFactor=Data(pivot,:);
else
    PivotFactor=ones(1,AmountOfCategories);
end

%if the pivot factor is NaN (no value avaliable), the pivot value is set to
%halfway below the minimum line to shift the lower bound to the constant line
if length(lowerBound) == 1
    PivotFactor(isnan(PivotFactor))=lowerBound*lowerDisplayFactor;
else
    lowerBoundVector=lowerBound*lowerDisplayFactor;
    PivotFactor(isnan(PivotFactor))=lowerBoundVector(isnan(PivotFactor));
end

%Computes the greatest "real" value on the plot
GreatestElement=max(Data);
GraetestRelativeElement=GreatestElement./PivotFactor;
[GreatestAbsolutElement]=max(GraetestRelativeElement);
CeilOfScale=(GreatestAbsolutElement*PivotFactor);

%Computes the lowest "real" value on the plot
LowestElement=min(Data);
LowestRelativeElement=LowestElement./PivotFactor;
[LowestAbsolutElement]=min(LowestRelativeElement);
FloorOfScale=(LowestAbsolutElement*PivotFactor);


%Plots the grid lines of each column 
for i =1:AmountOfCategories
    if ~isnan(CeilOfScale(i))
        
        %Plots just full 10^n blocks
        LowerPowerBound=floor(log10(lowerDisplayFactor*FloorOfScale(i)));
        UpperPowerBound=ceil(log10(upperDisplayFactor*CeilOfScale(i)));
        
        
        %range of grid lines
        Power=LowerPowerBound:(UpperPowerBound-1);       
        
        %Values of the lines
        Matrix=((((1:10)').*(10.^(Power)))')/PivotFactor(i);

        %Lines that appears in black
        MatrixFett=Matrix(:,1);


        [a,b]=size(Matrix);
        
        %Puts all values in one column
        Matrix=reshape(Matrix,(a*b),1);
        
        %plots all lines in gray
        semilogy(repmat([i,i+1],a*b,1)',repmat(Matrix,1,2)','Color',[0.5,0.5,0.5]);  
        hold on
        
        %plots the 10^n lines in black
        semilogy(repmat([i,i+1],a,1)',repmat(MatrixFett,1,2)','k');
    end
end


%The relative values for the plot command
DataDisplay=zeros(AmountOfLines,AmountOfCategories);


%Computes the relative values for the plot command
for i = 1:AmountOfCategories
    
   DataDisplay(:,i)=Data(:,i)./PivotFactor(i);
   
   %Computes the PointOutputMatrix
   for j = 1: AmountOfPoints
      if (PointMatrix(j,1)>= i && PointMatrix(j,1)< i+1) || (i == AmountOfCategories && PointMatrix(j,1)>= i && PointMatrix(j,1)<= i+1)
          PointOutputMatrix(j,1)=PointMatrix(j,1);
          PointOutputMatrix(j,2)=PointMatrix(j,2)./PivotFactor(i);
      end
   end
   
   
   %if the pivot element is NaN, all other NaN values were set to 1 (to
   %put the lower bound to 1 to get a constant line
   if pivot >0 && isnan(DataDisplay(pivot,i))
       DataDisplay(isnan(DataDisplay(:,i)),i)=1;
   end
end

%plots the vertical lines beetween and in the middle of each column
for i=1:AmountOfCategories   

    
    semilogy([i,i],[LowestAbsolutElement*lowerDisplayFactor,GreatestAbsolutElement*upperDisplayFactor],'Color','k'); 
    semilogy([i+0.5,i+0.5],[LowestAbsolutElement*lowerDisplayFactor,GreatestAbsolutElement*upperDisplayFactor],'Color',[0.5,0.5,0.5]);   

    %plots the last vertical line
    if i==AmountOfCategories
        semilogy([i+1,i+1],[LowestAbsolutElement*lowerDisplayFactor,GreatestAbsolutElement*upperDisplayFactor],'Color','k'); 
    end
end


%Deletes the description of the y axis
set(gca,'ytick',[]); 

%Sets the scale of the xlim from 1 to AmountOfCategories+1 (that just the
%columns are visible)
set(gca,'xlim',[1,AmountOfCategories+1]); 

%Sets the scale of the ylim from the lowest element time display factor to
%the greatest element time display factor
set(gca,'ylim',[LowestAbsolutElement*lowerDisplayFactor,GreatestAbsolutElement*upperDisplayFactor]); 

%Sets the column names
if ischar(columns) && strcmp(columns,'all')
    if ~warningCaptions
        set(gca,'xtick',(1:AmountOfCategories)+0.5,'xticklabel',DataTable.Properties.VariableDescriptions,'TickLabelInterpreter','tex','FontSize',FontSize);
    else
        set(gca,'xtick',(1:AmountOfCategories)+0.5,'xticklabel',DataTable.Properties.VariableNames,'TickLabelInterpreter','tex','FontSize',FontSize);
    end
else
    if ~warningCaptions
        set(gca,'xtick',(1:AmountOfCategories)+0.5,'xticklabel',DataTable.Properties.VariableDescriptions(columns),'TickLabelInterpreter','tex','FontSize',FontSize);
    else
        set(gca,'xtick',(1:AmountOfCategories)+0.5,'xticklabel',DataTable.Properties.VariableNames(columns),'TickLabelInterpreter','tex','FontSize',FontSize);
    end
end

%Sets the xaxis location
set(gca,'xaxisLocation','top');

%Sets the NaN values to the lower display boundary
DataDisplay(isnan(DataDisplay))=LowestAbsolutElement*lowerDisplayFactor;

%Resets the color order to make plot colors reproducable
set(gca,'ColorOrderIndex',1);
%Plots the actual lines
for i=1:AmountOfLines
    
    %Gets the plot properties and parses them.
    PlotProperties=cell(1,NumberOfPlotProperties);
    for j = 1 : NumberOfPlotProperties
        [lengthOfArgument,~]=size(varargin{j});
        
        %if the length of the argument ist 1 (for each line the same
        %properties)
        if lengthOfArgument == 1
            PlotProperties{j}=varargin{j};
        %if the user chose different properties for each line
        else
            Liste=varargin{j};
            PlotProperties{j}=Liste(i,:);
        end
    end
     
    %Plots the line with the properties and the name in the first column
    if ischar(rows) && strcmp(rows,'all')
        fig = semilogy((1:AmountOfCategories)+0.5,DataDisplay(i,:),PlotProperties{1:NumberOfPlotProperties},'DisplayName',char(RowCaptions(i,1).Variables));
    else
        fig = semilogy((1:AmountOfCategories)+0.5,DataDisplay(i,:),PlotProperties{1:NumberOfPlotProperties},'DisplayName',char(RowCaptions(rows(i),1).Variables));
    end
    %Sets the tooltip to value and element
    fig.DataTipTemplate.DataTipRows(2).Label = 'value';
    fig.DataTipTemplate.DataTipRows(1).Label = 'element';
    
    %Sets the element value for the tooltip corresponding to the column
    if ischar(columns) && strcmp(columns,'all')
        fig.DataTipTemplate.DataTipRows(1).Value = DataTable.Properties.VariableNames;
    else
        fig.DataTipTemplate.DataTipRows(1).Value = DataTable.Properties.VariableNames(columns);
    end
    
    %Sets the tooltip value to the data value
    fig.DataTipTemplate.DataTipRows(2).Value = Data(i,:);
    
    %Sets the data tooltip of the NaN values to lowerBound*lowerDisplayFactor
    if length(lowerBound)==1
    fig.DataTipTemplate.DataTipRows(2).Value(isnan(fig.DataTipTemplate.DataTipRows(2).Value)) = lowerBound*lowerDisplayFactor;
    else
        fig.DataTipTemplate.DataTipRows(2).Value(isnan(fig.DataTipTemplate.DataTipRows(2).Value)) = lowerBoundVector(isnan(fig.DataTipTemplate.DataTipRows(2).Value));
    end
    %Sets the legend position
    if i== 1 && ~strcmp(LegendPos,'none')
       legend(fig,'Location',LegendPos,'NumColumns',LegendColumns,'FontSize',FontSize) 
    end

end
 
%Sets the title if choosen
if createTitle
    title(titleName);
end

%Sets the texts of the 10^n lines and the lower bound
for i =1:AmountOfCategories
    if ~isnan(CeilOfScale(i))
        
        %Computes the space of displaying
        LowerPowerBound=floor(log10(lowerDisplayFactor*FloorOfScale(i)));

        UpperPowerBound=ceil(log10(upperDisplayFactor*CeilOfScale(i)));
        
        
        Power=LowerPowerBound:(UpperPowerBound);
        
        %Plots the 10^n texts, if they are in range
        for j=1:length(Power)
            if 10.^(Power(j))/PivotFactor(i)>= LowestAbsolutElement*lowerDisplayFactor*2 && 10.^(Power(j))/PivotFactor(i)<= GreatestAbsolutElement*upperDisplayFactor/2
                t=text(i+0.5,10.^(Power(j))/PivotFactor(i),num2str(10.^(Power(j))),'FontSize',FontSize);%,'Parent',axHidden);      
                t.HorizontalAlignment ='center';
                t.VerticalAlignment ='bottom';
            end

        end
        
        %Plots the NaN boundary texts
        if length(lowerBound)==1
            lowerBoundI=lowerBound;
        else
            lowerBoundI=lowerBound(i);
        end
        %plots of just LowerBoundText is 1
        if length(LowerBoundText)==1
            if pivot >0 && isnan(Data(pivot,i))
                %if the pivot was NaN in red to vertical 1 
                if LowerBoundText == 1
                    t=text(i+0.5,1,strcat('<',num2str(lowerBoundI)),'Color','r','FontSize',FontSize);
                    t.HorizontalAlignment ='center';
                    t.VerticalAlignment ='bottom';
                end
            else
                if LowerBoundText == 1
                    %else to the bottom of the display
                    t=text(i+0.5,LowestAbsolutElement*0.5,strcat('<',num2str(lowerBoundI)),'FontSize',FontSize);
                    t.HorizontalAlignment ='center';
                    t.VerticalAlignment ='bottom';
                end
            end
        else
            if pivot >0 && isnan(Data(pivot,i))
                %if the pivot was NaN in red to vertical 1 
                if LowerBoundText(i) == 1
                    t=text(i+0.5,1,strcat('<',num2str(lowerBoundI)),'Color','r','FontSize',FontSize);
                    t.HorizontalAlignment ='center';
                    t.VerticalAlignment ='bottom';
                end
            else
                if LowerBoundText(i) == 1
                    %else to the bottom of the display
                    t=text(i+0.5,LowestAbsolutElement*0.5,strcat('<',num2str(lowerBoundI)),'FontSize',FontSize);
                    t.HorizontalAlignment ='center';
                    t.VerticalAlignment ='bottom';
                end
            end
        end
    end
end


%Sets the window to the given resolution
set(gcf, 'Position', FigureSize); 

%If the figure should be exported, it will export here
if Print
    print(PrintPath,PrintProp)
end

%if AmountofPoints is greater then zero, produce the output of the PointOutputMatrix
if AmountOfPoints >0
    varargout={PointOutputMatrix};
end
    

