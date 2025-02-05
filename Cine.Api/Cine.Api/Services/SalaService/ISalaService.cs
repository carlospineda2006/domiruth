using Cine.Api.Models;

namespace Cine.Api.Services.SalaService
{
    public interface ISalaService
    {
        Task<ServiceResponse<List<Sala>>> GetSalas();
    }
}
