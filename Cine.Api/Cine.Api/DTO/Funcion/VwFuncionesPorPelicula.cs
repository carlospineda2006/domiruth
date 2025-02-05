using System.ComponentModel.DataAnnotations;

namespace Cine.Api.DTO.Funcion
{
    public class VwFuncionesPorPelicula
    {
        [Key]
        public int FuncionId { get; set; }
        public int PeliculaId { get; set; }

        public int SalaId { get; set; }
        public string Sala { get; set; } = string.Empty;
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public int EntradasDisponibles { get; set; }
    }
}
