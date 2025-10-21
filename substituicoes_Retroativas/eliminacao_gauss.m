function [A, b, Info] = eliminacao_gauss(n, A, b)
    Det = 1;
    Info = 0;
    for j=1:n-1
        p=j;
        Amax = abs(A(j, j));
        for k=j+1:n
            if abs(A(k, j)) > Amax
                Amax = abs(A(k, j));
                p = k;
            endif
        endfor
        if p != j
            for k = 1 : n
                t = A(j, k);
                A(j, k) = A(p, k);
                A(p, k) = t;
            endfor
            t = b(j);
            b(j) = b(p);
            b(p) = t;
            Det = -Det;
        endif
        Det = Det * A(j, j)
        if abs(A(j, j)) != 0
            r = 1 / A(j, j);
            for i = j+1 : n
                Mult = A(i, j) * r;
                A(i, j) = 0;
                for k = j+1 : n
                    A(i, k) = A(i, k) - Mult * A(j, k)
                endfor
                b(i) = b(i) - Mult * b(j);
            endfor
        else
            if Info == 0
                Info = j;
            endif
        endif
    endfor
    Det = Det * A(n, n);
    if Info == 0 && abs(A(n, n)) == 0
        Info = n
    endif
endfunction
