
param NVertices;
param NOrigens;
param NDestinos;



set O :={i in 1..NOrigens}; # O representa ORIGEM 
set D :={j in 1..NDestinos}; # D representa DESTINO

param QtdO {i in O,j in D};
param QtdD {i in O,j in D};


param NodoArco {i in O, j in D };
param Custo{i in O, j in D };


#  Variavel de decisao 
var x {i in O, j in D}, >=0; 

#Funçao objetivo minimizar
minimize custoTransporte:sum {i in O, j in D} Custo [i,j] * x[i,j];

#restricoes

s.t. QddORI {i in O,j in D}: sum {i in O,j in D} x[i,j] = QtdO [i,j];
s.t. QddDES {i in O,j in D}: sum {i in O,j in D} x[i,j]= QtdD [i,j];
