import Data.Char
-- Para desafios 1 e 2

decrypt :: String -> String
decrypt [] = []
decrypt (x:xs)
    |[x] == "|" = decryptAux1 xs
    |[x] == "0" = concat["o", decrypt xs]
    |[x] == "1" = concat["i", decrypt xs]
    |[x] == "2" = concat["z", decrypt xs]
    |[x] == "3" = concat["e", decrypt xs]
    |[x] == "4" = concat["a", decrypt xs]
    |[x] == "5" = concat["s", decrypt xs]
    |[x] == "6" = concat["g", decrypt xs]
    |[x] == "7" = concat["t", decrypt xs]
    |[x] == "8" = concat["b", decrypt xs]
    |[x] == "[" = concat["c", decrypt xs]
    |[x] == "#" = concat["h", decrypt xs]
    |[x] == "Y" = concat["y", decrypt xs]
    |[x] == "<" = concat["c", decrypt xs]
    |[x] == "V" = concat["w", decrypt (tail xs)]
    |[x] == "/" = concat["n", decrypt (tail xs)]
    |[x] == ">" = concat["x", decrypt (tail xs)]
    |[x] == "(" = concat["u", decrypt (tail (tail xs))]
    |otherwise = concat[[x], decrypt xs]

decryptAux1 :: String -> String
decryptAux1 (x:xs) = if x == 'V' then concat["m", decrypt (tail xs)]  else
                     if x == ')' then concat["d", decrypt (tail xs)]  else
                     if x == '_' then concat["l", decrypt xs]         else
                     if x == '=' then concat["f", decrypt xs]         else
                     if x == '^' then concat["p", decrypt xs]         else
                     if x == '<' then concat["k", decrypt xs]         else
                     if x == '2' then concat["r", decrypt xs]         else [x]

-- Para desafio 3

chr2ord :: Char -> Int
chr2ord x = ord x - ord 'a'

ord2chr :: Int -> Char
ord2chr x = chr (x + ord 'a')

validCaesar :: Int -> Char -> Char
validCaesar x y = if y >= 'a' && y <= 'z' then ord2chr (((chr2ord y) - x) `mod` 26) else y

caesar :: Int -> String -> String
caesar n str = [validCaesar n x | x <- str]

decryptCaesar :: Int -> String -> String
decryptCaesar y str = caesar y (decrypt str)

-- Para desafio 4 e 5

vigenere :: Char -> Char -> Char
vigenere x y = ord2chr (((chr2ord x - chr2ord 'a') - (chr2ord y - chr2ord 'a') + 26) `mod` 26)

decryptVigenereAux :: Int -> String -> String -> String
decryptVigenereAux tam pwd [] = []
decryptVigenereAux tam pwd (x:xs)
  |x >= 'a' && x <= 'z' = concat[[vigenere x (pwd!!(tam `mod` length pwd))], decryptVigenereAux (tam+1) pwd xs]
  |otherwise = concat[[x], decryptVigenereAux tam pwd xs]

decryptVigenere :: String -> String -> String
decryptVigenere pwd str = decryptVigenereAux 0 pwd str

-- Prova: https://imgur.com/a/sYwdlEE
