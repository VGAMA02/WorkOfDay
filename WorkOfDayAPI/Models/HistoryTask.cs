namespace WorkOfDayAPI.Models
{
    public class HistoryTask
    {
        public class AddAR_HistoryTask
        {
            public int FKTask { get; set; } = 0;
            public int FKUser { get; set; } = 0;
            public string Comentary { get; set; } = string.Empty;
            public string Date { get; set; } = string.Empty;
        }

        public class UpdAR_HistoryTask
        {
            public int FKTask { get; set; } = 0;
            public int FKUser { get; set; } = 0;
            public string Comentary { get; set; } = string.Empty;
            public string Date { get; set; } = string.Empty;
        }
        public class DelAR_HistoryTask
        {
            public int FKTask { get; set; } = 0;
            public int FKUser { get; set; } = 0;
            public string Date { get; set; } = string.Empty;
        }



       
    }
}
