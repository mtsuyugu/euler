import qualified Data.List as List
import qualified Data.Map as Map
import qualified Primes

main = print $ Map.foldWithKey (\k v result -> result * k ^ v) 1 
               $ foldl (Map.unionWith max) Map.empty (map Primes.factorize [1..20])
