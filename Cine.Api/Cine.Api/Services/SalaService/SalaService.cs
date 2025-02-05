using Cine.Api.Models;
using Microsoft.EntityFrameworkCore;

namespace Cine.Api.Services.SalaService
{
    public class SalaService : ISalaService
    {
        private readonly DataContext _context;

        public SalaService(DataContext context)
        {
            _context = context;
        }
        public async Task<ServiceResponse<List<Sala>>> GetSalas()
        {
            ServiceResponse<List<Sala>> response = new();

            var salas = await _context.Sala.ToListAsync();

            if (salas == null)
            {
                response.Success = false;
                response.Message = "No se encontraron salas registradas.";
                return response;
            }
            else
            {
                response.Success = true;
                response.Data = salas;
                response.Message = $"{salas.Count} salas encontradas.";
                return response;
            }
        }
    }
}
