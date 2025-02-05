using System.ComponentModel.DataAnnotations;

namespace Cine.Api.Models
{
    public class VwFuncion

    {
        [Key]
        public int FuncionId { get; set; }
        public int PeliculaId { get; set; }
        public string Titulo { get; set; } = string.Empty;
        public int GeneroId { get; set; }
        public string Genero { get; set; } = string.Empty;
        public string Sinopsis { get; set; } = string.Empty;
        public int SalaId { get; set; }
        public string Sala { get; set; } = string.Empty;
        public int Duracion { get; set; }
        public TimeSpan HoraInicio { get; set; }
        public TimeSpan HoraFin { get; set; }
        public int EntradasDisponibles { get; set; }
        public string ImagenUrl { get; set; }
    }
}
