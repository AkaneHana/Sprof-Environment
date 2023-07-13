
%making plots (keep the MAT file from before)
Plot.hdr = {'Temperature[C]', 'Salinity[pss]', 'Chla[mg/m^3]',...
    'Oxygen[umol/kg]', 'Nitrate[umol/kg]'};%give values to this Plot.hdr variable.
iPro = find(strcmp('Profile', MAT.hdr) == 1);
iPre = find(strcmp('Pressure[dbar]', MAT.hdr) == 1);
Pro = unique(MAT.data(:, iPro));%filter values based on the location of header Profile (columns)
%and get the unique values
floatID = filename(1: 7);%the first seven number of sprof.nc file

for i = 1: length(Plot.hdr)  %header length
    for j = 1: length(Pro)%unique profile length
        index = find(Pro(j) == MAT.data(:, iPro));
        data_tmp = MAT.data(index, :);
        iVar = find(strcmp(Plot.hdr{i}, MAT.hdr) == 1);
        Var = data_tmp(:,iVar);
        data_tmp(isnan(Var), :) = [];%delete NaN values in Var
        %----------plot
        figure('units', 'centimeters', 'position', [2, 2, 13, 18]);
        h1 = plot(data_tmp(:, iVar),data_tmp(:, iPre), 'marker', 'o',...
            'markerfacecolor', 'y', 'markeredgecolor',...
            [0.3 0.3 0.3], 'markersize', 4);hold on %plot points
        h2 = plot(data_tmp(:, iVar), data_tmp(:, iPre), 'k',...
            'linestyle', '-', 'LineWidth', 1);%plot lines
        set(gca, 'FontSize', 12, 'Fontname', 'aril', 'linewidth', 1.5,...
            'ygrid', 'on', 'xgrid', 'on', 'YDir', 'reverse');
        ylabel('Pressure[dbar]', 'FontSize', 15, 'FontWeight', 'bold');
        xlabel(Plot.hdr{i}, 'FontSize', 15, 'FontWeight', 'bold');
        title([floatID,' / ', num2str(Pro(j))], 'fontsize', 13);
        dirname = strsplit(Plot.hdr{i}, '[');dirname = dirname{1};
        if ~isdir([pathname, floatID, '/', dirname, '/'])
            mkdir([pathname, floatID, '/', dirname, '/']);
        end
        print('-dpng','-r600',[pathname, floatID, '/', dirname, '/',...
            num2str(Pro(j)), '.png']);%export figures
        close all
    end
end