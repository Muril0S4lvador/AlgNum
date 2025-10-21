function [x] = substituicoes_sucessivas(n, L, c)
  x(1, 1) = c(1) / L(1,1);
  for i=2:n
    Soma = 0;
    for j=1:i-1
      Soma = Soma + L(i,j) * x(j, 1);
    endfor
    x(i, 1) = (c(i) - Soma) / L(i,i);
  endfor
endfunction
