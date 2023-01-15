using APIDesafio.Interfaces;
using APIDesafio.Modelos;

using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace APIDesafio.Repository
{
    public class PostagemRepository : IPostagemRepository
    {

        readonly string connectionString = "data source=MOOP_PC;Integrated Security =true;Initial Catalog=BRGamersSquare";


        public string ApagarPostagem(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "Delete from Postagem where PostagemID=@id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;

                    cmd.CommandType = CommandType.Text;
                    var linhasAfetadas = cmd.ExecuteNonQuery();
                    if (linhasAfetadas == 0)
                    {
                        return "Postagem Não encontrada";
                    }
                   
                }
            }
            return $"Usuario {id} excluido com sucesso";
        }

        public string EditarPostagem(int id, Postagem Post)
        {
            SqlConnection conexao = new SqlConnection(connectionString);
            conexao.Open();

            string query = "update Postagem set TextoPostagem=@TextoPostagem, Imagem=@Imagem, DataHora=@DataHora, UsuarioGameId=@UsuarioGameId where PostagemId=@id";

            using (SqlCommand cmd = new SqlCommand(query, conexao))
            {
                
                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@TextoPostagem", System.Data.SqlDbType.NVarChar).Value = Post.TextoPostagem;
                cmd.Parameters.Add("@Imagem", System.Data.SqlDbType.NVarChar).Value=Post.Imagem;
                cmd.Parameters.Add("@DataHora", System.Data.SqlDbType.DateTime).Value = Post.DataHora;
                cmd.Parameters.Add("@UsuarioGameId", System.Data.SqlDbType.Int).Value = Post.UsuarioGameId;

                cmd.CommandType= CommandType.Text;
                cmd.ExecuteNonQuery();
                Post.PostagemId = id;
                
            }
            return $"a Postagem de Id {id} Foi alterada em {DateTime.Now}";

        }

        public List<Postagem> ListarPostagem()
        {
           var Lista = new List<Postagem>();

           string consulta = "select * from Postagem";

            using (SqlConnection Conexao = new SqlConnection(connectionString))
            {
                Conexao.Open();

                using (SqlCommand com = new SqlCommand(consulta, Conexao))
                {
                    using (SqlDataReader reader = com.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Lista.Add(new Postagem
                            {
                                PostagemId = (int)reader[0],
                                TextoPostagem = (string)reader[1],
                                Imagem = (string)reader[2],
                                DataHora = (DateTime)reader[3],
                                UsuarioGameId = (int)reader[4],


                            });
                        }
                    }
                }
            }
            return Lista;
        }

        public IActionResult NovaPostagem(Postagem Post)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "insert into Postagem (TextoPostagem, Imagem, DataHora, UsuarioGameId) Values (@TextoPostagem, @Imagem, @DataHora, @UsuarioGameId)";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.Add("@TextoPostagem", System.Data.SqlDbType.NVarChar).Value = Post.TextoPostagem;
                    cmd.Parameters.Add("@Imagem", System.Data.SqlDbType.NVarChar).Value = Post.Imagem;
                    cmd.Parameters.Add("@DataHora", System.Data.SqlDbType.DateTime).Value = Post.DataHora;
                    cmd.Parameters.Add("UsuarioGameId", System.Data.SqlDbType.Int).Value = Post.UsuarioGameId;

                    cmd.CommandType= CommandType.Text;
                    cmd.ExecuteNonQuery();

                    return null;
                }
            }


        }

       
    }
}
