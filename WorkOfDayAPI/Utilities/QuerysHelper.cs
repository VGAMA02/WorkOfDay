namespace WorkOfDayAPI.Utilities
{
    public class QuerysHelper
    {
        public Microsoft.Data.SqlClient.SqlConnection returnConnection()
        {
            var Message = string.Empty;
            try
            {
                var builder = WebApplication.CreateBuilder();
                string connectionString = builder.Configuration.GetSection("DefaultConnection").Value.ToString();
                var connection = new Microsoft.Data.SqlClient.SqlConnection(connectionString);
                return connection;
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return null;
            }

        }

        private string BuildStoreProcedureCommand(out string ExceptionMessage, string object_id, params object[] args) //funcion para generar la cadena de ejecucion del store procedure se utiliza en otra funcion para conseguir el datatable directo.
        {
            try
            {
                ExceptionMessage = string.Empty;
                string cmdText = string.Concat("EXEC ", object_id);

                if (args != null && args.Length > 0)
                {

                    for (int i = 0; i < args.Length; i++)
                    {
                        if (args[i] == null)
                        {
                            cmdText = string.Concat(cmdText, " null", ((i < (args.Length - 1)) ? "," : string.Empty));
                        }
                        else
                        {
                            string type = args[i].GetType().ToString().ToLower();
                            Type OType = args[i].GetType();

                            if (type.EndsWith("char") || type.EndsWith("string"))
                                cmdText = string.Concat(cmdText, " '", (string)args[i], "'", ((i < (args.Length - 1)) ? "," : string.Empty));
                            else if (type.EndsWith("datetime"))
                                cmdText = string.Concat(cmdText, " '", ((DateTime)args[i]).ToString("yyyy-MM-dd HH:mm:ss"), "'", ((i < (args.Length - 1)) ? "," : string.Empty));
                            else
                                cmdText = string.Concat(cmdText, " ", args[i], ((i < (args.Length - 1)) ? "," : string.Empty));
                        }
                    }
                }

                return cmdText;
            }
            catch (Exception ex)
            {
                ExceptionMessage = ex.Message;
                return ExceptionMessage;
            }
        }


        //Conseguir dataTable directo
        public System.Data.DataTable ExecGetDataTable(string object_id, params object[] args)
        {
            string ExceptionMessage = string.Empty;
            var connection = returnConnection();
            if (connection == null) throw new ArgumentException("Connection is null", nameof(connection));
            connection.Open();
            var StoreCommand = BuildStoreProcedureCommand(out ExceptionMessage, object_id, args);
            if (ExceptionMessage.Length > 0) throw new Exception(ExceptionMessage);
            var ODataSource = new System.Data.DataTable();
            var CommandData = new Microsoft.Data.SqlClient.SqlCommand(StoreCommand, connection);
            //CommandData.CommandTimeout = (vTo > 0) ? vTo : 120;
            var ODA = new Microsoft.Data.SqlClient.SqlDataAdapter(CommandData);
            ODA.Fill(ODataSource);
            connection.Close();
            return ODataSource;
        }

        public System.Data.DataTable ExecGetDataTableNonParam(string object_id)
        {
            string ExceptionMessage = string.Empty;
            var connection = returnConnection();
            if (connection == null) throw new ArgumentException("Connection is null", nameof(connection));
            connection.Open();
            var StoreCommand = BuildStoreProcedureCommand(out ExceptionMessage, object_id, null);
            if (ExceptionMessage.Length > 0) throw new Exception(ExceptionMessage);
            var ODataSource = new System.Data.DataTable();
            var CommandData = new Microsoft.Data.SqlClient.SqlCommand(StoreCommand, connection);
            //CommandData.CommandTimeout = (vTo > 0) ? vTo : 120;
            var ODA = new Microsoft.Data.SqlClient.SqlDataAdapter(CommandData);
            ODA.Fill(ODataSource);
            connection.Close();
            return ODataSource;
        }


    } //QuerysHelper
}
