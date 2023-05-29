namespace WorkOfDayAPI.Models
{
    public class User
    {
        public class AddUser
        {
            public int FKRole { get; set; } = 3; //Default para employee
            public string FirstName { get; set; } = string.Empty;
            public string LastName { get; set; } = string.Empty;
            public string Email { get; set; } = string.Empty;
            public string Password { get; set; } = string.Empty;
            public string BirthDay { get; set; } = string.Empty;
        }

        public class DelUser
        {
            public string Email { get; set; } = string.Empty;
        }

        public class UpdUser
        {
            public int FKRole { get; set; } = 0;
            public string FirstName { get; set; } = string.Empty;
            public string LastName { get; set; } = string.Empty;
            public string Email { get; set; } = string.Empty;
            public string Password { get; set; } = string.Empty;
            public string BirthDay { get; set; } = string.Empty;
        }
        public class AuthenticationUser
        {
            public string Email { get; set; } = string.Empty;
            public string Password { get; set; } = string.Empty;
        }


        public class GetUserByEmail
        {
            public string Email { get; set; } = string.Empty;
        }
        public class GetUserByRole
        {
            public string Role { get; set; } = string.Empty;
        }
        public class GetUserByPKUser
        {
            public int PKUser { get; set; } = 0;
        }
    }
}
