mujer(clara).
mujer(luisa).
mujer(maria).
mujer(nelida).
ocupacion(jardinera).
ocupacion(florista).
ocupacion(diseñadora).
ocupacion(directora_de_orquesta).

soloEscucha(maria, rock).
soloEscucha(luisa, rock).
incompatible(directora_de_orquesta, rock).

relacion(jardinera, plantas).
relacion(jardinera, plantas).

%Encuentra la ocupación de cada mujer:

% a) Clara es violentamente alérgica a las plantas.
alergica(clara, plantas).
% b) Luisa y la florista comparten el departamento
noEs(luisa, florista). 
% c) A María y Luisa les gusta solamente la música rock
noEs(maria, directora_de_orquesta).
noEs(luisa, directora_de_orquesta).


noEs(Mujer, Ocupacion) :- soloEscucha(Mujer, X), incompatible(Ocupacion, X).

% d) La jardinera, la diseñadora de modas y Nélida no se conocen entre sí.
noEs(nelida, jardinera).
noEs(nelida, diseñadora).
% e) una mujer no puede tener una ocupación que esté relacionada con algo a lo que es alérgica:
noEs(clara, jardinera).
noEs(clara, florista).

noEs(Mujer, Ocupacion) :- alergica(Mujer, X), relacion(Ocupacion, X).

% f) cada mujer tiene un solo trabajo, y  cada trabajo es ocupado por una sola mujer las cuatro mujeres elegidas y las cuatro ocupaciones  deben ser diferentes entre sí.
diferentes(A,B,C,D) :- 
    not(A == B), not(A == C), not(A == D),
    not(B == C), not(D == B), not(C == D).
respuesta([M1, O1],[M2,O2],[M3,O3],[M4,O4]) :-
    mujer(M1), mujer(M2), mujer(M3), mujer(M4),
    ocupacion(O1), ocupacion(O2), ocupacion(O3), ocupacion(O4),
    diferentes(M1,M2,M3,M4),
    diferentes(O1,O2,O3,O4).

/*  	?- respuesta(X).
	X=[[clara,diseñadora],[luisa,jardinera],
	   [maria,florista],[nelida,directora_de_orquesta]]
	Yes
*/
