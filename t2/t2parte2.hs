-- 1) Escreva uma função recursiva isBin :: String -> Bool para verificar se uma dada String
--    representa um número binário, ou seja, contém apenas caracteres '0' ou '1'.
--    As únicas funções pré-definidas autorizadas aqui são head e tail.

isBin :: String -> Bool
isBin str = if head str == '0' || head str == '1' then (if (tail str) == "" then True else isBin (tail str)) else False

-- 2) Reescreva a função acima de forma não-recursiva.
--    Dê outro nome para ela, por exemplo isBin'. Aqui você pode usar quaisquer funções auxiliares pré-definidas em Haskell.

isBin' :: String -> Bool
isBin' str = if length (filter (`notElem` "01") str) > 0 then False else True
