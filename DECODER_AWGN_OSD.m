classdef DECODER_AWGN_OSD
    properties
        osdSetting;
    end
    methods
        function obj = init(obj,G,dH,orderL)
            obj.osdSetting = setOsdDecoder(G, dH, orderL);
        end
        function [uEsti, vEsti] = decode(obj, y, sigma)
            %¡¡[uEsti,vEsti] = hardDecisionDecoding(obj.G,y);
            [uEsti, vEsti] = osdDecoding(obj.osdSetting, ...
                y);
        end
        
    end
    
end