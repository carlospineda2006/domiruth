using Cine.Api.Data;
using Cine.Api.Models;

namespace Cine.Api.Services.PeliculaService
{
    public class PeliculaService : IPeliculaService
    {
        private readonly DataContext _context;

        public PeliculaService(DataContext context)
        {
            _context = context;
        }

        public async Task<ServiceResponse<Pelicula>> GetPeliculaById(int peliculaId)
        {
            ServiceResponse<Pelicula> response = new();

            var pelicula = await _context.Pelicula.FirstOrDefaultAsync(x=>x.PeliculaId==peliculaId);

            if (pelicula == null)
            {
                response.Success = false;
                response.Message = "No se encontraro la pelicula.";
                return response;
            }
            else
            {
                response.Success = true;
                response.Data = pelicula;
                response.Message = $"pelicula encontrada.";
                return response;
            }
        }

        public async Task<ServiceResponse<List<Pelicula>>> GetPeliculas()
        {
            ServiceResponse<List<Pelicula>> response = new();

            var peliculas = await _context.Pelicula.ToListAsync();

            if (peliculas == null)
            {
                response.Success = false;
                response.Message = "No se encontraron peliculas registradas.";
                return response;
            }
            else
            {
                response.Success = true;
                response.Data = peliculas;
                response.Message = $"{peliculas.Count} peliculas encontradas.";
                return response;
            }
        }
    }
}
