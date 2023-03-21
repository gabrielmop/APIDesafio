using System.ComponentModel.DataAnnotations;

namespace APIDesafio.Modelos
{
    public class Usuarios
    {
      
        public int Id { get; set; }

        [Required(ErrorMessage = "O campo Nome é obrigatorio")]
        public string Name { get; set; }

        [Required(ErrorMessage = "O campo Username é obrigatorio")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "O campo Senha é obrigatorio")]
        [MinLength(8)]
        public string Senha { get; set; }

        [Required(ErrorMessage = "O campo Email é obrigatorio")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Informe um email válido")]
        public string Email { get; set; }

        [Required(ErrorMessage ="O Campo idade é obrigatorio")]
        [Range(15, 100)]
        public int Idade { get; set; }

        public string Imagem { get; set; }
    }
}
