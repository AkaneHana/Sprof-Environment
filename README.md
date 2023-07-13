# Sprof-Environment
convert Sprof.nc file to txt file and plot each cycle of the chosen biogeochemical parameters

1. the nctoolbox (run setup_nctoolbox.m) MUST be installed before running these m file.
2. We have two main functions:
   **Sprof_to_txt.m **(convert Sprof.nc file to txt and load MAT file in the workspace for subsequent operations)
   **MAT_plot.m **(loops to plot cycles of chosen biogeochemical parameters such as dissolved oxygen, pH, and chl-a)
3. In Sprof_to_txt.m, we did not convert Sprof.nc to txt directly since we need MAT file saved in the workspace as well. We convert Sprof.nc to MAT and then convert MAT to txt file. It might take a while depending on the size of your nc file and your PC's computing speed. Should be finished within ten mins. 
