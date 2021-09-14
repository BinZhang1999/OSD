function osdSetting = setOsdDecoder(G, dH, orderL)

osdSetting.G = G;
[k,~]=size(G);
osdSetting.orderL = orderL;
osdSetting.listSize = 1;
osdSetting.listSizeSegment = nan(orderL, 1);
osdSetting.shiftIndexCell = cell(1,orderL);
osdSetting.dH = dH;
for iL = 1:orderL
     osdSetting.listSizeSegment(iL) = nchoosek(k,iL);
     osdSetting.listSize = osdSetting.listSizeSegment(iL) + osdSetting.listSize;
     osdSetting.shiftIndexCell{1,iL} = nchoosek(1:k,iL);
end
end