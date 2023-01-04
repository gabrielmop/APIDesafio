using APIDesafio.Modelos;
using APIDesafio.Repository;
using APIDesafio.Utils;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using System.Collections.Generic;

namespace APIDesafio.Controllers
{
    
    [ApiController]
    public class PostagemController
    {
        private PostagemRepository Repositorio = new PostagemRepository();
        private Log _log = new Log();
        private Email _email= new Email();

        [HttpGet("Listar_Postagens")]
        public List<Postagem> ListarPostagem()
        {
            var Postagens = Repositorio.ListarPostagem();
            return Postagens;
        }

        [HttpDelete("Deletar_Postagem/{id}")]
        public string ApagarPostagem(int id)
        {


            Repositorio.ApagarPostagem(id);
            _log.RegistrarLog(DateTime.Now, 1, $"A Postagem de Id {id} foi apagada do sistema", "Nenhum Erro encontrado");
            _email.EnviarEmail("Postagem Apagada", $"Olá Gabriel, A postagem de Id {id} foi apagada em {DateTime.Now}");

            return $"A Postagem de ID {id} foi excluida com sucesso";

        }

    }
}
