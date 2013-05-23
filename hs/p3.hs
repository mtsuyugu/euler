import qualified Data.Map as Map
import qualified Primes

factorize :: Int -> Map.Map Int Int
factorize n = func Map.empty n Primes.primes
   where 
      func result n (p:ps)
         | n == 1 = result
         | mod n p == 0 = func (Map.insertWith (+) p 1 result) (div n p) (p:ps)
         | otherwise = func result n ps
main = print $ maximum $ Map.keys $ factorize 600851475143
