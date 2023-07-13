

clc
clear all
% workPath=[getenv('UserProfile'), '\Desktop'];
workPath=['/Users/apple/Downloads/Sprof Environment'];
addpath([workPath,'/list']);
cd(workPath);
setup_nctoolbox
[filename, pathname, ~] = uigetfile('_Sprof.nc');%obtain the .Sprof file by selecting files in the file selection dialog
fileslist = dir(pathname);isub = [fileslist(:).isdir];
nameFolds = {fileslist(:).name}';nameFolds(ismember(nameFolds,{'.','..','.DS_Store'})) = [];
%add .DS_Store if using Mac system
MAT = Sprof2mat(pathname, filename);

