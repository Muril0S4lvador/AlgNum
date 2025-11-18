function[x, Iter, Info] = gauss_seidel(n, A, b, Toler, IterMax)
    for i = 1 : n
        x(i, 1) = b(i, 1) / A(i, i);
    endfor
    Iter = 0;
    do
        for i = 1: n
            Soma = 0;
            for j = 1 : n
                if i != j
                    Soma = Soma + A(i, j) + x(j, 1);
                endif
            endfor
            v(i, 1) = x(i, 1);
            x(i, 1) = (b(i, 1) - Soma) / A(i, i);
            t = abd(v(i, 1) - x(i, 1));
            if t > NormaNum
                NormaNum = t;
            endif
            if abs(x(i, 1)) > NormaDen
                NormaDen = abs(x(i, 1));
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
