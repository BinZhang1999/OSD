%% Code parameters
r=4;m=7;
k = 35; n=128;
%% Generate Code
% code = CODE_RM;
% code = code.Init(r,m);
code = CODE_RANDOM;
code = code.Init(k,n);

%% Generate Decoder
decoder = DECODER_AWGN_OSD;
decoder = decoder.Init(G, 4, 4); % osd-2


%% Simulation Settings
% over awgn channel
G = G;
simulationSetting.EbNoArray = 1.5:0.25:2.5;
simulationSetting.MIN_NUM_ERROR_FRAME = 100;
simulationSetting.displayName = 'displayName = ''osd-4 projected code'';';
simulationSetting.description = '% OSD-2 Algorithm';
simulationResult = parSimulationAWGN(simulationSetting, G, decoder);
% simulationResult = simulationAWGN(simulationSetting, G, decoder);

