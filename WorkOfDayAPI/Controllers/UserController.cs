using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Data;
using WorkOfDayAPI.Models;
using WorkOfDayAPI.Utilities;
using static WorkOfDayAPI.Models.Tasks;
using static WorkOfDayAPI.Models.User;

namespace WorkOfDayAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        [HttpGet("GetAllUsers")]
        public ActionResult GetAllUsers()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetUsers"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("GetUserByEmail")]
        public ActionResult GetUserByEmail([FromBody] User.GetUserByEmail userByEmail)
        {
            var Message = String.Empty; 
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { userByEmail.Email };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_GetUserByEmail", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("GetUserByPKUser")]
        public ActionResult GetUserByPKUser([FromBody] User.GetUserByPKUser GetUserByPKUser)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { GetUserByPKUser.PKUser };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_GetUserByPKUser", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("GetUserByRole")]
        public ActionResult GetUserByRole([FromBody] User.GetUserByRole userByRole)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { userByRole.Role,3};
                dataTable = QHelper.ExecGetDataTable("dbo.Up_GetUserByRole", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("AddUser")]
        public ActionResult AddUser([FromBody] User.AddUser addUser)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { addUser.FKRole, addUser.FirstName, addUser.LastName, addUser.Email, addUser.Password, addUser.BirthDay };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AddUser", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("DelUser")]
        public ActionResult DelUser([FromBody] User.DelUser DelUser)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = {DelUser.Email};
                dataTable = QHelper.ExecGetDataTable("dbo.Up_DelUser", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("UpdUser")]
        public ActionResult UpdUser([FromBody] User.UpdUser UpdUser)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { UpdUser.FKRole, UpdUser.FirstName, UpdUser.LastName, UpdUser.Email, UpdUser.Password, UpdUser.BirthDay };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_UpdUser", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("AuthenticationUser")]
        public ActionResult AuthenticationUser([FromBody] User.AuthenticationUser AuthenticationUser)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { AuthenticationUser.Email, AuthenticationUser.Password};
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AuthenticationUser", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }






    }
}
