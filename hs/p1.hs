main = print $ sum [ x | x <- [1..m-1], mod x 3 == 0 || mod x 5 == 0 ]
          where m = 1000
