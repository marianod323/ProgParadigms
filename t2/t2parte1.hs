-- 1) Usando recursão, escreva uma função geraTabela :: Int -> [(Int,Int)]
--    que produza uma lista com n tuplas, cada tupla com números de n a 1 e seus respectivos quadrados.

geraTabela :: Int -> [(Int,Int)]
geraTabela 1 = [(1, 1)]
geraTabela x = (x, x^2):(geraTabela (x-1))

-- 2) Defina uma função recursiva que verifique se um dado caracter está contido numa string

contido :: Char -> String -> Bool
contido c "" = False
contido c (x:xs) = if c == x then True else contido c xs

-- 3) Defina uma função recursiva que receba uma lista de coordenadas de pontos 2D e desloque esses pontos em 2 unidades

desloca :: [(Int, Int)] -> [(Int, Int)]
desloca ((a, b):[]) = (a+2, b+2) : []
desloca ((a, b):xs) = (a+2, b+2) : desloca xs

-- 4) Defina uma função que receba um número n e retorne uma lista de n tuplas,
--    cada tupla com números de 1 a n e seus respectivos quadrados.
--    Dica: defina uma função auxiliar recursiva com 2 argumentos, sendo um deles que se mantém inalterado na chamada recursiva.

geraTabelaQuad :: Int -> [(Int, Int)]
geraTabelaQuad x = geraTabelaAux x 1

geraTabelaAux :: Int -> Int -> [(Int, Int)]
geraTabelaAux x y = if x == y then [(y, y^2)] else (y, y^2) : geraTabelaAux x (y+1)
