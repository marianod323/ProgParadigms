import Data.Char

isEanOk :: String -> Bool
isEanOk str = if aux1 (init str) == (digitToInt (last str)) then True else False

aux1 :: String -> Int
aux1 x = if mod numb 10 == 0 then 0 else ((((div numb 10)+1)*10) - numb)
         where numb = sum (zipWith (*) (map (digitToInt) (reverse x)) [3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3])
