es_hombre(luis).
es_hombre(higinio).
es_hombre(carlos).
es_hombre(nelson).
es_hombre(agusto).
es_hombre(david).
es_hombre(diego).
es_hombre(esteban).

es_mujer(mariaC).
es_mujer(mariaA).
es_mujer(marcela).
es_mujer(patricia).
es_mujer(yadira).
es_mujer(valery).
es_mujer(daniela).
es_mujer(camila).
es_mujer(alejandra).

es_padre(luis, MariaA).
es_padre(higinio, carlos).
es_padre(higinio, nelson).
es_padre(higinio, yadira).
es_padre(nelson, diego).
es_padre(nelson, camila).
es_padre(nelson, alejandra).
es_padre(carlos, david).
es_padre(carlos, valery).
es_padre(carlos, daniela).
es_padre(agusto, esteban).

es_madre(mariaC, mariaA).
es_madre(mariaA, carlos).
es_madre(mariaA, nelson).
es_madre(mariaA, yadira).
es_madre(marcela, carlos).
es_madre(marcela, david).
es_madre(marcela, valery).
es_madre(patricia, diego).
es_madre(patricia, alejandra).
es_madre(patricia, camila).
es_madre(yadira, esteban).

es_hijo(X,Y) :- es_padre(Y,X), es_hombre(X).
es_hijo(X,Y) :- es_madre(Y,X), es_hombre(X).

es_hija(X,Y) :- es_padre(Y,X), es_mujer(X).
es_hija(X,Y) :- es_madre(Y,X), es_mujer(X).

es_abuelo(X,Y) :- es_padre(X,Z), es_padre(Z,Y), es_hombre(X).
es_abuela(X,Y) :- es_madre(X,Z), es_madre(Z,Y), es_mujer(X).

es_nieto(X,Y) :- es_padre(Z,X), es_padre(Y,Z), es_hombre(X).
es_nieta(X,Y) :- es_padre(Z,X), es_padre(Y,Z), es_mujer(X).

es_hermano(X,Y) :- es_padre(Z,X), es_padre(Z,Y), es_hombre(X).
es_hermana(X,Y) :- es_padre(Z,X), es_padre(Z,Y), es_mujer(X).

es_ancestro(X,Y) :- es_padre(X,Y).
es_ancestro(X,Y) :- es_madre(X,Y).

es_ancestro(X,Y) :- es_padre(Z,Y), es_ancestro(X,Z).
es_ancestro(X,Y) :- es_madre(Z,Y), es_ancestro(X,Z).

es_descendiente(X,Y) :- es_padre(Y,X).
es_descendiente(X,Y) :- es_madre(Y,X).

es_ancestro(X,Y) :- es_padre(Y,Z), es_ancestro(Z,X).
es_ancestro(X,Y) :- es_madre(Y,Z), es_ancestro(Z,X).

es_tio(X,Y) :- es_padre(Z,Y), es_hermano(X,Z).
es_tia(X,Y) :- es_padre(Z,Y), es_hermana(X,Z).

es_sobrino(X,Y) :- es_hermano(Y,Z), es_hijo(X,Z).
es_sobrina(X,Y) :- es_hermano(Y,Z), es_hija(X,Z).

es_primo(X,Y) :- es_hijo(X,Z), es_sobrino(Y,Z).
es_prima(X,Y) :- es_hija(X,Z), es_sobrina(Y,Z).

es_esposo(X,Y) :- es_padre(X,Z), es_madre(Y,Z).
es_esposa(X,Y) :- es_madre(X,Z), es_padre(Y,Z).

es_cuñado(X,Y) :- es_hermano(X,Z), es_esposo(Y,Z).
es_cuñada(X,Y) :- es_hermana(X,Z), es_esposa(Y,Z).

es_suegro(X,Y) :- es_esposo(Y,Z), es_padre(X,Z).
es_suegra(X,Y) :- es_esposo(Y,Z), es_madre(X,Z).

es_tio_polotico(X,Y) :- es_tia(Z,X), es_esposo(Y,Z).
es_tia_polotico(X,Y) :- es_tio(Z,X), es_esposa(Y,Z).

