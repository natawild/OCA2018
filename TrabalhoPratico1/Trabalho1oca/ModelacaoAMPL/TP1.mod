param vertices;

param Norigens;
param Ndestinos;

set ORIG :={i in 1..Norigens}; # O representa ORIGEM
set DEST :={j in 1..Ndestinos}; # D representa DESTINO
param QtdO {i in ORIG}; #ARRAY
param QtdD {j in DEST};

param matriz{i in 1..vertices, j in 1..vertices};
param custos{i in ORIG, j in DEST};

var y {i in ORIG, j in DEST}, >=0;


#Funcao OBJETIVO
minimize CustoTransporte:sum {i in ORIG, j in DEST} custos [i,j] * y[i,j]; 



#restricoes
s.t. QddORI {i in 1..5}: sum {j in DEST} matriz[i,j]*y[i,j] = QtdO [i];
s.t. QddDES {j in 16..20}: sum {i in ORIG} matriz[i,j]*y[i,j] = QtdD [j];

#conservacao fluxo
s.t. conser {i in 6..15 } : sum {j in ORIG} matriz[j,i]* y[j,i] - sum{j in DEST} matriz[i,j]* y[i,j]=0;



