param vertices;

param origem;

param destino;

param matriz{i in 1..vertices, j in 1..vertices};

param custos{i in 1..vertices, j in 1..vertices};

var x{ i in 1..vertices, j in 1..vertices} binary;

minimize cost: sum{i in 1..vertices, j in 1..vertices} custos[i,j] * x[i,j];

subject to conser {i in 1..vertices : i!=origem and i!=destino} : sum {j in 1..vertices} matriz[j,i]* x[j,i] - sum{j in 1..vertices} matriz[i,j]* x[i,j]=0;

subject to inicio : -sum{j in 1..vertices} matriz[origem,j] * x[origem,j]= -1;

subject to fim: sum {j in 1..vertices} matriz[j,destino] * x[j,destino]=1;