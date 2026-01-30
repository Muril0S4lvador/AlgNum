function [Integral, Info] = newton_cotes(a, b, n, m, f)
    % Objetivo: Integrar uma função pela fórmula de Newton-Cotes
    % f: handle da função a ser integrada (ex: @(x) sin(x))
    % a, b: limites inferior e superior
    % n: grau do polinômio
    % m: número de subintervalos
    
    % Inicialização
    Integral = 0;
    Info = 0;
    
    % Obtenção dos coeficientes de Cotes (chama a função da Figura 5.7)
    [d, c, Info_Cotes] = coeficientes_cotes(n);
    
    % Consistência do parâmetro n (vinda da função anterior)
    if Info_Cotes == -1
        Info = -1;
    endif
    
    % Consistência dos parâmetros m e n
    if mod(m, n) ~= 0 || m < 0
        Info = Info - 10;
    endif
    
    % Se houve erro de consistência, interrompe a execução
    if Info ~= 0
        return;
    endif
    
    % Cálculo da integral
    h = (b - a) / m;
    j = 1; % Índice para percorrer o vetor de coeficientes c (VetC)
    
    for i = 0 : m
        x = a + i * h;
        y = f(x); % Avalia a função integrando em x
        
        k = c(j);
        
        % Tratamento para pontos de junção entre subintervalos
        % Se i é múltiplo de n, mas não é o início (0) nem o fim (m)
        if mod(i, n) == 0 && i ~= 0 && i ~= m
            k = k + k;
            j = 1;
        endif
        
        Integral = Integral + y * k;
        j = j + 1;
    endfor
    
    % Aplicação do fator multiplicador final
    Integral = (n * h / d) * Integral;
endfunction