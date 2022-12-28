using APIDesafio.Modelos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace APIDesafio.Interfaces
{
    public interface IUsuarioRepository
    {

        public IActionResult Cadastrar(Usuarios user);
        List<Usuarios> Listar();
        IActionResult Alterar(int id, Usuarios usuario);
        string RegistrarLog(DateTime dataHora, int TipoEvento, string Mensagem, string Exception);
        string Delete(int id);
        public string BuscarPorId(int id);
    }
}
