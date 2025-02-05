namespace Cine.Api.DTO.Funcion
{
    public class FuncionConsultaParametros
    {
        public int SalaId { get; set; }
        public int GeneroId { get; set; }
        public string Titulo { get; set; }= string.Empty;
        public TimeSpan? HoraInicio { get; set; }
        
    }
}
