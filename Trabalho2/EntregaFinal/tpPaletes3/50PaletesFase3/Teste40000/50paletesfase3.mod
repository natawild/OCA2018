param nPaletes;
param nNiveis;

set v1:={i in 1.. nPaletes}; # v1 representa Origem
set v2:={j in 1.. nNiveis}; # v2 representa Destino

param PALETES{i in v1,k in 1..4};
param NIVEIS{j in v2,k in 1..3};

var H {j in v2} , >=0; #assim permite que tenhamos H1,H2,H3,H4 .... (alturas das paletes ) 

var O {j in v2} , binary;
var y >= 0;

var x{i in v1,j in v2} binary; #  variavel de decisao que define em que alveolo e colocada uma palete i palete, alveolo j 

var D {i in v1}, >=0; 
var L {j in v2}, >=0; 
var L1 {j in v2}, >=0; 


#funcao que minimiza as distancias--- fase 2 -> minimizar tempo
#minimize CustoMovimentacao: sum{i in v1, j in v2} (PALETES[i,4]* (NIVEIS[j,1])* x[i,j]);
 
#funcao objetivo que que minimiza o desperdicio (colocar conjuntos de paletes de modo a minimizar a quantidade de rack inutilizada)
#o desperdicio petence a palete-- funcao obj para minimizar desperdicioda altura
minimize desperdicio: sum{i in v1} D[i]+ sum{j in v2} L[j];


# Restricoes
s.t. ArmzPal {i in v1} : sum {j in v2} x[i,j] = 1; #esta palete tem q ser guardada,
s.t. OcupNiv {j in v2} : sum {i in v1} PALETES[i,3]*x[i,j] <= NIVEIS[j,2]; #cabe mais que uma palete em cada alveolo tendo em consideracao larguras


#todas as paletes, de todos os niveis, cada um dos niveis vai ser maior que a maior palete que la esta...(estabelecer uma altura, depois de saber a altura calculamos o desperdicio)
s.t. altura {i in v1,j in v2} : H[j] >=  PALETES[i,2]*x[i,j]; 

#restricao do desperdicio por palete , no gusek nao funciona, no neoserver funciona , 
#o desperdicio pertence a palete para facilitar o problema
#o alveolo esta a ser usado ou nao esta a ser usado
s.t. desp {i in v1, j in v2}: O[j] >= x[i,j];

# calculo do desperdicio da altura
s.t. desperdAlt {i in v1, j in v2} : x[i,j] =1 ==> D[i]= H[j] - PALETES[i,2]; 

# calculo do desperdicio da largura
s.t. desperdLarg {j in v2} : O[j] =1 ==> L[j] >=(3000 - sum {i in v1} PALETES[i,3]*x[i,j]);

#restricao para calcular os tempos, definindo uma variavel aux que toma o valor da funcao obj1
s.t. custoMovAux: y = sum{i in v1, j in v2} (PALETES[i,4]* (NIVEIS[j,1])* x[i,j]);
s.t. tentativa1: y <= 40000;
#s.t. tentativa2: y <=1500;
#s.t. tentativa3: y <=750;
#s.t. tentativa4: y <=600;