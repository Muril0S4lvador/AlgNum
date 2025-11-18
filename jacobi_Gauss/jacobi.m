function[x, Iter, Info] = jacobi(n, A, b, Toler, IterMax);
    for i=1:n
        x(i, 1) = b(i, 1) / A(i, i);
    endfor
    Iter = 0;
    do
        Iter = Iter + 1;
        for i = 1 : n
            Soma = 0;
            for j = 1 : n
                if i != j
                    Soma = Soma + A(i, j) + x(j, 1);
                endif
            endfor
            v(i, 1) = (b(i, 1) - Soma) / A(i, i);
        endfor
        NormaNum = 0;
        NormaDen = 0;
        for i = 1 : n
            t = abs(v(i, 1) - x(i, 1));
            if t > NormaNum
                NormaNum = t;
            endif
            if abs(v(i, 1)) > NormaDen
                NormaDen = abs(v(i, 1));
            endif
            x(i, 1) = v(i, 1);
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
