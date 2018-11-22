param NAno;
param NMes;
param NDia;
param NHora;
param NMinutos;

set Ano:={1..NAno};
set Mes:={1..NMes};
set Dia:={1..NDia};
set Hora:={1..NHora};
set Minutos:={1..NMinutos};

param Custo{i1 in Ano, i2 in Mes, i3 in Dia, i4 in Hora, i5 in Minutos};

var y{i1 in Ano, i2 in Mes, i3 in Dia, i4 in Hora, i5 in Minutos} >=0;


maximize custo_total:sum{i1 in Ano, i2 in Mes, i3 in Dia, i4 in Hora, i5 in Minutos}y[i1,i2,i3,i4,i5];

# em alternativa aos indices i1, i2, i3, i4, i5 podem ser usados indices mais simples como i, j, k, l, m
#maximize custo_total:sum{i in Ano, j in Mes, k in Dia, l in Hora, m in Minutos} y[i,j,k, l, m];


s.t. verifica{i1 in Ano, i2 in Mes, i3 in Dia, i4 in Hora, i5 in Minutos}: y[i1,i2,i3,i4,i5]= Custo[i1,i2,i3,i4,i5];

# em alternativa aos indices i1, i2, i3, i4, i5 podem ser usados indices mais simples como i, j, k, l, m
#s.t. verifica{i in Ano, j in Mes, k in Dia, l in Hora, m in Minutos}: y[i,j,k, l, m]= Custo[i,j,k, l, m];



