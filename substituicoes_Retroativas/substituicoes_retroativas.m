function [x] = substituicoes_retroativas(n, L, c)
  x(n, 1) = c(n) / L(n,n);
  for i=n-1:1:-1
    Soma = 0;
    for j=i+1:n
      Soma = Soma + L(i,j) * x(j, 1);
    endfor
    x(i, 1) = (c(i) - Soma) / L(i,i);
  endfor
endfunction
