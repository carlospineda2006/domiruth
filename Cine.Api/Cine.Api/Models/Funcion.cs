namespace Cine.Api.Models
{
    public class Funcion
    {
        public int FuncionId { get; set; }
        public int PeliculaId { get; set; }
        // public Pelicula Pelicula { get; set; }
        public int SalaId { get; set; }
        // public Sala Sala { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public int EntradasDisponibles { get; set; }
    }

}
