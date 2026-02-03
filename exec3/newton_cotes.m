function [Integral, Info] = newton_cotes(a, b, n, m, f)
    Integral = 0;
    Info = 0;
    
    [d, c, Info_Cotes] = coeficientes_cotes(n);
    
    if Info_Cotes == -1
        Info = -1;
    endif
    if mod(m, n) ~= 0 || m < 0
        Info = Info - 10;
    endif
    if Info ~= 0
        return;
    endif
    h = (b - a) / m;
    j = 1;
    for i = 0 : m
        x = a + i * h;
        y = f(x);
        k = c(j);
        if mod(i, n) == 0 && i ~= 0 && i ~= m
            k = k + k;
            j = 1;
        endif
        Integral = Integral + y * k;
        j = j + 1;
    endfor
    Integral = (n * h / d) * Integral;
endfunction