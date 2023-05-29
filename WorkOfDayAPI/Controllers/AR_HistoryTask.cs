using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Data;
using WorkOfDayAPI.Models;
using WorkOfDayAPI.Utilities;

namespace WorkOfDayAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AR_HistoryTask : ControllerBase
    {

        [HttpPost("AddHistoryTask")]
        public ActionResult AddHistoryTask([FromBody] HistoryTask.AddAR_HistoryTask AddAR_HistoryTask)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { AddAR_HistoryTask.FKTask, AddAR_HistoryTask.FKUser, AddAR_HistoryTask.Comentary, AddAR_HistoryTask.Date};
                dataTable = QHelper.ExecGetDataTable("dbo.Up_AddHistoryTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("DelHistoryTask")]
        public ActionResult DelHistoryTask([FromBody] HistoryTask.DelAR_HistoryTask DelAR_HistoryTask)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { DelAR_HistoryTask.FKTask, DelAR_HistoryTask.FKUser, DelAR_HistoryTask.Date };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_DelHistoryTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("UpdHistoryTask")]
        public ActionResult UpdHistoryTask([FromBody] HistoryTask.UpdAR_HistoryTask UpdAR_HistoryTask)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { UpdAR_HistoryTask.FKTask, UpdAR_HistoryTask.FKUser, UpdAR_HistoryTask.Comentary, UpdAR_HistoryTask.Date };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_UpdHistoryTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }

        [HttpPost("GetComentarysByTask")]
        public ActionResult GetComentarysByTask([FromBody] HistoryTask.AddAR_HistoryTask AddAR_HistoryTask)
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                object[] ParamsArray = { AddAR_HistoryTask.FKTask, AddAR_HistoryTask.FKUser, AddAR_HistoryTask.Comentary, AddAR_HistoryTask.Date };
                dataTable = QHelper.ExecGetDataTable("dbo.Up_GetComentarysByTask", ParamsArray); //funcion que genera todo el proceso de query, buscar en utilies.
                return Ok(JsonConvert.SerializeObject(dataTable));
            }
            catch (Exception ex)
            {
                Message = ex.Message;
                return BadRequest(Message);
            }
        }



    }//CLass
}
