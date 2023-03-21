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
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {

        private UsuarioRepository Repositorio = new UsuarioRepository();
        private Email _Email = new Email();  
        private Log _log = new Log();


        //Post - Cadastrar

        [HttpPost("Cadastrar_usuarios")]
        public  IActionResult Cadastrar([FromForm]Usuarios user, IFormFile Arquivo)
        {
            try
            {
                string[] ExtensoesPermitidas = { "Jpeg", "jpg", "png", "svg" };
                string UploadResultado = Upload.UploadArquivo(Arquivo, ExtensoesPermitidas, "Images");

                if (UploadResultado == "")
                {
                    return BadRequest("Arquivo Não encontrado ou extensão não permitida");
                }
                user.Imagem = UploadResultado;


                Repositorio.Cadastrar(user);
                _log.RegistrarLog(DateTime.Now, 1, $"O Usuario {user.Name} Foi cadastrado no sistema.", "Nenhum Erro encontrado");
                _Email.EnviarEmail("Usuario Adicionado", $"Olá, Gabriel, O usuario {user.UserName} foi adicionado em {DateTime.Now}");

                return Ok(user);
            }
            catch (System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 0, $"Ocorreu um erro, Verifique a coluna Exception para mais detalhes", ex.Message);
                return BadRequest("Um Erro Foi Encontrado, Verifique o log de serviço para mais detalhes");

            }




        }


        //Alterar
        [HttpPut("Alterar_usuario")]
        public IActionResult Alterar([FromForm] int id,[FromForm] Usuarios usuario)
        {

            try
            {
                Repositorio.BuscarPorId(id);
                if (id == 0)
                {
                    return NotFound("Usuario não encontrado");
                }

                Repositorio.Alterar(id, usuario);
                _log.RegistrarLog(DateTime.Now, 1, $"O Usuario {usuario.Id} Foi alterado.", "Nenhum Erro encontrado");
                _Email.EnviarEmail("Usuario Alterado", $"Olá, Gabriel, O usuario de id {id} foi alterado Para {usuario.Name} em {DateTime.Now}");
                return Ok(usuario);
            }
            catch (System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 1, $"Ocorreu um erro, Verifique a coluna Exception para mais detalhes", ex.Message);
                return BadRequest("Um Erro Foi Encontrado, Verifique o log de serviço para mais detalhes");

            }

        }

        //Get - Listar
        [HttpGet("Listar_Usuarios")]
        public IActionResult Listar()
        {
            try
            {
                var usuarios = Repositorio.Listar();
                return Ok(usuarios);
            }
            catch (System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 1, $"Ocorreu um erro, Verifique a coluna Exception para mais detalhes", ex.Message);
                return BadRequest("Um Erro Foi Encontrado, Verifique o log de serviço para mais detalhes");

            }
        }



        //Deletar
        [HttpDelete("Deletar_Usuario/{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                var BuscarUsuario = Repositorio.BuscarPorId(id);
                if (BuscarUsuario == null)
                {
                    _log.RegistrarLog(DateTime.Now, 1, $"Ocorreu um erro, Verifique a coluna Exception para mais detalhes", "Usuario Não encontrado");
                    return Ok("Usuario não encontrado"); ;

                }
                Repositorio.Delete(id);
                _log.RegistrarLog(DateTime.Now, 1, $"O Usuario de Id {id} Foi apagado do sistema.", "Nenhum Erro encontrado");
                //_Email.EnviarEmail("Usuario Apagado", $"Olá, Gabriel, O usuario de id {id} foi apagado em {DateTime.Now}");
                return Ok($"Usuario {id} foi excluido com sucesso");




            }
            catch (System.Exception ex)
            {
                _log.RegistrarLog(DateTime.Now, 1, $"Ocorreu um erro, Verifique a coluna Exception para mais detalhes", ex.Message);
                return BadRequest("Um Erro Foi Encontrado, Verifique o log de serviço para mais detalhes");
               
            }
        }

     
    }
}

                

            
           