using Cine.Api.Models;
using Cine.Api.Services.PeliculaService;

namespace Cine.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeliculaController : ControllerBase
    {
        private readonly IPeliculaService _peliculaService;

        public PeliculaController(IPeliculaService peliculaService)
        {
            _peliculaService = peliculaService;
        }

        [HttpGet]
        [Route("GetPeliculas")]
        public async Task<ActionResult<ServiceResponse<List<Pelicula>>>> GetPeliculas()
        {
            var result = await _peliculaService.GetPeliculas();
            return Ok(result);
        }


        [HttpGet]
        [Route("GetPeliculaById")]
        public async Task<ActionResult<ServiceResponse<List<Pelicula>>>> GetPeliculaById([FromQuery]int peliculaId)
        {
            var result = await _peliculaService.GetPeliculaById(peliculaId);
            return Ok(result);
        }
    }
}
