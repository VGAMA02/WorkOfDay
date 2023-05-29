using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Data;
using WorkOfDayAPI.Utilities;

namespace WorkOfDayAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        [HttpGet("GetAllCategory")]
        public ActionResult GetAllCategory()
        {
            var Message = String.Empty;
            try
            {
                QuerysHelper QHelper = new QuerysHelper();
                DataTable dataTable = new DataTable();
                dataTable = QHelper.ExecGetDataTableNonParam("dbo.Up_GetCategorys"); //funcion que genera todo el proceso de query, buscar en utilies.
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
