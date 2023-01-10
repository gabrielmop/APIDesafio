using System;
using System.ComponentModel.DataAnnotations;

namespace APIDesafio.Modelos
{
    public class Postagem
    {

        public int Id { get; set; }

        [Required]
        public string TextoPostagem { get; set; }

        public string Imagem { get; set; }

        
        public DateTime DataHora { get; set; } = DateTime.Now;

        [Required]
        public int UsuarioGameId { get; set; }



    }
}
