param nPaletes;
param nNiveis;

set v1:={i in 1.. nPaletes}; # v1 representa Origem
set v2:={j in 1.. nNiveis}; # v2 representa Destino

param PALETES{i in v1,k in 1..4};
param NIVEIS{j in v2,k in 1..3};

var x{i in v1,j in v2} binary; #  variavel de decisao que define em que alveolo e colocada uma palete i palete, alveolo j 

#funcao que minimiza as distancias--- fase 2 -> minimizar tempo
minimize CustoMovimentacao: sum{i in v1, j in v2} ((NIVEIS[j,1])* x[i,j]) *(PALETES[i,4]);

# Restricoes
s.t. ArmzPal {i in v1} : sum {j in v2} x[i,j] = 1; 
s.t. OcupNiv {j in v2} : sum {i in v1} PALETES[i,3]*x[i,j] <= NIVEIS[j,2];

