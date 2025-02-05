using Cine.Api.Models;
using Cine.Api.Services.SalaService;

namespace Cine.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalaController : ControllerBase
    {
        private readonly ISalaService _salaService;
        public SalaController(ISalaService salaService)
        {
            _salaService = salaService;
        }

        [HttpGet]
        [Route("GetSalas")]
        public async Task<ActionResult<ServiceResponse<List<Sala>>>> GetSalas()
        {
            var result = await _salaService.GetSalas();
            return Ok(result);
        }
    }
}
