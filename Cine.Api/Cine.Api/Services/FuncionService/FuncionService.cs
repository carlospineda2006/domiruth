using Cine.Api.DTO.Funcion;
using Cine.Api.Models;

namespace Cine.Api.Services.FuncionService
{
    public class FuncionService : IFuncionService
    {
        private readonly DataContext _context;

        public FuncionService(DataContext context)
        {
            _context = context;
        }

        public async Task<ServiceResponse<List<VwFuncion>>> GetFunciones(FuncionConsultaParametros parametros)
        {
            ServiceResponse<List<VwFuncion>> response = new();

            var query = _context.VwFuncion
                                     .AsQueryable();

            if (!string.IsNullOrEmpty(parametros.Titulo))
                query = query.Where(f => f.Titulo.Contains(parametros.Titulo));
            if (parametros.GeneroId > 0)
                query = query.Where(f => f.GeneroId == parametros.GeneroId);
            if (parametros.SalaId > 0)
                query = query.Where(f => f.SalaId == parametros.SalaId);
            if (parametros.HoraInicio.HasValue)
                query = query.Where(f => f.HoraInicio >= parametros.HoraInicio);


            var funciones = await query.ToListAsync();
            if (!funciones.Any())
            {
                response.Success = false;
                response.Message = "No se encontraron funciones registradas.";
            }            
            else
            {
                response.Success = true;
                response.Data = funciones;
                response.Message = $"{funciones.Count} funciones encontradas.";
            }

            return response;
        }

        public async Task<ServiceResponse<List<VwFuncionesPorPelicula>>> GetFuncionesByPeliculaId(int peliculaId)
        {
            ServiceResponse<List<VwFuncionesPorPelicula>> response = new();

            var funciones = await _context.VwFuncionesPorPelicula
                                     .Where(f => f.PeliculaId == peliculaId)
                                     .ToListAsync();
            if (!funciones.Any())
            {
                response.Success = false;
                response.Message = "No se encontraron funciones registradas.";
            }
            else
            {
                response.Success = true;
                response.Data = funciones;
                response.Message = $"{funciones.Count} funciones encontradas.";
            }

            return response;
        }
    }
}
