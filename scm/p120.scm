#|
dividend
   = (a-1)^n+(a+1)^n
　 = Σ(m=0...n) (nCm *(-1)^(n-m)*a^m + nCm * a^m )
　 = Σ(m=0...n) (nCm * a^(n-m) * ( 1 + (-1)^m ))

なので、

m : odd
 remainder = 0;

m : even
　n : even
　　　(n-m) : even だから、dividend は 0, 2, 4 ... n 次の項だけ残るので
   　remainder = 2
　n : odd
      (n-m) : odd だから、dividend はz 1, 3, 5, ..., n 次の項だけ残るので
   　remainder = 2an

remainder < divisor なので 2an < a^2
よって n の範囲は
n < a/2
となる。rMax のときの n は

  a: even
     n = (a-2)/2
    remainder = 2an = a(a-2)  が rMax
  a: odd
     n = (a-1)/2
    remainder = 2an = a(a-1) が rMax

3 <= a <= 1000 で
2 < a(a-2), 2 < a(a-1) は明らかなので rMax のときの n は必ず奇数。
|#

(use srfi-1)
(define p120 (lambda ()
    (apply + (map (lambda (a) 
                    (* a (- a (if (= (modulo a 2) 0) 2 1))))
                  (iota 998 3)))))

(print (p120))



