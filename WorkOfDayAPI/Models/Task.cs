namespace WorkOfDayAPI.Models
{
    public class Tasks
    {
        public class AddTask
        {
            public int FKAssignedUser { get; set; } = 0;
            public int FKCategory { get; set; } = 0;
            public int FKLastUpdater { get; set; } = 0;
            public int FKCreatorUser { get; set; } = 0;
            public int FKStatus { get; set; } = 0;
            public string Name { get; set; } = string.Empty;
            public string Description { get; set; } = string.Empty;
            public string StartDate { get; set; } = string.Empty;
            public string EndDate { get; set; } = string.Empty;
            public string LastUpdate { get; set; } = string.Empty;
        }
        public class DelTask
        {
            public int FKAssignedUser { get; set; } = 0;
            public int FKCategory { get; set; } = 0;
            public int FKCreatorUser { get; set; } = 0;
            public string StartDate { get; set; } = string.Empty;
 
        }

        public class UpdTask
        {
            public int PKTask { get; set; } = 0;
            public int FKAssignedUser { get; set; } = 0;
            public int FKCategory { get; set; } = 0;
            public int FKLastUpdater { get; set; } = 0;
            public int FKCreatorUser { get; set; } = 0;
            public int FKStatus { get; set; } = 0;
            public string Name { get; set; } = string.Empty;
            public string Description { get; set; } = string.Empty;
            public string StartDate { get; set; } = string.Empty;
            public string EndDate { get; set; } = string.Empty;
            public string LastUpdate { get; set; } = string.Empty;
        }

        public class GetTaskByAssignedUser
        {
            public int FKUser { get; set; } = 0;
        }

        public class GetTaskByAssignedUserAndCategory
        {
            public int FKUser { get; set; } = 0;
            public int FKCategory { get; set; } = 0;
        }


    }
}
