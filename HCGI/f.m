function y = f(T,k,sim,C)

    L = size(sim,1);
    for i = 1:L
      for j = 1:k
        sim(i) = sim(i)*T(C(i,j));
      end
    end
    y = sum(sim);
end