-- Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.

isVowel :: Char -> Bool
isVowel c = elem c "aeiouAEIOU"

-- 2) Escreva uma função addComma, que adicione uma vírgula no final de cada string contida numa lista.

addComma :: [String] -> [String]
addComma list = map (\x -> x ++ ",") list

-- 3) Crie uma função htmlListItems :: [String] -> [String],
--    que receba uma lista de strings e retorne outra lista contendo as strings
--    formatadas como itens de lista em HTML.

htmlListItems :: [String] -> [String]
htmlListItems list = map (\n -> "<LI>" ++ n ++ "</LI>") list

concatenaHtml :: String -> String
concatenaHtml x = "<LI>" ++ x ++ "</LI>"

htmlListItemsSem :: [String] -> [String]
htmlListItemsSem list = map (concatenaHtml) list

-- 4) Defina uma função que receba uma string e produza outra retirando as vogais, conforme os exemplos abaixo.

semVogaisSem :: String -> String
semVogaisSem x = filter (`notElem` "aeiouAEIOU") x

--semVogais :: String -> String
--semVogais y = filter (\n -> n == "aeiouAEIOU") y

-- 5) teste
