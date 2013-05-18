main = print $ maximum [ x * y | x <- [n..m], y <- [x+1..m], isPalindrome $ show (x * y)]
         where n = 100
               m = 999
               isPalindrome x = x == reverse x

