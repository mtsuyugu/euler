module Primes where

primes :: [Int]
primes = 2 : sieve [3, 5 .. m]
    where 
        sieve :: [Int] -> [Int]
        sieve (x:xs) = x : sieve [ y | y <- xs, mod y x /= 0]
        sieve [] = []
        m = 10000000

