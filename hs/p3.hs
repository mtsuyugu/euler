import qualified Data.Map as Map
import qualified Primes

main = print $ maximum $ Map.keys $ Primes.factorize 600851475143
