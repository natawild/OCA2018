vrpnc1  % Loads XY, q, Q, ld, and maxTC
 C = dists(XY,XY,2);
 h = pplot(XY,'r.');
 pplot(XY,num2cellstr(1:size(XY,1)))
 [loc,TC] = vrpsavings(C,{q,Q},{ld},{'maxTCfeas',maxTC},[],h);
  [loc1,TC1] = vrpcrossover(loc,C,{q,Q},{ld},{'maxTCfeas',maxTC},h);