using Cine.Api.DTO.Funcion;
using Cine.Api.Models;
using Cine.Api.Services.FuncionService;

namespace Cine.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FuncionController : ControllerBase
    {
        private readonly IFuncionService _funcionService;
        public FuncionController(IFuncionService funcionService)
        {
            _funcionService = funcionService;
        }

        [HttpGet]
        [Route("GetFunciones")]
        public async Task<ActionResult<ServiceResponse<List<VwFuncion>>>> GetFunciones([FromQuery] FuncionConsultaParametros parametros)
        {
            var result = await _funcionService.GetFunciones(parametros);
            return Ok(result);
        }

        [HttpGet]
        [Route("GetFuncionesByPeliculaId")]
        public async Task<ActionResult<ServiceResponse<List<VwFuncion>>>> GetFuncionesByPeliculaId([FromQuery] int peliculaId)
        {
            var result = await _funcionService.GetFuncionesByPeliculaId(peliculaId);
            return Ok(result);
        }
    }
}
