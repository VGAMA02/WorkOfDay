using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Data;
using WorkOfDayAPI.Utilities;
using WorkOfDayAPI.Models;
using static WorkOfDayAPI.Models.Tasks;

namespace WorkOfDayAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TaskController : ControllerBase
    {


        [HttpGet("GetAllAvailableTask")]
        public ActionResult GetAllAvailableTask()
        {
            var Message = String.Empty;
            try
            {
                //[dbo].[Up_GetTasksByAssignedUser]
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetAllAvailableTasks"); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("GetTaskByAssignedUser")]
        public ActionResult GetTaskByAssignedUser([FromBody] Tasks.GetTaskByAssignedUser getTask)
        {
            var Message = String.Empty;
            try
            {
                //[dbo].[Up_GetTasksByAssignedUser]
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = {getTask.FKUser};
                dataTable = QHelper.ExecGetDataTable("dbo.Up_GetTasksByAssignedUser", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpGet("GetTaskByAssignedUserAndCategory")]
        public ActionResult GetTaskByAssignedUserAndCategory([FromBody] Tasks.GetTaskByAssignedUserAndCategory getTask)
        {
            var Message = String.Empty;
            try
            {
                //[dbo].[Up_GetTasksByAssignedUser]
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { getTask.FKUser, getTask.FKCategory };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_GetTasksByAssignedUserAndCategory", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostAddTask")]
        public ActionResult PostAddTask([FromBody] Tasks.AddTask addTask)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { addTask.FKAssignedUser, addTask.FKCategory, addTask.FKLastUpdater, addTask.FKCreatorUser, addTask.FKStatus, addTask.Name, addTask.Description,addTask.StartDate,addTask.EndDate, addTask.LastUpdate };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AddTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));

            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostUpdTask")]
        public ActionResult PostUpdTask([FromBody] Tasks.UpdTask UpdTask)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { UpdTask.PKTask, UpdTask.FKAssignedUser, UpdTask.FKCategory, UpdTask.FKLastUpdater, UpdTask.FKCreatorUser, UpdTask.FKStatus, UpdTask.Name, UpdTask.Description, UpdTask.StartDate, UpdTask.EndDate, UpdTask.LastUpdate };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_UpdTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));

            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("PostDelTask")]
        public ActionResult PostDelTask([FromBody] Tasks.DelTask delTask)
        {
            var Message = string.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { delTask.FKAssignedUser, delTask.FKCategory, delTask.FKCreatorUser, delTask.StartDate};
                dataTable = QHelper.ExecGetDataTable("dbo.Up_DelTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }




    }//class
}
