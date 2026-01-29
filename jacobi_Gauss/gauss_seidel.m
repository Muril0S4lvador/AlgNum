function[x, Iter, Info] = gauss_seidel(n, A, b, Toler, IterMax)
    for i = 1 : n
        x(i, 1) = b(i) / A(i, i);
    endfor
    Iter = 0;
    do
        Iter = Iter + 1;
        NormaNum = 0;
        NormaDen = 0;
        for i = 1: n
            Soma = 0;
            for j = 1 : n
                if i ~= j
                    Soma = Soma + A(i, j) * x(j);
                endif
            endfor
            v(i) = x(i);
            x(i) = (b(i) - Soma) / A(i, i);
            t = abs(v(i) - x(i));
            if t > NormaNum
                NormaNum = t;
            endif
            if abs(x(i)) > NormaDen
                NormaDen = abs(x(i));
            endif
        endfor
        NormaRel = NormaNum / NormaDen;

        Iter
        x
        NormaRel
    until NormaRel <= Toler || Iter >= IterMax
    if NormaRel <= Toler
        Info = 0;
    else
        Info = 1;
    endif
endfunction
