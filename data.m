OSD2DecodeRandomCode128_35;
OSD2DecodeProjectedCode128_35;
OSD3DecodeRandomCode128_35;
OSD3DecodeProjectedCode128_35;
OSD4DecodeRandomCode128_35;
OSD4DecodeProjectedCode128_35;
%%
ax = gca;
ax.FontWeight = 'bold';
ax.LineWidth = 0.75;
ax.Box = 'on';
ax.GridAlpha = 0.3;
grid(ax,'on');

axis([1.5 4 1e-4 1e-0]);
xlabel('E_b/N_0 (dB)');ylabel('BLER');
title('(128, 35)');
legend;
function OSD2DecodeRandomCode128_35
displayName = 'osd-2 random code';
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
displayName = 'osd-2 projected code';
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


function OSD3DecodeRandomCode128_35
displayName = 'osd-3 random code';
% OSD-2 Algorithm
% Running time duration at this EbNo: 1087.6988s
% Error frame number at this EbNo: 77
% Eb/No = 3.25 dB
% N = 128 K = 35
% EbNo    wer    ber
data = [...
 2.5   0.005314626   0.002672498
2.75   0.003241701   0.001596769
   3    0.00182535  0.0008991155
3.25  0.0007988878  0.0003978135
 3.5           NaN           NaN
3.75           NaN           NaN
   4           NaN           NaN
];
EbNo = data(:,1); wer = data(:,2); ber = data(:,3);
semilogy(EbNo, wer, '-o', 'Linewidth', 1.5,'DisplayName',displayName); hold on;
end

function OSD3DecodeProjectedCode128_35
displayName = 'osd-3 projected code';
% OSD-2 Algorithm
% Running time duration at this EbNo: 2556.876s
% Error frame number at this EbNo: 88
% Eb/No = 3.5 dB
% N = 128 K = 35
% EbNo    wer    ber
data = [...
 2.5   0.004568713   0.002169486
2.75   0.002544788   0.001233859
   3   0.001252003  0.0006206359
3.25  0.0007426331  0.0003742871
 3.5  0.0003730331  0.0001865165
3.75           NaN           NaN
   4           NaN           NaN
];
EbNo = data(:,1); wer = data(:,2); ber = data(:,3);
semilogy(EbNo, wer, '-o', 'Linewidth', 1.5,'DisplayName',displayName); hold on;
end

function OSD4DecodeRandomCode128_35
displayName = 'osd-4 random code';
% OSD-4 Algorithm
% Running time duration at this EbNo: 6265.6599s
% Error frame number at this EbNo: 74
% Eb/No = 2.5 dB
% N = 128 K = 35
% EbNo    wer    ber
data = [...
 1.5     0.01423    0.007374
1.75   0.0078906   0.0041897
   2    0.003986   0.0020568
2.25   0.0017228  0.00087239
 2.5  0.0009716387  0.0004948229

];
EbNo = data(:,1); wer = data(:,2); ber = data(:,3);
semilogy(EbNo, wer, '-o', 'Linewidth', 1.5,'DisplayName',displayName); hold on;
end

function OSD4DecodeProjectedCode128_35
displayName = 'osd-4 projected code';
% OSD-2 Algorithm
% Running time duration at this EbNo: 1910.477s
% Error frame number at this EbNo: 42
% Eb/No = 2.5 dB
% N = 163 K = 35
% EbNo    wer    ber
data = [...
 1.5    0.018111   0.0088677
1.75    0.012074   0.0060031
   2   0.0066208   0.0032177
2.25   0.0040479   0.0019904
 2.5   0.0022022   0.0011041
];
EbNo = data(:,1); wer = data(:,2); ber = data(:,3);
semilogy(EbNo, wer, '-o', 'Linewidth', 1.5,'DisplayName',displayName); hold on;
end