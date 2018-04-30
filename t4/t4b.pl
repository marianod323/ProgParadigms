% DJ - Obi 2014 - Fase 1, Nível 2
% Disponível em: https://olimpiada.ic.unicamp.br/static/extras/obi2014/provas/ProvaOBI2014_f1i2.pdf
%
% Seis estilos de música diferentes serão executados pelo DJ Sombra Negra. Cada estilo vai ser executado
% uma única vez, e as seguintes condições devem ser obedecidas:
%
% 1 - Hip-hop é o primeiro, o terceiro ou o quinto estilo a ser executado.
% 2 - Pelo menos dois estilos são executados após samba ser executado, mas antes de pop ser executado
% (ou seja, pelo menos dois estilos são executados entre a execução de samba e a execução de pop).
% 3 - Exatamente um estilo é executado após funk, mas antes de rock ser executado (ou seja, exatamente
% um estilo é executado entre a execução de funk e a execução de rock)

hiphop(A) :-
  A =:= 0;
  A =:= 2;
  A =:= 4.

regra1(C) :-
  nth0(Ih, C, hip-hop),
  hiphop(Ih), !.

regra2(C) :-
  nth0(Is, C, samba),
  nth0(Ip, C, pop),
  Dif is Ip - Is,
  Dif > 2, !.

regra3(C) :-
  nth0(If, C, funk),
  nth0(Ir, C, rock),
  Dif is If - Ir,
  Dif =:= -2, !.

playlist(C) :-
  regra1(C),
  regra2(C),
  regra3(C).

% Questão 11. Qual das seguintes alternativas é
% uma possível lista completa e correta dos estilos
% executados, do primeiro para o último?
%
% ?- playlist([funk, samba, rock, pop, hip-hop, jazz]).
% ?- playlist([hip-hop, samba, jazz, pop, funk, rock]).
% ?- playlist([rock, samba, funk, hip-hop, jazz, pop]).
% ?- playlist([pop, rock, jazz, funk, hip-hop, samba]).
% ?- playlist([jazz, samba, hip-hop, funk, pop, rock]).
