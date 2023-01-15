using APIDesafio.Modelos;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace APIDesafio.Interfaces
{
    public interface IPostagemRepository
    {
        List<Postagem> ListarPostagem();

        public IActionResult NovaPostagem(Postagem Post);

        public string ApagarPostagem(int id);

        public string EditarPostagem(int id, Postagem Post);



    }
}
