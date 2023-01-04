using System.Data.SqlClient;
using System.Data;
using System;

namespace APIDesafio.Utils
{
    public class Log
    {
        readonly string connectionString = "data source=MOOP_PC;Integrated Security =true;Initial Catalog=BRGamersSquare";

        public string RegistrarLog(DateTime DataHora , int TipoEvento, string Mensagem, string Exception)
        {
            using (SqlConnection conexao = new SqlConnection(connectionString))
            {
                conexao.Open();

                string query = "insert into Logs (DataHora, TipoEvento, Mensagem, Exception) values (@dataHora, @TipoEvento, @Mensagem, @Exception)";

                using (SqlCommand cmd = new SqlCommand(query, conexao))
                {
                    //Criamos o comando de execução
                    cmd.Parameters.Add("@DataHora", System.Data.SqlDbType.DateTime2).Value = DataHora;
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
