
function mat2txt(filename,head,thisfile)
%mat2txt(filename,head,thisfile),edit by zhouxiuman in 20200423
%for example
%filename='C:\Users\zhouxiuman\Desktop\2\2902756_qc.txt']; %saved txt's filename
%thisfie;%is the mat data
%head={ 'Year','Month','Day','Hour','Minute','Station','Lon','Lat'}; %title in txt
std_ODV_vars=head;
fid = fopen(filename, 'w+');
b=size(std_ODV_vars,2);%output headline
for i = 1:b
    if i < b
        fprintf(fid,'%s\t',std_ODV_vars{i});
    elseif i== b
        fprintf(fid,'%s\n',std_ODV_vars{i});
    end
end

[a,b]=size(thisfile);%output rawdata
for i = 1:a
    for j=1:b
        if j < b
            fprintf(fid,'%6.6f\t',thisfile(i,j));%精确度6位数
        elseif j == b
            fprintf(fid,'%6.6f\n',thisfile(i,j));%精确度6位数
        end
    end
end
fclose(fid);
clear all