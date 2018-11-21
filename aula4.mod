# numero de vertices 
param vertices; 
# numero de arcos 
param arcos;
param matriz{i in 1..vertices, j in 1..arcos};

#variavel decisao 

var x{j in 1..arcos} binary;

#funcao objectivo max emparelhamento 

maximize profit: sum{j in 1..arcos} x[j];

#garante que (para cada vertice) somente um arco incidente no vertice i é escolhido para o emparelhamento 

subject to cobertura {i in 1..vertices}: sum{j in 1..arcos} x[j]*matriz[i,j] <= 1;n