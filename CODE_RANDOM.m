classdef CODE_RANDOM
   properties
       K;
       N;
       G;
   end
   methods
       function obj = Init(obj, k, n)
           obj.K = k;
           obj.N = n;
            rankOfMatrix = 0;
           while( rankOfMatrix < k)
               obj.G = (randn(k,n)<0);
                [~, ~, rankOfMatrix] = getEchelonMatrix(obj.G);
           end
               
       end
       
   end
end