main = print $ sumsqu - squsum
         where m = 100
               squsum = sum [ x*x | x <- [1..m] ]
               sumsqu = x * x
                  where x = sum [1..m]

