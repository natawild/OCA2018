 vrpnc1  % Loads XY, q, Q, ld, and maxTC
 h = pplot(XY,'r.');
 pplot(XY,num2cellstr(1:size(XY,1)))
 [loc,TC,bvtx] = vrpsweep(XY,[],{q,Q},{ld},{'maxTCfeas',maxTC},h)
 
