
I=[1 1 2 2 2 3 3 4 4 5 5 6 ];	
J=[2 3 3 4 5 4 6 5 6 6 7 7 ];	
W=[5 2 6 4 8 1 10 7 9 3 9 4 ];	
DG=sparse(I, J, W, 7, 7)	

UG0 = (DG + DG')
full(UG0)
UG = tril(DG + DG')
full(UG)
view(biograph(UG,[],'ShowArrows','off','ShowWeights','on'))
[ST,pred] = graphminspantree(UG)
view(biograph(ST,[],'ShowArrows','off','ShowWeights','on'))