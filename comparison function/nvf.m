function [NVF,varargout]=nvf(x)

% Input: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x:
% nhood: Local window size for the calculation of the local mean and the
%        local variance.
% Th0: Th0 is contrast sensitivity (Th|range:50-1000) Th=150;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NVF: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Th0=50;
    % Default value for nhood.
    nhood=[3 3];

    % Local mean and local variance calculation.
    LocalMean=filter2(ones(nhood),x)/prod(nhood);
    LocalVar=filter2(ones(nhood),x.^2)/prod(nhood)-LocalMean.^2;

    % Contrast sensitivity.
    Th=Th0/max(LocalVar(:));

    % NVF calculation.
    NVF=1./(1+Th*LocalVar);

    % Normalization of NVF to be in the range of (0;1).
    %NVF=NVF/max(NVF(:));    
    

end