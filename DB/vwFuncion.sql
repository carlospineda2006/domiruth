--select * from funcion
create or alter view vwFuncion
as
select 
f.FuncionId,
p.PeliculaId,
p.Titulo,
g.generoid,
g.nombre Genero,
p.Sinopsis,
s.SalaId,
s.Nombre Sala,
p.Duracion,
f.HoraInicio,
f.HoraFin,
EntradasDisponibles,
p.ImagenUrl
from Funcion F inner join 
Pelicula P on f.PeliculaId= p.PeliculaId inner join 
Sala S on f.SalaId = s.SalaId inner join 
genero g on P.Generoid = g.generoid


-- select * from vwFuncion

