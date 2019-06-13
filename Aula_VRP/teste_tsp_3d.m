     n = 35;
     xy = 10*rand(n,3);
     max_salesmen = 5;
     depots = 10*rand(max_salesmen,3);
     CostType=1; %- total length, use 2 to minimize the longest tour
     min_tour = 3;
     pop_size = 80;
     num_iter = 5e3;
     a = meshgrid(1:n);
     dmat = reshape(sqrt(sum((xy(a,:)-xy(a',:)).^2,2)),n,n);
     
     [min_dist,best_tour,generation] = mdmtspv_ga(xy,max_salesmen,depots,CostType,min_tour,pop_size,num_iter,1,1,dmat)
     
      [min_dist,best_tour,generation] = mdmtspv_ga(xy,max_salesmen,depots,CostType,min_tour,pop_size,num_iter,1,1,dmat)
      
       [min_dist,best_tour,generation] = mdmtspv_ga(xy,max_salesmen,depots,CostType,min_tour,pop_size,num_iter,1,1,dmat)
   
    [min_dist,best_tour,generation] = mdmtspv_ga(xy,max_salesmen,depots,CostType,min_tour,pop_size,num_iter,1,1,dmat)
     
      [min_dist,best_tour,generation] = mdmtspv_ga(xy,max_salesmen,depots,CostType,min_tour,pop_size,num_iter,1,1,dmat)
      
       [min_dist,best_tour,generation] = mdmtspv_ga(xy,max_salesmen,depots,CostType,min_tour,pop_size,num_iter,1,1,dmat)
       