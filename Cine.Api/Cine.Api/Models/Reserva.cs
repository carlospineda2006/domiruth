namespace Cine.Api.Models
{
    public class Reserva
    {
        public int ReservaId { get; set; }
        public int FuncionId { get; set; }
       // public Funcion Funcion { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Genero { get; set; }
        public string TipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public DateTime FechaReserva { get; set; } = DateTime.UtcNow;
    }

}
