%% Code parameters
r=4;m=7;

%% Generate Code
code = CODE_RM;
code = code.Init(r,m);

%% Generate Decoder
decoder = DECODER_AWGN_OSD;
decoder = decoder.Init(code.G, 8, 2); % osd-2

% chase
decoderChase = DECODER_AWGN_CHASE_LIST;
bitWidthChase = 6; 
decoderChase = decoderChase.Init(bitWidthChase, decoder, code.K, code.N);
%% Simulation Settings
% over awgn channel
G = code.G;
simulationSetting.EbNoArray = 3.0;
simulationSetting.MIN_NUM_ERROR_FRAME = 100;
simulationSetting.displayName = 'displayName = ''osd-2'';';
simulationSetting.description = 'OSD-2 Algorithm';
simulationResult = parSimulationAWGN(simulationSetting, G, decoder);
% simulationResult = simulationAWGN(simulationSetting, G, decoder);

