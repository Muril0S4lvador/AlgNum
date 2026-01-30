function [Den, VetC, Info] = coeficientes_cotes(n)
    % Objetivo: Fornecer os parâmetros da fórmula geral de Newton-Cotes
    % n: grau do polinômio usado na integração (parâmetro de entrada)
    
    % Inicialização de variáveis de saída
    Den = [];
    VetC = [];
    
    % Validação do parâmetro de entrada
    if n < 1 || n > 10
        Info = -1;
        return;
    else
        Info = 0;
    endif
    
    % Denominadores da forma geral (d)
    d = [2, 6, 8, 90, 288, 840, 17280, 28350, 89600, 598752];
    
    % Coeficientes de Cotes simétricos (c)
    % Mapeamento total conforme o pseudocódigo (c(1) até c(35))
    c = [1, 1, 4, 1, 3, 7, 32, 12, 19, 75, 50, 41, 216, 27, 272, 751, ...
         3577, 1323, 2989, 989, 5888, -928, 10496, -4540, 2857, 15741, ...
         1080, 19344, 5778, 16067, 106300, -48525, 272400, -260550, 427368];
    
    % Atribuição do denominador correspondente ao grau n
    Den = d(n);
    
    % Cálculo do índice de início dos coeficientes (p)
    % Nota: MATLAB usa índice 1, então ajustamos a lógica de truncamento e resto
    p = fix(n * (n + 2) / 4 + mod(n, 2));
    
    % O cálculo de p no pseudocódigo original parece ser baseado em índice 1 
    % para o vetor c. Vamos garantir que VetC tenha o tamanho correto:
    VetC = zeros(1, n + 1);
    
    n12 = fix((n + 1) / 2) - 1;
    
    for i = 0 : n12
        % VetC(i+1) recebe c(p+i)
        VetC(i + 1) = c(p + i);
        % Propriedade de simetria: VetC(n+1-i) recebe c(p+i)
        VetC(n + 1 - i) = c(p + i);
    endfor
    
    % Tratamento para n par (termo central)
    if mod(n, 2) == 0
        VetC(n / 2 + 1) = c(p + n / 2);
    endif
endfunction