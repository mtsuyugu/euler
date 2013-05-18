fibnacci = 1:1:zipWith (+) fibnacci (tail fibnacci)
p2 = sum $ takeWhile (<= 4000000) (filter even fibnacci)
main = print $ p2
