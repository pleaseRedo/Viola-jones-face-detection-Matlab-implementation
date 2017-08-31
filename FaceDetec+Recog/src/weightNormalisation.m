

sumWeight = sum([haarFeatureNonfaceVolume{:,6}])+ sum([haarFeatureVolume{:,6}]);
for i = 1:length(haarFeatureNonfaceVolume)
haarFeatureNonfaceVolume{i,6} = haarFeatureNonfaceVolume{i,6}/sumWeight;


end

for i = 1:length(haarFeatureVolume)
haarFeatureVolume{i,6} = haarFeatureVolume{i,6}/sumWeight;


end