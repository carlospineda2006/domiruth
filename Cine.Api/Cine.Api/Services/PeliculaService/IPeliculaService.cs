using Cine.Api.Models;

namespace Cine.Api.Services.PeliculaService
{
    public interface IPeliculaService
    {
        Task<ServiceResponse<List<Pelicula>>> GetPeliculas();
        Task<ServiceResponse<Pelicula>> GetPeliculaById(int peliculaId);
    }
}
