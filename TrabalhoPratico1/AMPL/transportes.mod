#Apenas para problemas equilibrados (balanceados= - quantidade na origem igual a do destino
param Norigens;
param Ndestinos;
set ORIG :={i in 1..Norigens}; # O representa ORIGEM
set DEST :={j in 1..Ndestinos}; # D representa DESTINO

param Custo {i in ORIG, j in DEST }; 
param QtdO {i in ORIG};
param QtdD {j in DEST};

var x {i in ORIG, j in DEST}, >=0;

minimize CustoTransporte: sum {i in ORIG, j in DEST} Custo [i,j] * x[i,j];

s.t. QddORI {i in ORIG}: sum {j in DEST} x[i,j] = QtdO [i]; #restricoes
s.t. QddDES {j in DEST}: sum {i in ORIG} x[i,j] = QtdD [j];