module Primes where

import qualified Data.Map as Map

primes :: [Int]
primes = 2 : sieve [3, 5 .. m]
    where 
        sieve :: [Int] -> [Int]
        sieve (x:xs) = x : sieve [ y | y <- xs, mod y x /= 0]
        sieve [] = []
        m = 10000000

factorize :: Int -> Map.Map Int Int
factorize n = func Map.empty n primes
   where 
      func result n (p:ps)
         | n == 1 = result
         | mod n p == 0 = func (Map.insertWith (+) p 1 result) (div n p) (p:ps)
         | otherwise = func result n ps
