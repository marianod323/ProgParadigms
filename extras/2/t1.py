# Extra 2 - t1 refeito em python

from itertools import takewhile

# 01) Crie uma função que verifique se um caracter é uma vogal ou não.

def isvowel(c):
    frase = str('aeiouAEIOU')
    return bool(frase.count(c))


# 02) Escreva uma função addComma, que adicione uma vírgula no final de cada string contida numa lista.

def addcomma(s):
    return list(map(lambda x: x + ',', s))


# 03) Crie uma função htmlListItems, que receba uma lista de strings e retorne outra lista contendo as strings
#     formatadas como itens de lista em HTML.

def htmllistitems(v):
    return list(map(lambda x: '<LI>' + x + '</LI>', v))


def htmllistitemsaux(v):
    return '<LI>' + v + '</LI>'


def htmllistitemssem(v):
    return list(map(htmlListItemsAux, v))


# 04) Defina uma função que receba uma string e produza outra retirando as vogais

def semvogais(v):
    return ''.join(list(filter(lambda x: not isVowel(x), v)))


def naovogal(v):
    return not isVowel(v)


def semvogaissem(v):
    return ''.join(list(filter(naoVogal, v)))

# 05) Defina uma função que receba uma string, possivelmente contendo espaços,
#     e que retorne outra string substituindo os demais caracteres por '-', mas mantendo os espaços.

def encodemeaux(c):
    if c == ' ':
        return ' '
    else:
        return '-'


def encodeme(v):
    return ''.join(list(map(lambda x: encodeMeAux(x), v)))


def encodemesem(v):
    return ''.join(list(map(encodeMeAux, v)))


# 06) Escreva uma função firstName que, dado o nome completo de uma pessoa,
#     obtenha seu primeiro nome. Suponha que cada parte do nome seja separada por um espaço e
#     que não existam espaços no início ou fim do nome.

def firstname(v):
    return ''.join(takewhile(lambda x: x != ' ', v))

# 07) Escreva uma função isInt que verifique se uma dada string só contém dígitos de 0 a 9.

def isint(v):
    return len(list(filter(lambda x: x not in '0123456789', v))) <= 0

# 08) Escreva uma função lastName que, dado o nome completo de uma pessoa, obtenha seu último sobrenome.
#     Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.

def lastname(v):
    return v.split().pop()

# 09) Escreva uma função userName que, dado o nome completo de uma pessoa,
#     crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome,
#     tudo em minúsculas.

def username(v):
    return v.split()[0][0]+v.split().pop()

# 10) Escreva uma função encodeName que substitua vogais em uma string,
#     conforme o esquema a seguir: a = 4, e = 3, i = 2, o = 1, u = 0.

def encodenameaux(v):
    if v == 'a':
        return '4'
    elif v == 'e':
        return '3'
    elif v == 'i':
        return '2'
    elif v == 'o':
        return '1'
    elif v == 'u':
        return '0'
    else:
        return v

def encodename(v):
    return ''.join(map(encodeNameAux, v))

# 11) Escreva uma função betterEncodeName que substitua vogais em uma string,
#     conforme este esquema: a = 4, e = 3, i = 1, o = 0, u = 00.

def betterencodenameaux(v):
    if v == 'a':
        return '4'
    elif v == 'e':
        return '3'
    elif v == 'i':
        return '2'
    elif v == 'o':
        return '1'
    elif v == 'u':
        return '00'
    else:
        return v

def betterencodename(v):
    return ''.join(map(betterEncodeNameAux, v))

# 12) Dada uma lista de strings, produzir outra lista com strings de 10 caracteres,
#     usando o seguinte esquema: strings de entrada com mais de 10 caracteres são truncadas,
#     strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres.

def str2ten(v):
    return v+'..........'


def onlyten(v):
    return list(map(lambda x: str2ten(x)[:10], v))