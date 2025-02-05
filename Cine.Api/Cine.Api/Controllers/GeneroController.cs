using Cine.Api.Models;
using Cine.Api.Services.GeneroService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Cine.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneroController : ControllerBase
    {
        private readonly IGeneroService _generoService;

        public GeneroController(IGeneroService generoService)
        {
            _generoService = generoService;
        }

        [HttpGet]
        [Route("GetGeneros")]
        public async Task<ActionResult<ServiceResponse<List<Genero>>>> GetGeneros()
        {
            var result = await _generoService.GetGeneros();
            return Ok(result);
        }
    }
}
