create or alter view vwFuncionesPorPelicula
as
SELECT f.[FuncionId]
      ,f.[PeliculaId]
      ,f.[SalaId]
	  ,s.Nombre Sala 
      ,f.[HoraInicio]
      ,f.[HoraFin]
      ,f.[EntradasDisponibles]
  FROM [Funcion] f inner join 
  Sala s on f.SalaId= s.SalaId

