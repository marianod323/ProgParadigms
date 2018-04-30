%   Uma banda formada por alunos e alunas da escola está gravando um CD com exatamente sete músicas
% distintas – S, T, V, W, X, Y e Z. Cada música ocupa exatamente uma das sete faixas contidas no
% CD. Algumas das músicas são sucessos antigos de rock; outras são composições da própria banda. As
% seguintes restrições devem ser obedecidas:

% 1 - S ocupa a quarta faixa do CD.
% 2 - Tanto W como Y precedem S no CD (ou seja, W e Y estão numa faixa que é tocada antes de S no CD).
% 3 - T precede W no CD (ou seja, T está numa faixa que á tocada antes de W).
% 4 - Um sucesso de rock ocupa a sexta faixa do CD.
% 5 - Cada sucesso de rock é imediatamente precedido no CD por uma composição da banda
% 6 - Z é um sucesso de rock.

autoral(A,B) :- A \= 5, B \= z.

sucessoRock(5,_).
sucessoRock(A,z) :- A > 0, A \= 4, A \= 6.

regra1(C) :-
    nth0(3, C, s).

regra2(C) :-
    nth0(Iw, C, w),
    Iw < 3,
    nth0(Is, C, y),
    Is < 3, !.

regra3(C) :-
    nth0(Iw, C, w),
    nth0(It, C, t),
    It < Iw, !.

regra5([_,B], I) :-
    L is I+1,
    autoral(L, B).

regra5([A,_], I) :-
    autoral(I, A).

regra5(C,I) :-
    C = [_|T],
    T = [H2|_],
    L is I+1,
    autoral(L, H2),
    regra5(T,L),
    !.

regra5(C,I) :-
    C = [H|T],
    autoral(I, H),
    L is I + 1,
    regra5(T,L).

cdIndependente(C) :-
    regra1(C),
    regra2(C),
    regra3(C),
    regra5(C,0).

% Questão 11. Qual das seguintes alternativas poderia
% ser a ordem das músicas no CD, da primeira
% para a sétima faixa?
%
% (A) T, W, V, S, Y, X, Z
% (B) V, Y, T, S, W, Z, X
% (C) X, Y, W, S, T, Z, S
% (D) Y, T, W, S, X, Z, V
% (E) Z, T, X, W, V, Y, S
%
% Consultas:
%
% ?- cdIndependente([t,w,v,s,y,x,z]).
% ?- cdIndependente([v,y,t,s,w,z,x]).
% ?- cdIndependente([x,y,w,s,t,z,s]).
% ?- cdIndependente([y,t,w,s,x,z,v]).
% ?- cdIndependente([z,t,x,w,v,y,s]).
