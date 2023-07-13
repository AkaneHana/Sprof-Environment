function MAT = Sprof2mat(pathname, filename)

disp( 'Loading Argo data to MATLAB' );
setup_nctoolbox;
ymdhms = [1950, 1, 1, 0, 0, 0];%start cont date
info_hdr = {'JULD', 'CYCLE_NUMBER', 'LONGITUDE', 'LATITUDE',...
    'PRES', 'TEMP', 'PSAL',...
    'DOXY', 'NITRATE', 'CHLA',...
    'BBP532', 'BBP700', 'CDOM', 'CP660',...
    'DOWN_IRRADIANCE380', 'DOWN_IRRADIANCE412', 'DOWN_IRRADIANCE443',...
    'DOWN_IRRADIANCE490', 'DOWNWELLING_PAR', 'PH_IN_SITU_TOTAL',...
    'DOXY_ADJUSTED', 'NITRATE_ADJUSTED', 'CHLA_ADJUSTED'};
% gm=[pathname, filename]
% ds = ncdataset(gm);
ds = ncdataset([pathname, filename]);
PRES = double(ds.data(info_hdr{5}))';[a, b] = size(PRES);


for i = 5: length(info_hdr)
    try
        data_tmp = double(ds.data(info_hdr{i}))';
        data(:, i+4) = reshape(data_tmp, a*b, 1);clear data_tmp
    catch
        data(:, i+4) = nan*ones(a*b, 1);
    end
end


for i = 1: 4
    track_tmp = double(ds.data(info_hdr{i}));data_tmp= [];
    for j =1: b
        track_tmp2 = track_tmp(j)*ones(a, 1);
        data_tmp = [data_tmp; track_tmp2];
        clear track_tmp2
    end
    if i == 1 %ת��Ϊ����
        SDN = (double(data_tmp)+ datenum(ymdhms));
        [Y, M, D, H, Mi, S]=datevec(SDN);
        data(:, 1:5) = [Y, M, D, H, Mi];
    else
        data(:, i+4) = reshape(data_tmp, a*b, 1);clear data_tmp
    end
end
data(isnan(data(:, 9)),:) = [];%ɾ�����Ϊ���Ļ�����
MAT.data = data;

%convert mat to txt
floatID = filename(1: 7);
filename =[pathname, floatID, '.txt'];
disp(['Printing Argo data to : ', pathname]);
MAT.hdr= {'Year', 'Month', 'Day', 'Hour', 'Minute', 'Profile', 'Lon', 'Lat' ,...
    'Pressure[dbar]', 'Temperature[C]', 'Salinity[pss]',...
    'Oxygen[umol/kg]', 'Nitrate[umol/kg]', 'Chla[mg/m^3]',...
    'bbp532[1/m]', 'bbp700[1/m]', 'CDOM[ppb]', 'CP660[1/m]' ,...
    'DOWNIRRAD380[W/m^2/nm]', 'DOWNIRRAD412[W/m^2/nm]', 'DOWNIRRAD443',...
    'DOWNIRRAD490[W/m^2/nm]', 'DOWNPAR[W/m^2/nm]', 'pHinsitu[Total]',...
    'NitrateADJUSTED[umol/kg]', 'ChlaADJUSTED[mg/m^3]', 'OxygenADJUSTED[umol/kg]'};%headers
mat2txt(filename, MAT.hdr, MAT.data);

end