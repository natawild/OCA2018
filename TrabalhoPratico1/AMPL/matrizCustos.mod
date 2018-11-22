param vertices;

param matriz{i in 1..vertices, j in 1..vertices};

param custos{i in 1..vertices, j in 1..vertices};

var x{ i in 1..vertices, j in 1..vertices} binary;

minimize cost: sum{i in 1..vertices, j in 1..vertices} custos[i,j] * x[i,j];

subject to conser {i in 2..vertices-1} : sum {j in 1..vertices-1} matriz[j,i]* x[j,i] - sum{j in 2..vertices} matriz[i,j]* x[i,j]=0;

subject to origem : -sum{j in 2..vertices} matriz[1,j] * x[1,j]= -1;

subject to destino: sum {j in 1..vertices-1} matriz[j,vertices] * x[j,vertices]=1;