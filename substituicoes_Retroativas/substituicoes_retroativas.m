function [x] = substituicoes_retroativas(n, L, c)
  x(n, n) = c(n) / L(n,n);
  for i=n-1:1:-1
    Soma = 0;
    for j=i+1:n
      Soma = Soma + L(i,j) * x(j);
    endfor
    x(i) = (c(i) - Soma) / L(i,i);
  endfor
endfunction
