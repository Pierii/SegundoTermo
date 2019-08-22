using Senai.Sstop.WebApi.Domains;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Senai.Sstop.WebApi.Repositories
{
    public class EstiloRepository
    {
        //List<EstiloDomain> estilos = new List<EstiloDomain>()
        //{
        //    new EstiloDomain { IdEstilo = 1, Nome = "Rock" }
        //    ,new EstiloDomain { IdEstilo = 2, Nome = "Alternativo" }
        //};

        private string StringConexao = "Data Source=localhost; initial catalog=M_SStop; Integrated Security=true";

        // private string StringConexao = "Data Source=.\\SqlExpress; initial catalog=M_SStop;User Id=sa;Pwd=132;";

        /// <summary>
        /// Cadastrar um novo estilo
        /// </summary>
        /// <param name="estilo"></param>
        public void Cadastrar(EstiloDomain estilo)
        {
            string Query = "INSERT INTO Estilo (Nome) VALUES (@Nome)";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // declara o comando com a query e a conexao
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@Nome", estilo.Nome);
                // abre a conexao
                con.Open();
                // executa o comando
                cmd.ExecuteNonQuery();
            }
        }

        public EstiloDomain BuscarPorId(int id)
        {
            string Query = "SELECT IdEstilo, Nome FROM Estilo WHERE IdEstilo = @IdEstilo";

            // aonde, em qual local
            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                con.Open();
                SqlDataReader sdr;

                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@IdEstilo", id);
                    sdr = cmd.ExecuteReader();

                    if (sdr.HasRows)
                    {
                        while (sdr.Read())
                        {
                            EstiloDomain estilo = new EstiloDomain
                            {
                                IdEstilo = Convert.ToInt32(sdr["IdEstilo"]),
                                Nome = sdr["Nome"].ToString()
                            };
                            return estilo;
                        }
                    }

                    return null;
                }
            }

        }

        public List<EstiloDomain> Listar()
        {

            List<EstiloDomain> estilos = new List<EstiloDomain>();

            // abrir uma conexao com o banco
            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // fazer a leitura de todos os registros
                // declarar a instrucao a ser realizada
                string Query = "SELECT IdEstilo, Nome FROM Estilo ORDER BY Nome DESC";

                // abre a conexao com o bd
                con.Open();
                // declaro para percorrer a lista
                SqlDataReader rdr;

                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    // executa a query
                    rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {
                        EstiloDomain estilo = new EstiloDomain
                        {
                            IdEstilo = Convert.ToInt32(rdr["IdEstilo"]),
                            Nome = rdr["Nome"].ToString()
                        };
                        estilos.Add(estilo);
                    }

                }

            }

            // devolver a lista preenchida
            return estilos;
        }

        // update
        public void Alterar(EstiloDomain estiloDomain)
        {
            string Query = "UPDATE Estilo SET Nome = @Nome WHERE IdEstilo = @IdEstilo";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // faco o comando
                SqlCommand cmd = new SqlCommand(Query, con);
                // defino os parametros
                cmd.Parameters.AddWithValue("@Nome", estiloDomain.Nome);
                cmd.Parameters.AddWithValue("@IdEstilo", estiloDomain.IdEstilo);
                // abrir a conexao
                con.Open();
                // executar
                cmd.ExecuteNonQuery();

            }
        }

        public void Deletar(int id)
        {
            string Query = "DELETE FROM Estilo WHERE IdEstilo = @IdEstilo";
            // conexao
            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // comando
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@IdEstilo", id);
                con.Open();
                // executar
                cmd.ExecuteNonQuery();
            }
        }

    }
}