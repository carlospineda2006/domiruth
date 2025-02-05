using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Cine.Api.Models
{
    public class Pelicula
    {
        public int PeliculaId { get; set; }
        public string Titulo { get; set; } = string.Empty;
        public int GeneroId { get; set; }
        public string Sinopsis { get; set; } = string.Empty;
        public int Duracion { get; set; } = 0; // en minutos
        public string ImagenUrl { get; set; } = string.Empty; // opcional
        
    }
}
