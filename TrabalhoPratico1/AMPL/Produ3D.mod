set P; # Produtos
set R; # Materias_Primas

param T > 0; # numero de periodos de producao
param M > 0; # Producao Maxima por periodo

param a{R,P} >= 0; # unidades de materia_prima i para produzir o produto j

param b{R} >= 0; # disponibilidade inicial da materia_prima i

param c{P,1..T}; # lucro estimado por unidade de produto (j) no periodo t

var x{P,1..T} >= 0; # unidades produzidas do de produto (j) no periodo t

maximize profit:
sum {t in 1..T} ( sum {j in P} c[j,t]*x[j,t]);
# # lucro total estimado sobre todos os periodos

subject to
prod {t in 1..T}: sum {j in P} x[j,t] <= M;
# producao em cada periodo respeita valor maximo

stockT {i in R}:sum {j in P, t in 1..T} a[i,j] * x[j,t] <= b[i];
# quantidade materia prima disponivel
