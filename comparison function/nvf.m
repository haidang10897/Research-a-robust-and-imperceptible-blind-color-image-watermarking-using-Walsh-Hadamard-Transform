function [NVF,varargout]=nvf(x)
% ______             ______            
% | ___ \            |  _  \           
% | |_/ / __ _  ___  | | | |__ _ _   _ 
% | ___ \/ _` |/ __| | | | / _` | | | |
% | |_/ / (_| | (__  | |/ / (_| | |_| |
% \____/ \__,_|\___| |___/ \__,_|\__,_|
%                                      

% ####################### Author's information ######################
% # Name: Tran Hai Dang - Bac Dau                                   #
% # Class: AT12ET - AT120515 - Academy of Cryptography Techniques   #
% # Contact: FB - tran.h.dang.54                                    #
% #          Email - haidangtran97@gmail.com                        #
% ###################################################################

% Input: 
% x: matrices
% Output: NVF

% Th0: Th0 is contrast sensitivity (Th|range:50-1000);
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

end