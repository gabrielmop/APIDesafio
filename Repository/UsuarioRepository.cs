using APIDesafio.Interfaces;
using APIDesafio.Modelos;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using System;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using APIDesafio.Utils;

namespace APIDesafio.Repository
{
    public class UsuarioRepository : IUsuarioRepository
    {
        //Criar String de conexão com o DB
        readonly string connectionString = "data source=MOOP_PC;Integrated Security =true;Initial Catalog=BRGamersSquare";

        public IActionResult Alterar(int id, Usuarios usuario)
        {
                                           
                SqlConnection conexao = new SqlConnection(connectionString);
                conexao.Open();

                string query = "Update Usuarios Set Nome=@Nome,UserName=@UserName, Senha=@Senha, Email=@Email, Idade=@idade, Imagem=@Imagem Where UsuarioGameId=@id";

                using (SqlCommand cmd = new SqlCommand(query, conexao))
                {
                    cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
                    cmd.Parameters.Add("@Nome", System.Data.SqlDbType.NVarChar).Value = usuario.Name;
                    cmd.Parameters.Add("@UserName", System.Data.SqlDbType.NVarChar).Value = usuario.UserName;
                    cmd.Parameters.Add("@Senha", System.Data.SqlDbType.NVarChar).Value = usuario.Senha;
                    cmd.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar).Value = usuario.Email;
                    cmd.Parameters.Add("@idade", System.Data.SqlDbType.Int).Value = usuario.Idade;
                    cmd.Parameters.Add("@Imagem", System.Data.SqlDbType.NVarChar).Value = usuario.Imagem;

                cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    usuario.Id = id;



                }
                return (IActionResult)usuario;
         
        }

        public string BuscarPorId(int id)
        {
            var usuario = new Usuarios();
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {

                conexao.Open();

                string consulta = "Select * from Usuarios where UsuarioGameId=@id";



                using (SqlCommand cmd = new SqlCommand(consulta, conexao))
                {
                    cmd.Parameters.Add("@id", System.Data.SqlDbType.NVarChar).Value = id;
                    //ler todos os itens da consulta
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            {
                                usuario.Id = (int)reader[0];
                                usuario.Name = (string)reader[1];
                                usuario.UserName = (string)reader[2];
                                usuario.Email = (string)reader[3];


                            }
                        }
                    }
                }
            }
            return usuario.Name;
        }

        public IActionResult Cadastrar(Usuarios user)
        {
              //Abrir a conexão com o banco
                using (SqlConnection conexao = new SqlConnection(connectionString))
                {
                    conexao.Open();

                    //Query de inserção de usuario
                    string query = "INSERT INTO Usuarios (Nome, UserName, senha, email, idade, Imagem) VALUES (@Name, @UserName, @senha,@email, @idade, @Imagem)";

                    using (SqlCommand cmd = new SqlCommand(query, conexao))
                    {
                        //Criamos o comando de execução
                        cmd.Parameters.Add("@Name", System.Data.SqlDbType.NVarChar).Value = user.Name;
                        cmd.Parameters.Add("@UserName", System.Data.SqlDbType.NVarChar).Value = user.UserName;
                        cmd.Parameters.Add("@senha", System.Data.SqlDbType.NVarChar).Value = user.Senha;
                        cmd.Parameters.Add("@email", System.Data.SqlDbType.NVarChar).Value = user.Email;
                        cmd.Parameters.Add("@Idade", System.Data.SqlDbType.Int).Value = user.Idade;
                        cmd.Parameters.Add("@Imagem", System.Data.SqlDbType.NVarChar).Value = user.Imagem;

                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();

                        return null;
                    }

                }


            }
           

        public string Delete(int id)
        {
            //Abrir conexão no banco
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                conexao.Open();

                string query = "Delete from Usuarios Where UsuarioGameId=@id";


                // Criamos o comando de execução no banco
                using (SqlCommand cmd = new SqlCommand(query, conexao))
                {
                    //Fazemos as declarações das variaveis por parametros
                    cmd.Parameters.Add("@id", System.Data.SqlDbType.NVarChar).Value = id;


                    cmd.CommandType = CommandType.Text;
                    int linhasafetadas = cmd.ExecuteNonQuery();
                    if (linhasafetadas == 0)
                    {
                        return "Nenhuma linha afetada";
                    }

                }
            }
            return "Usuario excluido com sucesso";
        }

        public List<Usuarios> Listar()
        {


            var usuario = new List<Usuarios>();
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                conexao.Open();

                string Consulta = "select * from Usuarios";

                using (SqlCommand cmd = new SqlCommand(Consulta, conexao))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            usuario.Add(new Usuarios
                            {
                                Id = (int)reader[0],
                                Name = (string)reader[1],
                                UserName = (string)reader[2],
                                Senha = (string)reader[3],
                                Email = (string)reader[4],
                                Idade = (int)reader[5],
                                Imagem = (string)reader[6].ToString(),

                            });
                        }
                    }
                }

            }
            return usuario;
        }

        public string RegistrarLog(DateTime dataHora, int TipoEvento, string Mensagem, string Exception)
        {
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                conexao.Open();

                string query = "insert into Logs (DataHora, TipoEvento, Mensagem, Exception) values (@dataHora, @TipoEvento, @Mensagem, @Exception)";

                using (SqlCommand cmd = new SqlCommand(query, conexao))
                {
                    //Criamos o comando de execução
                    cmd.Parameters.Add("@DataHora", System.Data.SqlDbType.DateTime2).Value = dataHora;
                    cmd.Parameters.Add("@TipoEvento", System.Data.SqlDbType.Int).Value = TipoEvento;
                    cmd.Parameters.Add("@Mensagem", System.Data.SqlDbType.VarChar).Value = Mensagem;
                    cmd.Parameters.Add("@Exception", System.Data.SqlDbType.VarChar).Value = Exception;


                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }
                return "Log cadastrado com sucesso";

            }

        }
    }
}
