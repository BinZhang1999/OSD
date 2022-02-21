%% Code parameters
r=4;m=7;
% k = 35; n=128;
%% Generate Code
code = CODE_RM;
code = code.Init(r,m);
% code = CODE_RANDOM;
% code = code.Init(k,n);
G = code.G;
%% Generate Decoder
decoder = DECODER_AWGN_OSD;
decoder = decoder.Init(G, 8, 2); % osd-2


%% Simulation Settings
% over awgn channel

simulationSetting.EbNoArray = 3.5:0.25:5.0;
simulationSetting.MIN_NUM_ERROR_FRAME = 100;
simulationSetting.displayName = 'displayName = ''osd-4 projected code'';';
simulationSetting.description = '% OSD-2 Algorithm';
% simulationResult = parSimulationAWGN(simulationSetting, G, decoder);
simulationResult = simulationAWGN(simulationSetting, G, decoder);

