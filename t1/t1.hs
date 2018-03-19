import Data.Char

-- 1) Crie uma função isVowel :: Char -> Bool que verifique se um caracter é uma vogal ou não.

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

-- Não entendi muito bem como essa funcionou, porque com quase a mesma função eu consegui implementar com e sem lambda.

semVogaisSem :: String -> String
semVogaisSem x = filter (`notElem` "aeiouAEIOU") x

semVogais :: String -> String
semVogais y = filter (\n -> notElem n "aeiouAEIOU") y

-- 5) Defina uma função que receba uma string, possivelmente contendo espaços,
--    e que retorne outra string substituindo os demais caracteres por '-', mas mantendo os espaços.

eMAux :: Char -> Char
eMAux x = if x /= ' ' then '-' else x

encodeMeSem :: String -> String
encodeMeSem plv = map (eMAux) plv

encodeMe :: String -> String
encodeMe plv = map (\n ->  if n /= ' ' then '-' else n) plv

-- 6) Escreva uma função firstName :: String -> String que, dado o nome completo de uma pessoa,
--    obtenha seu primeiro nome. Suponha que cada parte do nome seja separada por um espaço e
--    que não existam espaços no início ou fim do nome.

firstName :: String -> String
firstName plv = takeWhile (/= ' ') plv

-- 7) Escreva uma função isInt :: String -> Bool que verifique se uma dada string só contém dígitos de 0 a 9.

isInt :: String -> Bool
isInt x = if length x > length (filter (`elem` "0123456789") x) then False else True

-- 8) Escreva uma função lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu último sobrenome.
--    Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.

lastName :: String -> String
lastName plv = last (words plv)

-- 9) Escreva uma função userName :: String -> String que, dado o nome completo de uma pessoa,
--    crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas.

userName :: String -> String
userName plv = map toLower (concat [take 1 (head (words plv)), last (words plv)])

-- 10) Escreva uma função encodeName :: String -> String que substitua vogais em uma string,
--     conforme o esquema a seguir: a = 4, e = 3, i = 2, o = 1, u = 0.

encodeAux :: Char -> Char
encodeAux x = if (x == 'a') || (x == 'A') then '4' else
              if (x == 'e') || (x == 'E') then '3' else
              if (x == 'i') || (x == 'I') then '2' else
              if (x == 'o') || (x == 'O') then '1' else
              if (x == 'u') || (x == 'U') then '0' else x

encodeName :: String -> String
encodeName plv = map (\n -> encodeAux n) plv

-- 11) Escreva uma função betterEncodeName :: String -> String
--     que substitua vogais em uma string, conforme este esquema: a = 4, e = 3, i = 1, o = 0, u = 00.

betterEncodeAux :: Char -> String
betterEncodeAux x = if (x == 'a') || (x == 'A') then "4" else
                    if (x == 'e') || (x == 'E') then "3" else
                    if (x == 'i') || (x == 'I') then "2" else
                    if (x == 'o') || (x == 'O') then "1" else
                    if (x == 'u') || (x == 'U') then "00" else [x]

betterEncodeName :: String -> String
betterEncodeName plv = concatMap (\n -> betterEncodeAux n) plv

-- 12) Dada uma lista de strings, produzir outra lista com strings de 10 caracteres,
--     usando o seguinte esquema: strings de entrada com mais de 10 caracteres são truncadas,
--     strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres.

onlyTen :: [String] -> [String]
onlyTen x = map (\n -> if length n >= 10 then take 10 n else take 10 (concat [n, ".........."])) x
