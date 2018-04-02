-- 1) Escreva uma função recursiva isBin :: String -> Bool para verificar se uma dada String
--    representa um número binário, ou seja, contém apenas caracteres '0' ou '1'.
--    As únicas funções pré-definidas autorizadas aqui são head e tail.

isBin :: String -> Bool
isBin str = if head str == '0' || head str == '1' then (if (tail str) == "" then True else isBin (tail str)) else False

-- 2) Reescreva a função acima de forma não-recursiva.
--    Dê outro nome para ela, por exemplo isBin'. Aqui você pode usar quaisquer funções auxiliares pré-definidas em Haskell.

isBin' :: String -> Bool
isBin' str = if length (filter (`notElem` "01") str) > 0 then False else True

-- 3) Encontra-se abaixo a definição parcial da função bin2dec :: [Int] -> Int,
--    que converte uma lista de 0's e 1's (representando um número binário), em seu equivalente em decimal.

bin2dec :: [Int] -> Int
bin2dec [] = undefined
bin2dec bits = auxBin2Dec bits ((length bits)-1)

auxBin2Dec :: [Int] -> Int -> Int
auxBin2Dec bit (-1) = 0
auxBin2Dec (x:xs) ept = x * 2 ^ ept + auxBin2Dec xs (ept-1)

-- 4) Reescreva a função do exercício anterior de forma não-recursiva, usando funções pré-definidas em Haskell.

--bin2dec' :: [Int] -> Int
--bin2dec' bits =

-- 5) Crie uma função recursiva dec2bin :: Int -> [Int] que receba um número inteiro positivo e retorne
--    sua representação em binário, sob forma de uma lista de 0's e 1's. As funções auxiliares autorizadas
--    aqui são mod, div e reverse.

dec2bin :: Int -> [Int]
dec2bin x = reverse (dec2binAux x)

dec2binAux :: Int -> [Int]
dec2binAux 0 = []
dec2binAux x = (mod x 2) : dec2binAux (div x 2)

-- 6)
