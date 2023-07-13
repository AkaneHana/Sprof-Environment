

clc
clear all
% input the location of Sprof-Environment
workPath=['/Users/apple/Downloads/Sprof-Environment-main'];
addpath([workPath,'/list']);
cd(workPath);
setup_nctoolbox
[filename, pathname, ~] = uigetfile('_Sprof.nc');%obtain the .Sprof file by selecting files in the file selection dialog
fileslist = dir(pathname);isub = [fileslist(:).isdir];
nameFolds = {fileslist(:).name}';nameFolds(ismember(nameFolds,{'.','..','.DS_Store'})) = [];
%add .DS_Store if using Mac system
MAT = Sprof2mat(pathname, filename);

