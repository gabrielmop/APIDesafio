using Microsoft.AspNetCore.Http;
using System;
using System.IO;
using System.Net.Http.Headers;
using System.Net.Mime;

namespace APIDesafio.Utils
{
    //Singleton -> Estatica
    public static class Upload
    {
        //Upload de imagem
        public static string UploadArquivo(IFormFile arquivo, string[] extensoesPermitidas, string v)
        {
            try
            {
                //Definir onde será salvo
                var Pasta = Path.Combine("StaticFiles","Images");
                var Caminho = Path.Combine(Directory.GetCurrentDirectory(), Pasta);

                //Verificar se existe arquivo para ser salvo
                if(arquivo.Length> 0)
                {
                    //Validamos a extensao
                    string NomeArquivo = ContentDispositionHeaderValue.Parse(arquivo.ContentDisposition).FileName.Trim('"'); 
                    if (ValidarExtensao(extensoesPermitidas, NomeArquivo))
                    {
                        var extensao = RetornarExtensao(NomeArquivo);
                        var NovoNome = $"{Guid.NewGuid()}.{extensao}";
                        var CaminhoCompleto = Path.Combine(Caminho, NovoNome);

                        //Salvar o ARquivo
                        using (var stream = new FileStream(CaminhoCompleto, FileMode.Create))
                        {
                            arquivo.CopyTo(stream);
                        }
                        return NovoNome;
                    }
                }
                return "";
            }
            catch (System.Exception ex)
            {

                return ex.Message;  
            }
           
        }
        //Validar Extensões de arquivo
        public static bool ValidarExtensao(string[] ExtensoesPermitidas, string NomeArquivo)
        {
            string extensao = RetornarExtensao(NomeArquivo);
            foreach (string ext in ExtensoesPermitidas)
            {
                if (ext == extensao)
                {
                    return true;
                }
            }
            return false;
        }
        //Remover Arquivo

        //Retornar A Extensão de arquivo
        public static string RetornarExtensao(string NomeArquivo)
        {
            string[] Dados = NomeArquivo.Split('.');
            return Dados[Dados.Length - 1];
        }

    }
}
