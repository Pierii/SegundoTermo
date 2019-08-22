using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai.Filmes.WebApi.Domains;
using Senai.Filmes.WebApi.Repositories;

namespace Senai.Filmes.WebApi.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class GenerosController : ControllerBase
    {
        GeneroRepository GeneroRepository = new GeneroRepository();

        [HttpGet]
        public IEnumerable<GeneroDomain> Listar()
        {
            return GeneroRepository.Listar();
        }

        [HttpGet("{id}")]
        public IActionResult BuscarPorId(int id)
        {
            GeneroDomain Estilo = GeneroRepository.BuscarPorId(id);
            if (Estilo == null)
            {
                return NotFound();
            }
            return Ok(Estilo);
        }

        [HttpPost]
        public IActionResult Cadastrar(GeneroDomain generoDomain)
        {
            GeneroRepository.Cadastrar(generoDomain);
            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult Atualizar(int id, GeneroDomain genero)
        {
            genero.IdGenero = id;
            GeneroRepository.Atualizar(genero);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Deletar(int id)
        {
            GeneroRepository.Deletar(id);
            return Ok();
        }
    }
}