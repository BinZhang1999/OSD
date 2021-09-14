OSD2DecodeRandomCode128_35;
OSD2DecodeProjectedCode128_35;
%%
ax = gca;
ax.FontWeight = 'bold';
ax.LineWidth = 0.75;
ax.Box = 'on';
ax.GridAlpha = 0.3;
grid(ax,'on');

axis([2.5 4 1e-4 1e-0]);
xlabel('E_b/N_0 (dB)');ylabel('BLER');
title('(128, 35)');
legend;
function OSD2DecodeRandomCode128_35
displayName = 'random code osd-2';
% OSD-2 Algorithm
% Running time duration at this EbNo: 142.276s
% Error frame number at this EbNo: 100
% Eb/No = 4 dB
% N = 128 K = 35
% EbNo    wer    ber
data = [...
 2.5     0.03391    0.016632
2.75    0.019727    0.009375
   3     0.01166   0.0059135
3.25    0.007774    0.003754
 3.5   0.0049316    0.002433
3.75   0.0029537   0.0014406
   4   0.0013298  0.00068275
];
EbNo = data(:,1); wer = data(:,2); ber = data(:,3);
semilogy(EbNo, wer, '-o', 'Linewidth', 1.5,'DisplayName',displayName); hold on;
end

function OSD2DecodeProjectedCode128_35
displayName = 'projected code osd-2';
% OSD-2 Algorithm
% Running time duration at this EbNo: 128.6754s
% Error frame number at this EbNo: 100
% Eb/No = 4 dB
% N = 128 K = 35
% EbNo    wer    ber
data = [...
 2.5    0.036337    0.018625
2.75    0.023098    0.011646
   3    0.013843   0.0069079
3.25    0.007585   0.0037925
 3.5   0.0045554   0.0022686
3.75   0.0026129   0.0013087
   4   0.0014256  0.00071323
];
EbNo = data(:,1); wer = data(:,2); ber = data(:,3);
semilogy(EbNo, wer, '-o', 'Linewidth', 1.5,'DisplayName',displayName); hold on;
end