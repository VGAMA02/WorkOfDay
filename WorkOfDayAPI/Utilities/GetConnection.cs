namespace WorkOfDayAPI.Utilities
{
    public class GetConnection
    {
        public Microsoft.Data.SqlClient.SqlConnection returnConnection()
        {
            var builder = WebApplication.CreateBuilder();
            string connectionString = builder.Configuration.GetSection("DefaultConnection").Value.ToString();
            var connection = new Microsoft.Data.SqlClient.SqlConnection(connectionString);
            return connection;
        }
    }
}
