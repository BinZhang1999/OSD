function [uEsti, vEsti] = osdDecoding(osdSetting, r)
% see the reference:
% Soft-Decision Decoding of Linear Block Codes Based on Ordered Statistics
% Trans. Information Theory 1995.
%% 
G = osdSetting.G;
orderL = osdSetting.orderL;
shiftIndexCell = osdSetting.shiftIndexCell;
listSizeSegment = osdSetting.listSizeSegment;
dH = osdSetting.dH;

%% Perform hard decision decoding 
[k, n] = size(G);
vEsti = nan(1,n);
uEsti = nan(1,k);
rAbs = abs(r);
% first permutation
[~, lambda1] = sort(rAbs, 'descend');
y = r(lambda1);
GTemp = G(:,lambda1);
% second permutation
[GTemp, indexColPivot, ~] = getEchelonMatrix(GTemp);
GTemp =  backSubstitution(GTemp, indexColPivot, k);
indexColFree = setdiff((1:n),indexColPivot);
lambda2 = nan(1, n);
lambda2(1:k) = indexColPivot;
lambda2(k+1:n) = indexColFree;
G1 = GTemp(:,lambda2);
z = y(lambda2);
% hard decision decoding
message = (z(1:k) < 0);
a = mod(message * G1, 2);
%% Reprocessing
x = 1-2*a;

sigmaInfoPart = -(x(1:k).*z(1:k)); % infomation part sigma always be negative
sigmaCheckPart = -(x(k+1:end).*z(k+1:end));
isPositive = (sigmaCheckPart>0);
isNegative = (sigmaCheckPart<0);

P = G1(:,k+1:end);
% costFunction = -0.5 * sum(x.*z);
deltaMax = 0; % record the maximum changed value 
% deltaj = costFunction - deltaMax;
iPhaseMax = nan; % record the phase who brings the maximum changed value
iListMax = nan; % record the iList who brings the maximum changed value at iPhaseMax

for iPhase = 1:orderL
    if isOptimalNow(sigmaInfoPart, sigmaCheckPart, isPositive, isNegative, dH, iPhase)
        break;
    end
    shiftIndexArray = shiftIndexCell{1,iPhase};
    for iList = listSizeSegment(iPhase):-1:1  % from right to left
        shiftIndex = shiftIndexArray(iList,:);
        
        deltaTemp = sum(sigmaInfoPart(shiftIndex));
        isShiftCheck= logical(mod(sum(P(shiftIndex,:),1),2));
        deltaTemp = deltaTemp + sum(sigmaCheckPart(isShiftCheck));
        
        if deltaTemp > deltaMax
            iPhaseMax = iPhase; iListMax = iList;
            deltaMax = deltaTemp;
        end
    end
end

if ismissing(iPhaseMax)
    vEsti(:) = a;
    uEsti(:) = a(1,k);
else
    shiftIndexArray = shiftIndexCell{1,iPhaseMax};
    shiftIndex = shiftIndexArray(iListMax,:);
    vEsti(1:k) = a(1:k);
    vEsti(shiftIndex) =  mod(a(shiftIndex)+1,2);
    uEsti = vEsti(1:k);
    vEsti(k+1:n) = mod(uEsti * P,2);
end

vEsti(lambda2) = vEsti;
vEsti(lambda1) = vEsti;
end

function isOptimal  = isOptimalNow(sigmaInfoPart, sigmaCheckPart, isPositive, ...
    isNegative, dH, iPhase)
nDminus = max(0, dH-sum(isPositive)-(iPhase+1));
sigmaDRminus = sort(sigmaCheckPart(isNegative), 'descend');
Ravailable = sum(sigmaCheckPart(isPositive))+sum(sigmaDRminus(1:nDminus));
isOptimal = (Ravailable <= -sigmaInfoPart(end-iPhase-1:end));
end
