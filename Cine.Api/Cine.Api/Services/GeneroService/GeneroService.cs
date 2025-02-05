using Cine.Api.Models;

namespace Cine.Api.Services.GeneroService
{
    public class GeneroService : IGeneroService
    {
        private readonly DataContext _context;

        public GeneroService(DataContext context)
        {
            _context = context;
        }
        public async Task<ServiceResponse<List<Genero>>> GetGeneros()
        {
            ServiceResponse<List<Genero>> response = new();

            var generos = await _context.Genero.ToListAsync();

            if (generos == null)
            {
                response.Success = false;
                response.Message = "No se encontraron generos registrados.";
                return response;
            }
            else
            {
                response.Success = true;
                response.Data = generos;
                response.Message = $"{generos.Count} generos encontrados.";
                return response;
            }
        }
    }
}
