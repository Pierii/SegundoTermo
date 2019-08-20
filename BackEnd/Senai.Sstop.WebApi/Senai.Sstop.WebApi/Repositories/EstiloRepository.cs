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
        List<EstiloDomain> estilos = new List<EstiloDomain>()
            {
                new EstiloDomain { IdEstilo= 1, Nome = "Rock"}
                ,new EstiloDomain { IdEstilo= 2, Nome = "Pop"}
                ,new EstiloDomain { IdEstilo= 3, Nome = "Rap"}
            };

        private string StringConexao =
            "Data Source=.\\SqlExpress; Initial catalog=M_SStop; User Id=sa; Pwd=132";

        public void Cadastrar(EstiloDomain estilo)
        {
            string Query = "INSERT INTO Estilos (Nome) VALUES (@Nome)";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@Nome", estilo.Nome);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public EstiloDomain BuscarPorId(int id)
        {
            string Query = "SELECT IdEstilo, Nome FROM Estilos WHERE IdEstilo = @IdEstilo";

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
                                IdEstilo = Convert.ToInt32(sdr["IsEstilo"]),
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
                using (SqlConnection con = new SqlConnection(StringConexao))
                {
                string Query = "SELECT IdEstilo, Nome FROM Estilos ORDER BY IdEstilo asc";


                con.Open();

                SqlDataReader rdr;

                using (SqlCommand cmd = new SqlCommand(Query, con))

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
                return estilos;
        }

        public void Alterar(EstiloDomain estiloDomain)
        {
            string Query = "UPDATE Estilos SET Nome = @Nome WHERE IdEstilo = @IdEstilo";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@Nome", estiloDomain.Nome);
                cmd.Parameters.AddWithValue("@IdEstilo", estiloDomain.IdEstilo);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void Deletar(int id)
        {
            string Query = "DELETE FROM Estilos WHERE IdEstilo = @IdEstilo";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@IdEstilo", id);

                con.Open();
                
                cmd.ExecuteNonQuery();
            }
        }
    }
}
