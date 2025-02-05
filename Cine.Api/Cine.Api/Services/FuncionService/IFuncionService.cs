using Cine.Api.DTO.Funcion;
using Cine.Api.Models;

namespace Cine.Api.Services.FuncionService
{
    public interface IFuncionService
    {
        Task<ServiceResponse<List<VwFuncion>>> GetFunciones( FuncionConsultaParametros parametros);
        Task<ServiceResponse<List<VwFuncionesPorPelicula>>> GetFuncionesByPeliculaId(int peliculaId);
    }
}
