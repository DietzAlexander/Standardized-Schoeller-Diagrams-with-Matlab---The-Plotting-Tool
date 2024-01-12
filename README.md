[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=DietzAlexander/Standardized-Schoeller-Diagrams-with-Matlab---The-Plotting-Tool&file=README.md)

# Standardized-Schoeller-Diagrams-with-Matlab---The-Plotting-Tool
Water analyses typically result in numerous characteristic values. The bunch of parameters hamper temporal or spatial comparisons of different samples. In order to facilitate the evaluation and interpretation of hydrochemical data, hydrogeologists use various special diagrams. One of them is the Schoeller diagram, in which the concentrations of different chemical species are plotted on logarithmic scales. Entries of an analysis are connected and form a characteristic signature. In the Schoeller diagram, parallel or subparallel signatures indicate relatedness of waters. Here we present the idea of standardized Schoeller diagrams: different logarithmic axes are shifted with respect to each other so that the signatures of a selectable sample forms a straight line.

For this application, we have developed a plot tool that allows standardized Schoeller diagrams, such as the example above, to be plotted with minimal effort and only one command in the Matlab programming environment. All required files, including the program code of the plot command, a detailed tutorial, as well as sample commands for all plots of the tutorial can be found in this collection:

User manual: Standardized Schoeller Diagrams with Matlab - A User Manual.pdf

Main code file: plotSchoeller.m

Example commands of all figures in the manual: createAllFigures.m

Example dataset used in the manual: ExampleDataSet.xlsx

----------------------------------------------------------------------
 Contact and Licence
----------------------------------------------------------------------

 For any suggestions concerning the code or the manual you can write to

      dietz@mathematik.tu-darmstadt.de

 and for any suggestions concerning (standardized) Schoeller diagrams to

      rafael.schaeffer@tu-darmstadt.de

 The original source of this code file is

 https://doi.org/10.48328/tudatalib-877

 There you can find a manual and additional information.

 The matlab code and the manual are published under the CC-BY license. 
 The tool and any graphics, created with this plotting tool, can be used 
 by naming the corresponding publication:

  Schäffer, R., Dietz, A. (2023): Standardized Schoeller diagrams — 
  A Matlab plotting tool. Grundwasser 28, 345–355. 
  https://doi.org/10.1007/s00767-023-00556-3
