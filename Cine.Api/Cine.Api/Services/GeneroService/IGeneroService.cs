using Cine.Api.Models;

namespace Cine.Api.Services.GeneroService
{
    public interface IGeneroService
    {
        Task<ServiceResponse<List<Genero>>> GetGeneros();
    }
}
