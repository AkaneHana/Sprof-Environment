# Sprof-Environment
convert Sprof.nc file to txt file and plot each cycle of chosen biogeochemical parameters

1. the nctoolbox (run setup_nctoolbox.m) MUST be installed before running these m file.

   if setup_nctoolbox display 'failed to setup the JAVA classpath' error, go to ...\nctoolbox-master\java\setup_nctoolbox_java.m file
   and disable (comment) the line:
   
root.addAppender(org.apache.log4j.ConsoleAppender(org.apache.log4j.PatternLayout('%d{ISO8601} [%t] %-5p %c %x - %m%n')));

3. We have two main functions:
   **Sprof_to_txt.m **(convert Sprof.nc file to txt and load MAT file in the workspace for subsequent operations)
   **MAT_plot.m **(loops to plot cycles of chosen biogeochemical parameters such as dissolved oxygen, pH, and chl-a)
4. In Sprof_to_txt.m, we did not convert Sprof.nc to txt directly since we need MAT file saved in the workspace as well. We convert Sprof.nc to MAT and then convert MAT to txt file. It might take a while depending on the size of your nc file and your PC's computing speed. Should be finished within ten mins. 
