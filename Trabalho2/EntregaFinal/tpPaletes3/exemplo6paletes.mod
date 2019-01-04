param nPaletes;
param nNiveis;

set v1:={i in 1.. nPaletes}; # v1 representa Origem
set v2:={j in 1.. nNiveis}; # v2 representa Destino

param PALETES{i in v1,k in 1..4};
param NIVEIS{j in v2,k in 1..3};

var H {j in v2} , >=0; #assim permite que tenhamos H1,H2,H3,H4 .... (alturas das paletes ) 



#Variavel auxiliar para a minimizacao da distancia 
var FO1 , >=0; 


# Variavel auxiliar para a minimizacao do desperdicio 
var FO2 , >=0 ; 

var x{i in v1,j in v2} binary; #  variavel de decisão que define em que alvéolo é colocada uma palete

var D {i in v1}; # para o desperdicio das paletes 1 no alvelo j 

#funcao que minimiza as distancias
#minimize CustoMovimentacao: sum{i in v1, j in v2} (PALETES[i,4]* (NIVEIS[j,1]+ (NIVEIS[j,2]))* x[i,j]);
 
#funcao objetivo que que minimiza o desperdicio (colocar conjuntos de paletes de modo a minimizar a quantidade de rack inutilizada)
 minimize desperdicio : sum {i in v1} D[i]; 
 
 
 # Restrições
s.t. ArmzPal {i in v1} : sum {j in v2} x[i,j] = 1; 
s.t. OcupNiv {j in v2} : sum {i in v1} PALETES[i,3]*x[i,j] <= NIVEIS[j,2];

#restricao da distancias   
s.t. fo1: FO1=  sum{i in v1, j in v2} (PALETES[i,4]* (NIVEIS[j,1]+ (NIVEIS[j,2]))* x[i,j]); 

#restricao das alturas das paletes - a palete maior é a que decide a altura da rack 
s.t. altura {i in v1,j in v2} : H[j] >=  PALETES[i,2]*x[i,j]; 

#restricao do desperdicio por palete , no gusek nao funciona, no neoserver funciona , 

#s.t. desperd {i in v1, j in v2} : x[i,j] =1 ==> D[i]=H[j] - PALETES[i,2]; 



