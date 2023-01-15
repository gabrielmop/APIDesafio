using APIDesafio.Modelos;
using APIDesafio.Repository;
using APIDesafio.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace APIDesafio.Controllers
{
    
    [ApiController]
    public class PostagemController : ControllerBase
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
            try
            {
                Repositorio.ApagarPostagem(id);
                _log.RegistrarLog(DateTime.Now, 1, $"A Postagem de Id {id} foi apagada do sistema", "Nenhum Erro encontrado");
                _email.EnviarEmail("Postagem Apagada", $"Olá Gabriel, A postagem de Id {id} foi apagada em {DateTime.Now}");

                return $"A Postagem de ID {id} foi excluida com sucesso";
            }
            catch (System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 0, $"Ocorreu um erro", ex.Message);
                return "Um erro foi encontrado";
            }


        }

        [HttpPost("Cadastrar_Postagem")]
        public IActionResult Novapostagem([FromForm] Postagem Post, IFormFile Arquivo)
        {

            try
            {
                string[] ExtensoesPermitidas = { "Jpeg", "jpg", "png", "svg" };
                string UploadResultado = Upload.UploadArquivo(Arquivo, ExtensoesPermitidas, "Images");

                if (UploadResultado == "")
                {
                    return BadRequest("Arquivo Não encontrado ou extensão não permitida");
                }
                Post.Imagem = UploadResultado;

                Repositorio.NovaPostagem(Post);
                _log.RegistrarLog(DateTime.Now, 1, $"O Usuario de ID {Post.UsuarioGameId} fez uma nova postagem em {DateTime.Now}", "Nenhum Erro encontrado");
                _email.EnviarEmail("Nova Postagem", $"Olá Gabriel, O usuario de ID {Post.UsuarioGameId} fez uma nova postagem em {DateTime.Now}");

                return Ok(Post);
            }
            catch(System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 0, $"Ocorreu um erro", ex.Message);
                return BadRequest("Um Erro Foi Encontrado, Verifique o log de serviço para mais detalhes");
            }
        }

        [HttpPut("Alterar_Postagem/{id}")]
        public string EditarPostagem(int id, [FromForm] Postagem Post, IFormFile Arquivo)
        {
            try
            {
                string[] ExtensoesPermitidas = { "Jpeg", "jpg", "png", "svg" };
                string UploadResultado = Upload.UploadArquivo(Arquivo, ExtensoesPermitidas, "Images");

                if (UploadResultado == "")
                {
                    return "Arquivo Não encontrado ou extensão não permitida";
                }
                Post.Imagem = UploadResultado;

                Repositorio.EditarPostagem(id,Post);
                _log.RegistrarLog(DateTime.Now, 1, $"Postagem de id {id}, foi alterada", "Nenhum Erro encontrado");
                _email.EnviarEmail("Postagem Alterada", $"Olá Gabriel, a Postagem de Id {id} Foi alterada em {DateTime.Now}");
                return $"Postagem de Id {id} Alterada Com sucesso";

            }
            catch (System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 0, $"Ocorreu um erro", ex.Message);
                return "Um Erro Foi Encontrado, Verifique o log de serviço para mais detalhes";
            }


        }

    }
}
