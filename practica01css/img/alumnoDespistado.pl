/*ALUMNO DESPISTADO:

”Un alumno de ISC del ITC, debido al nerviosismo del primer día de clase, 
ha anotado el nombre de sus profesores (Elisa, Fernando y Carlos), las 
asignaturas que se imparten (Lógica, Programación y Matemáticas) y el día
de la semana de las distintas clases (lunes, miércoles y viernes), pero 
sólo recuerda que:

- La clase de Programación, impartida por Elisa, es posterior a la de Lógica
- A Carlos no le gusta trabajar los lunes, día en el que no se imparte Lógica

Ayúdale a relacionar cada profesor con su asignatura, así como el día de la 
semana que se imparte

(Sabemos que cada profesor imparte una única asignatura y que las clases se dan 
en días diferentes)”

	Analicemos el problema mentalmente:*/

/*Hechos*/
profesor(elisa).
profesor(fernando).
profesor(carlos).
materias(logica).
materias(programacion).
materias(matematicas).
dias(lunes).
dias(miercoles).
dias(viernes).

%- La clase de Programación, impartida por Elisa, es posterior a la de Lógica
imparte(elisa, programacion).
imparte(Maestro, Materia) :- profesor(Maestro), materias(Materia),
    Maestro \= elisa, Materia \= programacion.
    
% materiaXDia(programacion, Dia) :- dias(Dia), Dia \= lunes.
% materiaXDia(logica, Dia) :- dias(Dia), Dia \= lunes.
materiaXDia(Materia, Dia) :-
    materias(Materia), dias(Dia),(( Materia == programacion; Materia == logica), dia \= lunes).

%- A Carlos no le gusta trabajar los lunes, día en el que no se imparte Lógica
trabaja(carlos, Dia) :- dias(Dia), Dia \= lunes