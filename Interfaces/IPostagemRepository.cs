using APIDesafio.Modelos;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace APIDesafio.Interfaces
{
    public interface IPostagemRepository
    {
        List<Postagem> ListarPostagem();

        public IActionResult NovaPostagem(Postagem Post);

        public string ApagarPostagem(int id);



    }
}
